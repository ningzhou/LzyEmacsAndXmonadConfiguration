;;; eclim-setting.el --- 
;; Time-stamp: <2012-12-07 06:33:32 Friday by lzy>

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


(provide 'eclim-setting)


(defun eclim-mode-setting ()
  "setting for eclim mode"
  ;; required features
  (require 'eclim)

  ;; setting
  (eclim-mode t)
  (setq eclim-auto-save t)
  )

(add-hook 'lisp-mode-hook 'eclim-mode-setting)
(add-hook 'emacs-lisp-mode-hook 'eclim-mode-setting)
(add-hook 'lisp-interaction-mode-hook 'eclim-mode-setting)
(add-hook 'c-mode-common-hook 'eclim-mode-setting)

;;; eclim-setting.el ends here
