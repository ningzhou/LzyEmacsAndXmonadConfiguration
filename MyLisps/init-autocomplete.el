;; -*- Emacs-Lisp -*-
;;; init-autocomplete.el ---
;; Time-stamp: <2013-04-25 11:50:00 Thursday by lzy>

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

(defface popup-mouse-face
  '((t (nil)))
  "Face for popup mouse"
  :group 'popup)

(defadvice ac-error (after reopen-ac-mode activate)
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
         '(ac-source-yasnippet)
         ac-sources)))

(defun ac-settings-4-c/c++ ()
  "auto-complete settings for c/c++ mode"
  ;; required features
  (require 'auto-complete-clang)
  ;; functions definition
  (defun set-ac-clang-flags ()
    "-I flags for auto-complete clang source"
    (let (begin end result)
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
            (mapcar #'(lambda (item)
                        (concat "-I" item))
                    (split-string (concat "./\n./include\n../include\n../../include\n../../../include\n" result))))
      ;; kill command history buffer
      (if (get-buffer ".bash_history")
          (kill-buffer ".bash_history"))))
  ;; settings
  (set-ac-clang-flags)
  (setq ac-sources
        (append
         '(ac-source-clang)
         ac-sources)))

(defun ac-settings-4-python ()
  "auto-complete settings for python mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet)
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

(defun ac-settings-4-markdown ()
  "auto-complete settings for markdown mode"
  (setq ac-sources
        (append
         '(ac-source-yasnippet)
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
         '(ac-source-yasnippet
           ac-source-imenu)
         ac-sources)))

;; basic settings
(setq ac-dwim t)
(setq ac-auto-start 2)
(setq ac-disable-faces nil)
(setq ac-candidate-limit 15)
(setq ac-auto-show-menu 0.4)
(setq ac-quick-help-delay 0.5)
(setq help-xref-following nil)
;; auto-complete auto start modes
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'html-mode)
(add-to-list 'ac-modes 'nxml-mode)
(add-to-list 'ac-modes 'awk-mode)
(add-to-list 'ac-modes 'markdown-mode)
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
(add-hook 'lisp-mode-hook 'ac-settings-4-lisp)
(add-hook 'emacs-lisp-mode-hook 'ac-settings-4-lisp)
(add-hook 'lisp-interaction-mode-hook 'ac-settings-4-lisp)
(add-hook 'c-mode-common-hook 'ac-settings-4-cc)
(add-hook 'c-mode-hook 'ac-settings-4-c/c++)
(add-hook 'c++-mode-hook 'ac-settings-4-c/c++)
(add-hook 'python-mode-hook 'ac-settings-4-python)
(add-hook 'text-mode-hook 'ac-settings-4-text)
(add-hook 'org-mode-hook 'ac-settings-4-org)
(add-hook 'markdown-mode-hook 'ac-settings-4-markdown)
(add-hook 'html-mode-hook 'ac-settings-4-nxml)
(add-hook 'xml-mode-hook 'ac-settings-4-nxml)
(add-hook 'eshell-mode-hook 'ac-settings-4-eshell)
;; key bindings
(lazy-set-key '(("M-j" . ac-complete)) ac-complete-mode-map)
;; enable global auto-complete mode
(global-auto-complete-mode 1)

;;; provide features
(provide 'init-autocomplete)

;;; init-autocomplete.el ends here
