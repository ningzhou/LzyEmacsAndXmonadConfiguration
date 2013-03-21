;; -*- Emacs-Lisp -*-
;;; nxml-mode-setting.el ---
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
;;   (require 'nxml-mode-setting)

;;; Code:

(defun nxml-mode-setting ()
  "settings for nxml mode"
  ;; settings
  (setq nxml-child-indent 4)
  (setq nxml-attribute-indent 8)
  (setq nxml-sexp-element-flag t)
  (setq nxml-outline-child-indent 4)
  (setq nxml-slash-auto-complete-flag t)
  (setq nxml-prefer-utf-16-to-utf-8-flag nil)
  (setq nxml-auto-insert-xml-declaration-flag t)

  ;; key bindings
  (lazy-set-key
   '(("<return>" . newline-and-indent)
     ("C-j" . newline-and-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment))
   nxml-mode-map))

(eval-after-load "nxml-mode"
  '(nxml-mode-setting))

;;; provide features
(provide 'nxml-mode-setting)

;;; nxml-mode-setting.el ends here
