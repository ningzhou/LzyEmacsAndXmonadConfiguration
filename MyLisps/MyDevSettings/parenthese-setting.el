;; -*- Emacs-Lisp -*-
;;; parenthese-setting.el ---
;; Time-stamp: <2013-03-27 17:37:26 Wednesday by lzy>

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
;;   (require 'parenthese-setting)

;;; Code:

;; required features
(require 'mic-paren)
(require 'highlight-parentheses)

;; functions definition
(defun goto-paren ()
  "jump to the matched parenthese"
  (interactive)
  (cond ((looking-at "[ \t]*[[\"({]")
         (forward-sexp)
         (backward-char))
        ((or (looking-at "[]\")}]")
             (looking-back "[]\")}][ \t]*"))
         (if (< (point) (point-max))
             (forward-char)) (backward-sexp))
        (t (message "cannot find matched parenthese"))))

(defun indent-according-to-paren ()
  "indent region according ([]{}())"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char)))
        (pos (point)))
    (save-excursion
      (cond ((string-match "[[{(<]" next-char)
             (indent-region pos (progn (forward-sexp 1) (point)) nil))
            ((string-match "[\]})>]" prev-char)
             (indent-region (progn (backward-sexp 1) (point)) pos nil))))))

(defun mic-paren-setting ()
  "mic parentheses setting"
  (paren-activate)
  (add-hook 'LaTeX-mode-hook
            (function (lambda ()
                        (paren-toggle-matching-quoted-paren 1)
                        (paren-toggle-matching-paired-delimiter 1))))
  (add-hook 'c-mode-common-hook
            (function (lambda ()
                        (paren-toggle-open-paren-context 1)))))

(defun enable-highlight-paren ()
  "enable highlight parenthese"
  (setq hl-paren-colors
        '("red" "yellow" "cyan" "magenta" "green" "red"))
  (highlight-parentheses-mode 1))

;; global parenthese settings
(setq blink-matching-paren nil)
(show-paren-mode 1)
(mic-paren-setting)

(add-hook 'lisp-mode-hook 'enable-highlight-paren)
(add-hook 'emacs-lisp-mode-hook 'enable-highlight-paren)
(add-hook 'lisp-interaction-mode-hook 'enable-highlight-paren)
(add-hook 'c-mode-common-hook 'enable-highlight-paren)

;; key binding
(lazy-set-key
 '(("C-M-]" . indent-according-to-paren)
   ("C-]" . goto-paren)))

;;; provide features
(provide 'parenthese-setting)

;;; parenthese-setting.el ends here
