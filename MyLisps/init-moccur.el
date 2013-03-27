;; -*- Emacs-Lisp -*-
;;; init-moccur.el ---
;; Time-stamp: <2013-03-27 17:00:51 Wednesday by lzy>

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
;;   (require 'init-moccur)

;;; Code:

(defun moccur-setting ()
  "setting for moccur and moccur-edit"
  ;; required features
  (require 'moccur-edit)

  ;; advice define
  (defadvice moccur-edit-change-file (after save-after-moccur-edit-buffer activate)
    "Automatically save buffer when edit in moccur."
    (save-buffer))

  ;; settings
  (setq moccur-kill-moccur-buffer t)
  (setq moccur-edit-highlight-edited-text t)
  (setq moccur-grep-default-word-near-point t))

(eval-after-load "color-moccur"
  '(moccur-setting))

(autoload 'occur-by-moccur "color-moccur" nil t)
(autoload 'moccur-grep-find "color-moccur" nil t)
(autoload 'moccur-grep "color-moccur" nil t)

(lazy-set-key
 '(("C-x C-u"  . occur-by-moccur)
   ("C-x g"    . moccur-grep-find)
   ("C-x G"    . moccur-grep)))

;;; provide features
(provide 'init-moccur)

;;; init-moccur.el ends here
