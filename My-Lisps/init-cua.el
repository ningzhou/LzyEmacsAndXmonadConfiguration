;; -*- Emacs-Lisp -*-
;;; init-cua.el ---
;; Time-stamp: <2012-12-04 05:58:21 Tuesday by lzy>

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
;;   (require 'init-cua)

;;; Code:


(provide 'init-cua)


;; required features
(require 'cua-base)                     ;emulate CUA key bindings

(defun cua-settings ()
  "settings for `cua'."
  (setq cua-auto-tabify-retangles nil)  ;Don't tabify after rectangle commands

  (setq cua-remap-control-z nil)        ;set C-z to nil
  (setq cua-remap-control-v nil)        ;set C-z to nil

  (define-key cua--cua-keys-keymap [(control z)] nil)
  (define-key cua--cua-keys-keymap [(control v)] nil)
  (define-key cua--cua-keys-keymap [(meta v)] nil)

  (autoload 'cua--init-rectangles "cua-rect")
  (cua--init-rectangles))

(eval-after-load "cua-base"
  '(cua-settings))

;;; init-cua.el ends here
