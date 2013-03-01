;; -*- Emacs-Lisp -*-
;;; LzyFont.el ---
;; Time-stamp: <2013-03-01 16:35:05 Friday by lzy>

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
;;   (require 'LzyFont)

;;; Code:


(provide 'LzyFont)


;;; required features
(require 'basic-tools)

(defvar default-zh-font "Monospace-11" "default chinese font") ;; default zh font
(defvar default-font "Monospace-11" "default english font")    ;; default en font

(defun font-setting ()
  "global font setting for emacs"
  (setq default-zh-font (make-font-string
                         (find-if #'font-existsp
                                  '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
                         ":pixelsize=16"))
  ;; default en font
  (set-default-font "Monospace-11")
  ;; default zh font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      default-zh-font))

  )

;; gloal font setting
(if window-system
    (font-setting)
  (set-default-font default-font))

;;; LzyFont.el ends here
