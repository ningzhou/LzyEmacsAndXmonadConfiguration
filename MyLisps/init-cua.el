;; -*- Emacs-Lisp -*-
;;; init-cua.el ---
;; Time-stamp: <2013-03-20 17:19:42 Wednesday by lzy>

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
;;   (require 'init-cua)

;;; Code:

(defun cua-settings ()
  "settings for cua mode"
  ;; required features
  (require 'cua-rect)
  ;; settings
  (setq cua-remap-control-z nil)
  (setq cua-remap-control-v nil)
  (define-key cua--cua-keys-keymap [(control z)] nil)
  (define-key cua--cua-keys-keymap [(control v)] nil)
  (define-key cua--cua-keys-keymap [(meta v)] nil)
  (cua--init-rectangles))

(eval-after-load "cua-base"
  '(cua-settings))

(autoload 'cua-mode "cua-base"
  "Toggle Common User Access style editing (CUA mode)" t)

(defalias 'cua 'cua-mode)

;;; provide features
(provide 'init-cua)

;;; init-cua.el ends here
