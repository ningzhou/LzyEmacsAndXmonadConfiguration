;; -*- Emacs-Lisp -*-
;;; font-lock-setting.el ---
;; Time-stamp: <2012-12-07 06:30:28 Friday by lzy>

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
;;   (require 'font-lock-setting)

;;; Code:


(provide 'font-lock-setting)


(defun default-font-lock-setting ()
  "default font lock for cc-mode"
  (font-lock-mode t))

(defun c/c++-font-lock-setting ()
  "setting for font lock"
  ;; required features
  (require 'zjl-hl-extended-by-lzy)

  ;; setting
  (setq zjl-hl-c-mode-enable-flag t)
  (setq zjl-hl-c++-mode-enable-flag t)
  (setq zjl-hl-c++-mode-keywords zjl-hl-c-mode-keywords)
  (zjl-hl-enable-global-all-modes)
  )

;; common setting for cc mode
(add-hook 'c-mode-common-hook 'default-font-lock-setting)
;; specific setting for c/c++ mode
(add-hook 'c-mode-hook 'c/c++-font-lock-setting)
(add-hook 'c++-mode-hook 'c/c++-font-lock-setting)

;;; font-lock-setting.el ends here
