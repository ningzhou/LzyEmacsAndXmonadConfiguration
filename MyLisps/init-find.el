;; -*- Emacs-Lisp -*-
;;; init-find.el ---
;; Time-stamp: <2013-03-17 02:50:21 Sunday by lzy>

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
;;   (require 'init-find)

;;; Code:

(autoload 'find-dired-lisp "find-dired-lisp" nil t)
(autoload 'find-grep-dired-lisp "find-dired-lisp" nil t)
(autoload 'find-function-or-variable-at-point "find-func-extension" nil t)

(lazy-set-key
 '(("C-x f"   . find-dired-lisp)
   ("C-x F"   . find-grep-dired-lisp)
   ("C-x u"   . find-function-or-variable-at-point)))

;;; provide features
(provide 'init-find)

;;; init-find.el ends here
