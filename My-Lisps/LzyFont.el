;; -*- Emacs-Lisp -*-
;;; LzyFont.el ---
;; Time-stamp: <2012-12-10 10:13:53 Monday by lzy>

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

(defvar emms-en-font "黑体:pixelsize=16" "english font")    ;; default en font for emms playlist
(defvar default-zh-font "Monospace-11" "default chinese font") ;; default zh font
(defvar default-font "Monospace-11" "default english font")    ;; default en font


(defun set-ansi-term-font ()
  "font setting for ansi term"
  (interactive)
  (setq buffer-face-mode-face '(:family "Monospace" :height 1.0 :weight normal))
  (buffer-face-mode)
  )

(defun set-emms-playlist-font ()
  "font setting for emms playlist"
  (interactive)
  (setq emms-en-font (make-font-string
                      (find-if #'font-existsp
                               '("DejaVu Sans Mono" "Monospace" "Monaco" "Consolas" "Courier New"))
                      ":pixelsize=14"))
  (set-face-attribute 'emms-playlist-mark-face nil :font emms-en-font)
  (set-face-attribute 'emms-playlist-track-face nil :font emms-en-font)
  (set-face-attribute 'emms-playlist-selected-face nil :font emms-en-font)
  )

(defun font-setting ()
  "global font setting for emacs"
  ;; default en font
  (setq default-zh-font (make-font-string
                         (find-if #'font-existsp
                                  '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
                         ":pixelsize=16"))
  (set-default-font default-font)

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

;; english font for emms mode
(add-hook 'emms-playlist-mode-hook 'set-emms-playlist-font)

;; english font for term mode
(add-hook 'term-mode-hook 'set-ansi-term-font)

;;; LzyFont.el ends here
