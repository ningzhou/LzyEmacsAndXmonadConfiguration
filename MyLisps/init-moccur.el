;;; init-moccur.el --- 
;; Time-stamp: <2013-03-02 04:16:06 Saturday by lzy>

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


(provide 'init-moccur)


;; required features
(require 'dired)
(require 'moccur-edit)
(require 'color-moccur)

;; save buffer after modification
(defadvice moccur-edit-change-file         
  (after save-after-moccur-edit-buffer activate)
  "Automatically save buffer when edit in moccur."
  (save-buffer))

(defun moccur-setting ()
  "setting for moccur and moccur-edit"

  (setq moccur-kill-moccur-buffer t) ; kill buffer when exit
  (setq moccur-edit-highlight-edited-text t) ; highlight text regions been changed
  (setq moccur-grep-default-word-near-point t) ; get a word near the point as default regexp string

  (lazy-set-key
   '(("C-x C-u"  . occur-by-moccur)
     ("C-x g"    . moccur-grep-find) ;recursively with current directory
     ("C-x G"    . moccur-grep))) ;non-recursively
  )

(eval-after-load "init-moccur"
  '(moccur-setting))

;;; init-moccur.el ends here












