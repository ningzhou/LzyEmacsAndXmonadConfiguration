;; -*- Emacs-Lisp -*-
;;; hex-color-setting.el ---
;; Time-stamp: <2013-03-21 12:04:51 Thursday by lzy>

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
;;   (require 'hex-colour-setting)

;;; Code:

(defvar hexcolor-keywords
  '(("#[[:xdigit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background 
                     (match-string-no-properties 0))))))
  "keywords for hexcolor")

(defun hexcolor-init ()
  (font-lock-add-keywords nil hexcolor-keywords))

(add-hook 'html-mode-hook 'hexcolor-init)
(add-hook 'nxml-mode-hook 'hexcolor-init)
(add-hook 'lisp-mode-hook 'hexcolor-init)
(add-hook 'emacs-lisp-mode-hook 'hexcolor-init)
(add-hook 'lisp-interaction-mode-hook 'hexcolor-init)

;;; provide features
(provide 'hex-color-setting)

;;; hex-color-setting.el ends here
