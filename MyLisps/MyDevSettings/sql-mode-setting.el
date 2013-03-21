;; -*- Emacs-Lisp -*-
;;; sql-mode-setting.el ---
;; Time-stamp: <2013-03-21 14:34:00 Thursday by lzy>

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
;;   (require 'sql-mode-setting)

;;; Code:

(defun sql-mode-setting ()
  "settings for `sql'."
  ;; settings
  ;; key bindings
  (lazy-set-key
   '(("M-m" . comint-previous-matching-input)
     ("M-M" . comint-next-matching-input))
   sql-interactive-mode-map))

(eval-after-load "sql"
  '(sql-mode-setting))

;;; provide features
(provide 'sql-mode-setting)

;;; sql-mode-setting.el ends here
