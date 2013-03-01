;;; hideshow-setting.el --- 
;; Time-stamp: <2012-12-07 06:34:29 Friday by lzy>

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


(provide 'hideshow-setting)


;; required features
(require 'hideshow)

(defvar fold-fun nil
  "Function to fold.")
(defvar fold-all-fun nil
  "Function to fold all.")
(defvar hs-hide-all nil
  "Current state of hideshow for toggling all.")
(defvar hs-headline-max-len 30
  "*Maximum length of `hs-headline' to display.")
(defvar hs-overlay-map (make-sparse-keymap)
  "Keymap for hs minor mode overlay.")

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

(defun hs-minor-mode-setting ()
  "setting of `hs-minor-mode'."
  (hs-minor-mode t)
  (setq hs-isearch-open t)
  (setq hs-set-up-overlay
        'hs-abstract-overlay)
  (setq-default mode-line-format
                (append
                 '((:eval (hs-display-headline)))
                 mode-line-format))

  (make-local-variable 'hs-hide-all)
  (make-variable-buffer-local 'fold-fun)
  (make-variable-buffer-local 'fold-all-fun)
  
  (lazy-set-key
   '(("C-c h" . hs-hide-block)
     ("C-c H" . hs-hide-all)
     ("C-c e" . hs-show-block)
     ("C-c E" . hs-show-all))
   hs-minor-mode-map)

  (lazy-set-key
   '(("<mouse-1>" . hs-show-block))
   hs-overlay-map)
  )

(dolist (hook '(c-mode-common-hook
                lisp-mode-hook
                emacs-lisp-mode-hook
                lisp-interaction-mode-hook))
  (add-hook hook 'hs-minor-mode-setting))

;;; hideshow-setting.el ends here
