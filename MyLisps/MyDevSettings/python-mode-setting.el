;; -*- Emacs-Lisp -*-
;;; python-mode-setting.el ---
;; Time-stamp: <2013-04-14 02:32:10 Sunday by lzy>

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
;;   (require 'python-mode-setting)

;;; Code:

(defun python-mode-setting ()
  "setting for python mode"
  ;; required features
  (require 'flymake-python-pyflakes)
  ;; settings
  (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
  ;; key bindings
  (lazy-set-key
   '(("C-x <tab>" . smart-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment)
     ("C-c M-a" . beginning-of-defun)
     ("C-c M-e" . end-of-defun))
   python-mode-map))

(eval-after-load "python"
  '(python-mode-setting))

;;; provide features
(provide 'python-mode-setting)

;;; python-mode-setting.el ends here
