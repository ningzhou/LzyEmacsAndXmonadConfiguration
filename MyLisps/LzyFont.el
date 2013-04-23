;; -*- Emacs-Lisp -*-
;;; LzyFont.el ---
;; Time-stamp: <2013-04-23 17:48:25 Tuesday by lzy>

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
;;   (require 'LzyFont)

;;; Code:

(defvar emacs-en-font "Bitstream Vera Sans Mono:pixelsize=16" "default english font")
(defvar emacs-zh-font nil "zh font")

;; font setting tools
(defun font-existsp (font)
  (if (null (x-list-fonts font))
      nil
    t))

(defun make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun font-setting ()
  "global font setting for emacs"
  ;; default en font
  (set-face-attribute 'default nil :font emacs-en-font)
  ;; default zh font
  (setq emacs-zh-font (find-if #'font-existsp
                               '("DejaVu Sans YuanTi Mono" "Microsoft Yahei" "WenQuanYi Zen Hei")))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset emacs-zh-font)))

;; gloal font setting
(if window-system
    (font-setting))

;;; provide features
(provide 'LzyFont)

;;; LzyFont.el ends here
