;; -*- Emacs-Lisp -*-
;;; font-lock-setting.el ---
;; Time-stamp: <2013-03-02 06:40:40 Saturday by lzy>

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

;; specific setting for c/c++ mode
(add-hook 'c-mode-hook 'c/c++-font-lock-setting)
(add-hook 'c++-mode-hook 'c/c++-font-lock-setting)

(global-font-lock-mode t)

;;; font-lock-setting.el ends here
