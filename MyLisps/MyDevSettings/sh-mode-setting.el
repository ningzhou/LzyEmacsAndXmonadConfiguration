;; -*- Emacs-Lisp -*-
;;; sh-mode-setting.el ---
;; Time-stamp: <2013-04-14 01:11:06 Sunday by lzy>

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
;;   (require 'sh-mode-setting)

;;; Code:

(defun sh-mode-setting ()
  "settings for `sh-mode'."
  ;; required features
  (require 'flymake-shell)
  ;; settings
  (add-hook 'sh-set-shell-hook 'flymake-shell-load)
  ;; key bindings
  (lazy-set-key
   '(("C-c M-c" . sh-case)
     ("C-x <tab>" . smart-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment)
     ("C-c M-a" . beginning-of-defun)
     ("C-c M-e" . end-of-defun))
   sh-mode-map))

(eval-after-load "sh-script"
  '(sh-mode-setting))

;;; provide features
(provide 'sh-mode-setting)

;;; sh-mode-setting.el ends here
