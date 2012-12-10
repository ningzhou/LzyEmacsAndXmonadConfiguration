;; -*- Emacs-Lisp -*-
;;; init-autocomplete.el ---
;; Time-stamp: <2012-12-06 17:13:11 Thursday by lzy>

;; Copyright (C) 2012 chieftain
;;
;; Author: chieftain <lizhengyu419@gmail.com>
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-autocomplete)

;;; Code:


(provide 'init-autocomplete)


;; required features
(require 'auto-complete-clang)
(require 'auto-complete-config)

(defvar auto-complete-dict-dir
  (concat my-emacs-site-lisps-path "AutoComplete/auto-complete-1.3.1-base/dict"))

(defadvice ac-error
  (after reopen-ac-mode activate)
  "reopen auto-complete-mode after ac-error"
  (auto-complete-mode 1))

(defun ac-start-use-sources (sources)
  (interactive)
  (let ((ac-sources sources))
    (call-interactively 'ac-start)))

(defun ac-settings-4-autopair ()
  "`auto-complete' settings for `autopair'."
  (defun ac-trigger-command-p (command)
    "Return non-nil if `this-command' is a trigger command."
    (or (and (symbolp command)
             (or (memq command ac-trigger-commands)
                 (string-match "self-insert-command" (symbol-name command))
                 (string-match "electric" (symbol-name command))
                 (let* ((autopair-emulation-alist nil)
                        (key (this-single-command-keys))
                        (beyond-autopair (or (key-binding key)
                                             (key-binding (lookup-key local-function-key-map key)))))
                   (or
                    (memq beyond-autopair ac-trigger-commands)
                    (and ac-completing
                         (memq beyond-autopair ac-trigger-commands-on-completing)))))))))

(defun ac-settings-4-lisp ()
  "Auto complete settings for lisp mode."
  (setq ac-sources
        '(ac-source-features
          ac-source-functions
          ac-source-yasnippet
          ac-source-variables
          ac-source-symbols
          ac-source-dictionary
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-words-in-same-mode-buffers)))

(defun ac-settings-4-cc ()
  "`auto-complete' settings for `cc-mode'."
  (dolist (command `(c-electric-backspace
                     c-electric-backspace-kill))
    (add-to-list 'ac-trigger-commands-on-completing command)))

(defun ac-settings-4-java ()
  (setq ac-sources
        '(ac-source-clang
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-dictionary
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-c ()
  (setq ac-sources
        '(ac-source-clang
          ac-source-yasnippet
          ac-source-dictionary
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-cpp ()
  (setq ac-sources
        '(ac-source-clang
          ac-source-yasnippet
          ac-source-dictionary
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-text ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-imenu)))

(defun ac-settings-4-eshell ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-symbols
          ac-source-imenu)))

(defun ac-settings-4-ruby ()
  (require 'rcodetools-settings)
  (setq ac-omni-completion-sources
        (list (cons "\\." '(ac-source-rcodetools))
              (cons "::" '(ac-source-rcodetools)))))

(defun ac-settings-4-tcl ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-awk ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-org ()
  (setq ac-sources
        '(ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-yasnippet
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-imenu)))

(defun ac-settings-4-html ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-xml ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun auto-complete-settings ()
  "Settings for `auto-complete'."
  (setq ac-dwim t)
  (setq ac-auto-start 2)
  (setq ac-auto-show-menu t)
  (setq ac-disable-faces nil)
  (setq ac-quick-help-delay .5)
  (setq help-xref-following nil)
  (setq ac-candidate-limit ac-menu-height)
  (setq ac-clang-flags
        (mapcar (lambda (item)(concat "-I" item))
                (split-string
                 "./
                  ./include
                  ../include
                  ../../include
                  ../../../include
                  /usr/lib/gcc/i686-pc-linux-gnu/4.7.1/../../../../include/c++/4.7.1
                  /usr/lib/gcc/i686-pc-linux-gnu/4.7.1/../../../../include/c++/4.7.1/i686-pc-linux-gnu
                  /usr/lib/gcc/i686-pc-linux-gnu/4.7.1/../../../../include/c++/4.7.1/backward
                  /usr/lib/gcc/i686-pc-linux-gnu/4.7.1/include
                  /usr/local/include
                  /usr/lib/gcc/i686-pc-linux-gnu/4.7.1/include-fixed
                  /usr/include")))

  ;; auto-complete auto start modes
  (add-to-list 'ac-modes 'org-mode)
  (add-to-list 'ac-modes 'text-mode)
  (add-to-list 'ac-modes 'html-mode)
  (add-to-list 'ac-modes 'nxml-mode)
  
  (add-to-list 'ac-dictionary-directories
               auto-complete-dict-dir)
  (set-default 'ac-sources
               '(ac-source-semantic-raw
                 ac-source-yasnippet
                 ac-source-dictionary
                 ac-source-abbrev
                 ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-imenu
                 ac-source-files-in-current-dir
                 ac-source-filename))
  (global-auto-complete-mode 1)

  ;; add to hook
  (dolist (hook '(lisp-mode-hook
                  emacs-lisp-mode-hook
                  lisp-interaction-mode-hook
                  change-log-mode-hook))
    (add-hook hook 'ac-settings-4-lisp))
  
  (add-hook 'c-mode-common-hook 'ac-settings-4-cc)
  (add-hook 'c-mode-hook        'ac-settings-4-c)
  (add-hook 'c++-mode-hook      'ac-settings-4-cpp)
  (add-hook 'java-mode-hook     'ac-settings-4-java)
  (add-hook 'text-mode-hook     'ac-settings-4-text)
  (add-hook 'eshell-mode-hook   'ac-settings-4-eshell)
  (add-hook 'ruby-mode-hook     'ac-settings-4-ruby)
  (add-hook 'awk-mode-hook      'ac-settings-4-awk)
  (add-hook 'tcl-mode-hook      'ac-settings-4-tcl)
  (add-hook 'org-mode-hook      'ac-settings-4-org)
  (add-hook 'html-mode-hook     'ac-settings-4-html)
  (add-hook 'xml-mode-hook      'ac-settings-4-xml)

  (eval-after-load "autopair"
    '(ac-settings-4-autopair))

  (lazy-set-key
   '(("M-j" . ac-complete))
   ac-complete-mode-map)
  )

(eval-after-load "init-autocomplete"
  '(auto-complete-settings))

;;; init-autocomplete.el ends here
