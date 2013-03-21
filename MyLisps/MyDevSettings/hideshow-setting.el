;; -*- Emacs-Lisp -*-
;;; hideshow-setting.el ---
;; Time-stamp: <2013-03-21 12:28:01 Thursday by lzy>

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
;;   (require 'hideshow-setting)

;;; Code:

;; required features

(defun hideshow-setting ()
  "settings for hideshow block"
  ;; required features
  (require 'hideshow)

  ;; variables definition
  (defvar hs-headline-max-len 30
    "*Maximum length of `hs-headline' to display.")
  (defvar hs-overlay-map (make-sparse-keymap)
    "Keymap for hs minor mode overlay.")

  ;; functions definition
  (defun hs-display-headline ()
    (let* ((len (length hs-headline))
           (headline hs-headline)
           (postfix ""))
      (when (>= len hs-headline-max-len)
        (setq postfix "....")
        (setq headline (substring hs-headline 0 hs-headline-max-len)))
      (if hs-headline (concat headline postfix " ") "")))

  (defun hs-abstract-overlay (ov)
    (let* ((start (overlay-start ov))
           (end (overlay-end ov))
           (str (format "<%d lines>" (count-lines start end))) text)
      (setq text (propertize str 'face 'hs-block-flag-face 'help-echo (buffer-substring (1+ start) end)))
      (overlay-put ov 'display text)
      (overlay-put ov 'pointer 'hand)
      (overlay-put ov 'keymap hs-overlay-map)))

  ;; settings
  (hs-minor-mode t)
  (setq hs-isearch-open t)
  (setq hs-set-up-overlay 'hs-abstract-overlay)

  ;; key bindings
  (lazy-set-key
   '(("C-c h" . hs-hide-block)
     ("C-c H" . hs-hide-all)
     ("C-c e" . hs-show-block)
     ("C-c E" . hs-show-all))
   hs-minor-mode-map)

  (lazy-set-key
   '(("<mouse-1>" . hs-show-block))
   hs-overlay-map))

(add-hook 'c-mode-common-hook 'hideshow-setting)
(add-hook 'lisp-mode-hook 'hideshow-setting)
(add-hook 'emacs-lisp-mode-hook 'hideshow-setting)
(add-hook 'lisp-interaction-mode-hook 'hideshow-setting)

;;; provide features
(provide 'hideshow-setting)

;;; hideshow-setting.el ends here
