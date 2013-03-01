;;; nxml-mode-setting.el --- 
;; Time-stamp: <2012-12-07 06:34:44 Friday by lzy>

;; Copyright (C) 2012  zhengyu li

;; Author: zhengyu li <lizhengyu419@gmail.com>
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

;;; Code:


(provide 'nxml-mode-setting)


(defun nxml-setting ()
  "setting for nxml"
  ;; setting
  (setq nxml-child-indent 4)
  (setq nxml-attribute-indent 8)
  (setq nxml-sexp-element-flag t)
  (setq nxml-outline-child-indent 4)
  (setq nxml-slash-auto-complete-flag t)
  (setq nxml-prefer-utf-16-to-utf-8-flag nil)
  (setq nxml-auto-insert-xml-declaration-flag t)

  (lazy-set-key
   '(("C-j" . newline-and-indent)
     ("RET" . newline-and-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment))
   nxml-mode-map)
  )

(eval-after-load "nxml-mode"
  '(nxml-setting))

;;; nxml-mode-setting.el ends here

