;; -*- Emacs-Lisp -*-
;;; doxymacs-setting.el ---
;; Time-stamp: <2013-04-16 16:33:15 Tuesday by lzy>

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
;;   (require 'doxymacs-setting)

;;; Code:

;; required features

(defun doxymacs-c-style ()
  "doxygen style for c"
  ;; required features
  (require 'doxymacs)
  ;; settings
  ;; local C comment style settings
  (setq doxymacs-doxygen-style "JavaDoc")
  (setq doxymacs-JavaDoc-file-comment-template
        '("/****************************************************" > n
          " * " (doxymacs-doxygen-command-char) "file   "
          (if (buffer-file-name)
              (file-name-nondirectory (buffer-file-name))
            "") > n
            " * " (doxymacs-doxygen-command-char) "author " (user-full-name)
            (doxymacs-user-mail-address)
            > n
            " * " (doxymacs-doxygen-command-char) "date   " (current-time-string) > n
            " * " > n
            " * " (doxymacs-doxygen-command-char) "brief  " (p "Brief description of this file: ") > n
            " * " p > n
            " *****************************************************/" > n))
  (setq doxymacs-JavaDoc-blank-multiline-comment-template
        '("/*" > n "* " p > n "* " > n "*/" > n))
  (setq doxymacs-JavaDoc-function-comment-template
        '((let ((next-func (doxymacs-find-next-func)))
            (if next-func
                (list
                 'l
                 "/*" '> 'n
                 " * " 'p '> 'n
                 " * " '> 'n
                 (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
                 (unless (string-match
                          (regexp-quote (cdr (assoc 'return next-func)))
                          doxymacs-void-types)
                   '(l " * " > n " * " (doxymacs-doxygen-command-char)
                       "return " (p "Returns: ") > n))
                 " */" '>)
              (progn
                (error "Can't find next function declaration.")
                nil)))))
  (doxymacs-mode 1)
  (doxymacs-font-lock))

(defun doxymacs-c++-style ()
  "doxygen style for c"
  ;; required features
  (require 'doxymacs)
  ;; settings
  (setq doxymacs-doxygen-style "C++")
  (doxymacs-mode 1)
  (doxymacs-font-lock))

(defun doxymacs-java-style ()
  "doxygen style for c"
  ;; required features
  (require 'doxymacs)
  ;; settings
  (setq doxymacs-doxygen-style "JavaDoc")
  (doxymacs-mode 1)
  (doxymacs-font-lock))

(add-hook 'c-mode-hook 'doxymacs-c-style)
(add-hook 'c++-mode-hook 'doxymacs-c++-style)
(add-hook 'java-mode-hook 'doxymacs-java-style)

;;; provide features
(provide 'doxymacs-setting)

;;; doxymacs-setting.el ends here
