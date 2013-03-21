;; -*- Emacs-Lisp -*-
;;; cc-mode-setting.el ---
;; Time-stamp: <2013-03-21 18:15:40 Thursday by lzy>

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
;;   (require 'cc-mode-setting)

;;; Code:

(defun c/c++-mode-style ()
  "set c/c++ style"
  (c-set-style "stroustrup"))

(defun java-mode-style ()
  "set java style"
  (c-set-style "java"))

(defun awk-mode-style ()
  "set awk style"
  (c-set-style "awk"))

(defun cc-mode-setting ()
  "Setting for `cc-mode'."
  ;; settings
  (setq c-basic-offset 4)
  (c-toggle-electric-state)
  (c-toggle-hungry-state)
  ;; key bindings
  (lazy-set-key
   '(("C-c M-a" . beginning-of-defun)
     ("C-c M-e" . end-of-defun)
     ("<return>" . newline-and-indent)
     ("C-j" . newline-and-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment))
   c-mode-base-map))

(add-hook 'c-mode-common-hook 'cc-mode-setting)
(add-hook 'c-mode-hook 'c/c++-mode-style)
(add-hook 'c++-mode-hook 'c/c++-mode-style)
(add-hook 'java-mode-hook 'java-mode-style)
(add-hook 'awk-mode-hook 'awk-mode-style)

;;; provide features
(provide 'cc-mode-setting)

;;; cc-mode-setting.el ends here
