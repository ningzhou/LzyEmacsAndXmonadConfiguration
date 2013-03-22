;; -*- Emacs-Lisp -*-
;;; init-template.el ---
;; Time-stamp: <2013-03-22 08:56:48 Friday by lzy>

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
;;   (require 'init-template)

;;; Code:

(defun template-setting ()
  "settings for tempalte"
  (template-initialize)
  (setq template-auto-insert 'query)
  (setq template-default-directories
        (cons my-emacs-templates-path template-default-directories)))

(eval-after-load "template"
  '(template-setting))

(autoload 'template-expand-template "template"
  "Expand template file TEMPLATE and insert result in current buffer" t)

(lazy-set-key
   '(("C-c C-f" . template-expand-template)))

;;; provide features
(provide 'init-template)

;;; init-template.el ends here
