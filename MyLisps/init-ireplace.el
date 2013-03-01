;; -*- Emacs-Lisp -*-
;;; init-ireplace.el ---
;; Time-stamp: <2012-12-06 17:40:13 Thursday by lzy>

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
;;   (require 'init-ireplace)

;;; Code:


(provide 'init-ireplace)


;; required features
(require 'ireplace)

(lazy-set-key
 '(("C-RET"  .  ireplace-show-changes)
   ("M-%"    .  ireplace-show-changes)
   ("M-e"    .  ireplace-edit-search))
 ireplace-read-map)

(lazy-set-keyo
 '(("C-RET"  .  ireplace)
   ("M-%"    .  ireplace)
   ("M-e"    .  ireplace-individually)
   ("M-RET"  .  ireplace-individually))
 isearch-mode-map)

;;; init-ireplace.el ends here