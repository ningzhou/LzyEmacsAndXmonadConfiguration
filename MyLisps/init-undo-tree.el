;; -*- Emacs-Lisp -*-
;;; init-undo-tree.el ---
;; Time-stamp: <2012-12-06 18:09:26 Thursday by lzy>

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
;;   (require 'init-undo-tree)

;;; Code:


(provide 'init-undo-tree)


;; required features
(require 'undo-tree)

(global-undo-tree-mode)

(lazy-set-key
 '(("<f2>"  . undo-tree-visualize)
   ("C-/"   . undo-tree-undo)
   ("M-?"   . undo-tree-redo)))

;;; init-undo-tree.el ends here
