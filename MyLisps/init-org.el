;;; init-org.el --- 
;; Time-stamp: <2013-03-13 17:10:11 Wednesday by lzy>

;; Copyright (C) 2012  zhengyu li

;; Author: zhengyu li <lizhengyu419@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:


(provide 'init-org)


;; required features
(require 'org)

(defun org-setting ()
  "setting for org mode"
  ;; required features
  (require 'iimage)
  (require 'org-w3m)
  (require 'org-install)
  (require 'org-extension)
  (require 'auto-complete)
  (require 'org-html5presentation-modified-by-lzy)

  ;; setting
  (setq org-directory "~/OrgDir")
  (setq org-tasks-file (concat org-directory "/Agenda.org"))
  (setq org-routines-file (concat org-directory "/Routines.org"))
  (setq org-notes-file (concat org-directory "/Notes.org"))
  (setq org-tricks-file (concat my-emacs-path "/OrgDir/TrickNotes.org"))
  (setq diary-file (concat org-directory "/Diary.org"))
  (setq org-startup-indented t)
  (setq org-log-done 'note)                  ;log type
  (setq diary-file diary-file)               ;diary file
  (setq org-clock-idle-time 10)              ;ilde time to resolve
  (setq org-enable-table-editor 1)           ;use built-in table editor
  (setq org-agenda-include-diary t)          ;integrate diary
  (setq org-clock-persist 'history)
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-agenda-exporter-settings
        '((ps-bumber-of-columns 2)
          (ps-landscape-mode t)
          (org-agenda-add-entry-text-maxlines 5)
          (htmlize-output-type 'css)))
  (setq org-capture-templates
        `(("t" "Todo" entry (file+headline ,org-tasks-file "Tasks")
           "* TODO %?\n %i\n %a")
          ("r" "Routines" entry (file+headline ,org-routines-file "Routines")
           "* TODO %?\n %i\n %a")
          ("n" "Notes" entry (file+headline ,org-notes-file "Notes")
           "* %^{Title}\n %i\n %a")
          ("T" "TrickNotes" entry (file+headline ,org-tricks-file "Tricks")
           "* %^{Title}\n %i\n %a")))
  (setq org-agenda-files
        (list org-routines-file
              org-tasks-file
              diary-file))

  (setq org-todo-keywords
        '((sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
          (sequence "TODO(t!)" "|" "DONE(d@)" "CANCELED(c@/!)")
          ))

  (org-clock-persistence-insinuate)
  (org-remember-insinuate)                   ;Org-remeber initialization
  (org-babel-do-load-languages 'org-babel-load-languages '((C . t)
                                                           (sh . t)
                                                           (ditaa . t)
                                                           (python . t)
                                                           (emacs-lisp . t)))
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-to-list 'iimage-mode-image-regex-alist
               (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                             "\\)\\]")  1))
  (add-hook 'message-mode-hook 'turn-on-orgtbl) ;enable orgtbl in Text and Mail mode
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  ;; local key bindings
  (lazy-set-key
   '(("M-n" . outline-next-visible-heading)
     ("M-p" . outline-previous-visible-heading)
     ("C-M-p" . org-backward-same-level)
     ("C-M-n" . org-forward-same-level)
     ("C-M-g" . org-plot/gnuplot)
     ("RET" . newline-and-indent)
     ("C-j" . newline-and-indent))
   org-mode-map)

  (lazy-set-key
   '(("m" . org-agenda-month-view))
   org-agenda-mode-map)
  )

(eval-after-load "init-org"
  '(org-setting))

;; global key bindings
(lazy-set-key
 '(("C-c o l" . org-store-link)
   ("C-c o c" . org-capture)
   ("C-c o a" . org-agenda)))

;;; init-org.el ends here
