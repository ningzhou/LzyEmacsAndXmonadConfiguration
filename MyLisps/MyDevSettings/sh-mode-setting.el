;; -*- Emacs-Lisp -*-
;;; sh-mode-setting.el ---
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
;;   (require 'sh-mode-setting)

;;; Code:

(defun sh-mode-setting ()
  "settings for `sh-mode'."
  ;; settings
  (font-lock-add-keywords 'sh-mode
                          '(("\\<\\(local\\|let\\)\\>" . font-lock-keyword-face)))

  ;; key bindings
  (lazy-set-key
   '(("C-c M-c" . sh-case)
     ("C-c C-c" . comment)
     ("C-c k"   . uncomment)
     ("<return>" . newline-and-indent)
     ("C-j" . newline-and-indent))
   sh-mode-map))

(eval-after-load "sh-script"
  '(sh-mode-setting))

;;; provide features
(provide 'sh-mode-setting)

;;; sh-mode-setting.el ends here
