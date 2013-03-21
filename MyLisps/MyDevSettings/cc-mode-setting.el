;; -*- Emacs-Lisp -*-
;;; cc-mode-setting.el ---
;; Time-stamp: <2013-03-21 16:19:54 Thursday by lzy>

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
;;   (require 'cc-mode-setting)

;;; Code:


(defun cc-mode-setting ()
  "Setting for `cc-mode'."
  ;; required features
  (require 'autopair)
  (require 'mic-paren)
  (require 'highlight-parentheses)

  ;; variables definition
  (defvar modes-use-self-opening
    '(c-mode c++-mode java-mode awk-mode)
    "mode use themselves insert opening function.")

  ;; functions definition
  (defun copy-current-fun-name ()
    "Copy current function name."
    (interactive)
    (kill-new (which-function)))

  (defun skeleton-c-mode-left-brace (arg)
    (interactive "P")
    (if (c-in-literal (c-most-enclosing-brace (c-parse-state)))
        (self-insert-command 1)
      ;; auto insert complex things.
      (let* ((current-line (delete-and-extract-region
                            (line-beginning-position) (line-end-position)))
             (lines (and arg (mark t)
                         (delete-and-extract-region (mark t) (point))))
             (after-point (make-marker)))
        (setq lines (and lines
                         (with-temp-buffer
                           (insert lines)
                           (beginning-of-buffer)
                           (delete-blank-lines)
                           (delete-blank-lines)
                           (end-of-buffer)
                           (delete-blank-lines)
                           (delete-blank-lines)
                           (buffer-string))))
        (save-excursion
          (let* ((old-point (point)))
            (insert (if current-line current-line "") "{\n")
            (and lines (insert lines))
            (move-marker after-point (point))
            (insert "\n}")
            (indent-region old-point (point) nil)))
        (goto-char after-point)
        (c-indent-line))))

  (defun autopair-insert-opening-internal ()
    (interactive)
    (setq autopair-inserted (autopair-calculate-inserted))
    (when (autopair-pair-p)
      (setq autopair-action (list 'opening (autopair-find-pair autopair-inserted) (point))))
    (autopair-fallback))

  ;; redefinition of autopair insert
  (defun autopair-insert-opening ()
    (interactive)
    (if (and (fboundp 'skeleton-c-mode-left-brace)
             (memq major-mode modes-use-self-opening)
             (equal last-command-event ?{))
        (call-interactively 'skeleton-c-mode-left-brace)
      (call-interactively 'autopair-insert-opening-internal)))

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
    (set-face-background 'paren-face-match "magenta")
    (set-face-foreground 'paren-face-match "yellow")
    (set-face-background 'paren-face-mismatch "red")
    (setq paren-message-show-linenumber 'absolute)
    (paren-activate)
    (add-hook 'LaTeX-mode-hook
              (function (lambda ()
                          (paren-toggle-matching-quoted-paren 1)
                          (paren-toggle-matching-paired-delimiter 1))))
    (add-hook 'c-mode-common-hook
              (function (lambda ()
                          (paren-toggle-open-paren-context 1)))))

  ;; settings
  ;; cc mode style settings
  (c-set-style "stroustrup")
  (c-toggle-hungry-state 1)
  ;; which func mode settings
  (which-func-mode 1)
  (setq which-func-unknown "unknown")
  ;; autopair settings
  (autopair-global-mode 1)
  (setq autopair-extra-pairs '(:everywhere ((?` . ?'))))
  ;; parenthese settings
  (show-paren-mode t)
  (mic-paren-setting)
  (setq blink-matching-paren nil)
  (setq hl-paren-colors '("red" "yellow" "cyan" "magenta" "green" "red"))
  (highlight-parentheses-mode t)
  ;; open global font lock
  (global-font-lock-mode t)
  ;; key binding
  (lazy-set-key
   '(("C-c M-F" . copy-current-fun-name))
   c-mode-base-map))

(add-hook 'c-mode-common-hook 'cc-mode-setting)

;;; provide features
(provide 'cc-mode-setting)

;;; cc-mode-setting.el ends here
