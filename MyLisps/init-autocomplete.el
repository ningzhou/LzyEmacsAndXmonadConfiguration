;; -*- Emacs-Lisp -*-
;;; init-autocomplete.el ---
;; Time-stamp: <2013-03-20 07:15:13 Wednesday by lzy>

;; Copyright (C) 2013 chieftain
;;
;; Author: chieftain <lizhengyu419@gmail.com>
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
;;   (require 'init-autocomplete)

;;; Code:

(require 'auto-complete-config)
(require 'auto-complete-clang)

(defun set-ac-clang-flags ()
  "-I flags for auto-complete clang source"
  (let (begin
        end
        (result nil))
    (if (executable-find "g++")
        (with-temp-buffer
          (shell-command-surpress-popup-window "echo''|g++ -v -x c++ -E -"
                                               (buffer-name (current-buffer)))
          (goto-char (point-min))
          (setq begin (progn
                        (search-forward "#include <...>")
                        (next-line)
                        (line-beginning-position)))
          (setq end (progn
                      (search-forward "End of search list")
                      (previous-line)
                      (line-end-position)))
          (setq result (buffer-substring begin end))))
    (setq ac-clang-flags
          (mapcar (lambda (item)
                    (concat "-I" item))
                  (split-string
                   (concat "./\n./include\n../include\n../../include\n../../../include\n"
                           result))))))

(defadvice ac-error
  (after reopen-ac-mode activate)
  "reopen auto-complete-mode after ac-error"
  (auto-complete-mode 1))

(defun ac-settings-4-lisp ()
  "auto-complete settings for lisp mode"
  (setq ac-sources
        (append
         '(ac-source-features
           ac-source-functions
           ac-source-yasnippet
           ac-source-variables
           ac-source-symbols)
         ac-sources)))

(defun ac-settings-4-cc ()
  "auto-complete settings for cc mode"
  (setq ac-sources
        (append
         '(ac-source-gtags)
         ac-sources)))

(defun ac-settings-4-c/c++ ()
  "auto-complete settings for c/c++ mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-clang)
         ac-sources)))

(defun ac-settings-4-java ()
  "auto-complete settings for java mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-eclim)
         ac-sources)))

(defun ac-settings-4-ruby ()
  "auto-complete settings for ruby mode"
  (setq ac-omni-completion-sources
        '(("\\." . ac-source-rcodetools)
          ("::" . ac-source-rcodetools)))
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-omni-completion-sources
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-text ()
  "auto-complete settings for text mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-org ()
  "auto-complete settings for org mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-nxml ()
  "auto-complete settings for html/xml etc. mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet
           ac-source-css-property
           ac-source-imenu)
         ac-sources)))

(defun ac-settings-4-eshell ()
  "auto-complete settings for eshell mode"
  (setq ac-sources
        (append
         '(ac-source-imenu)
         ac-sources)))

(defun auto-complete-setting ()
  "Settings for `auto-complete'."
  (setq ac-dwim t)
  (setq ac-auto-start 2)
  (setq ac-auto-show-menu 0.8)
  (setq ac-disable-faces nil)
  (setq ac-quick-help-delay 0.5)
  (setq help-xref-following nil)
  (setq ac-candidate-limit 15)
  ;; set clang flags
  (set-ac-clang-flags)
  ;; auto-complete auto start modes
  (add-to-list 'ac-modes 'org-mode)
  (add-to-list 'ac-modes 'text-mode)
  (add-to-list 'ac-modes 'html-mode)
  (add-to-list 'ac-modes 'nxml-mode)
  (add-to-list 'ac-modes 'awk-mode)
  (add-to-list 'ac-dictionary-directories
               (concat my-emacs-site-lisps-path "AutoComplete/auto-complete-1.4-base/dict"))

  (custom-set-variables
   '(ac-trigger-commands-on-completing
     (append '(c-electric-backspace
               c-electric-backspace-kill)
             ac-trigger-commands-on-completing)))

  (setq-default ac-sources
                '(ac-source-abbrev
                  ac-source-dictionary
                  ac-source-words-in-same-mode-buffers
                  ac-source-files-in-current-dir
                  ac-source-filename))
  (global-auto-complete-mode 1)

  ;; add to hook
  (add-hook 'lisp-mode-hook 'ac-settings-4-lisp)
  (add-hook 'emacs-lisp-mode-hook 'ac-settings-4-lisp)
  (add-hook 'lisp-interaction-mode-hook 'ac-settings-4-lisp)
  (add-hook 'c-mode-common-hook 'ac-settings-4-cc)
  (add-hook 'c-mode-hook 'ac-settings-4-c/c++)
  (add-hook 'c++-mode-hook 'ac-settings-4-c/c++)
  (add-hook 'java-mode-hook 'ac-settings-4-java)
  (add-hook 'ruby-mode-hook 'ac-settings-4-ruby)
  (add-hook 'text-mode-hook 'ac-settings-4-text)
  (add-hook 'org-mode-hook 'ac-settings-4-org)
  (add-hook 'html-mode-hook 'ac-settings-4-nxml)
  (add-hook 'xml-mode-hook 'ac-settings-4-nxml)
  (add-hook 'eshell-mode-hook 'ac-settings-4-eshell)

  (lazy-set-key
   '(("M-j" . ac-complete))
   ac-complete-mode-map))

(auto-complete-setting)

;;; provide features
(provide 'init-autocomplete)

;;; init-autocomplete.el ends here
