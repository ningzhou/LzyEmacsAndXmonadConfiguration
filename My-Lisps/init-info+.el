;; -*- Emacs-Lisp -*-
;;; init-info+.el ---
;; Time-stamp: <2012-12-07 07:01:00 Friday by lzy>

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
;;   (require 'init-info+)

;;; Code:


(provide 'init-info+)


(provide 'init-info+)


(defun info+-setting ()
  "setting for info"
  (require 'info+)
  (setq special-display-buffer-names
        (cons '("*info*" (background-color . "black"))
              special-display-buffer-names)))

(eval-after-load "init-info+"
  '(info+-setting))

;;; init-info+.el ends here
