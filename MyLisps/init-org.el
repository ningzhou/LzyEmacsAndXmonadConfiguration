;; -*- Emacs-Lisp -*-
;;; init-org.el ---
;; Time-stamp: <2013-03-21 18:35:33 Thursday by lzy>

;; Copyright (C) 2013 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@gmail.com>
;; Keywords: none

;; This file is not part of GNU Emacs.

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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-org)

;;; Code:

(defun org-setting ()
  "settings for org mode"
  ;; required features
  (require 'iimage)
  (require 'org-w3m)
  (require 'org-install)
  (require 'org-extension)
  (require 'org-html5presentation-modified-by-lzy)
  ;; settings
  (setq org-directory "~/OrgDir")
  (setq org-tasks-file (concat org-directory "/Agenda.org"))
  (setq org-routines-file (concat org-directory "/Routines.org"))
  (setq org-notes-file (concat org-directory "/Notes.org"))
  (setq org-tricks-file (concat my-emacs-path "/OrgDir/TrickNotes.org"))
  (setq diary-file (concat org-directory "/Diary.org"))
  (setq org-startup-indented nil)
  (setq org-log-done 'note)
  (setq diary-file diary-file)
  (setq org-clock-idle-time 10)
  (setq org-agenda-include-diary t)
  (setq org-clock-persist 'history)
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-agenda-files
        (list org-routines-file
              org-tasks-file
              diary-file))
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
  (setq org-todo-keywords
        '((sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
          (sequence "TODO(t!)" "|" "DONE(d@)" "CANCELED(c@/!)")))
  (org-clock-persistence-insinuate)
  (org-remember-insinuate)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
     (sh . t)
     (ditaa . t)
     (python . t)
     (emacs-lisp . t)
     (clojure . t)
     (css . t)
     (dot . t)
     (gnuplot . t)
     (java . t)
     (js . t)
     (org . t)
     (perl . t)
     (ruby . t)
     (scheme . t)
     (sql . t)))
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-to-list 'iimage-mode-image-regex-alist
               (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                             "\\)\\]")  1))
  ;; hook setting
  (add-hook 'message-mode-hook 'turn-on-orgtbl)
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
  (add-hook 'org-agenda-mode-hook
            '(lambda ()
               (lazy-set-key
                '(("m" . org-agenda-month-view)
                  ("q" . org-agenda-exit))
                org-agenda-mode-map)))
  ;; key bindings
  (lazy-set-key
   '(("M-n" . outline-next-visible-heading)
     ("M-p" . outline-previous-visible-heading)
     ("C-M-p" . org-backward-same-level)
     ("C-M-n" . org-forward-same-level)
     ("C-M-g" . org-plot/gnuplot)
     ("C-j" . newline-and-indent))
   org-mode-map))

(eval-after-load "org"
  '(org-setting))

(autoload 'org-store-link "org" nil t)
(autoload 'org-capture "org-capture" nil t)
(autoload 'org-agenda "org-agenda" nil t)

(lazy-set-key
 '(("C-c o l" . org-store-link)
   ("C-c o c" . org-capture)
   ("C-c o a" . org-agenda)))

;;; provide features
(provide 'init-org)

;;; init-org.el ends here
