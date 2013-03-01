;; -*- Emacs-Lisp -*-
;;; parenthese-setting.el ---
;; Time-stamp: <2013-03-02 06:45:18 Saturday by lzy>

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
;;   (require 'parenthese-setting)

;;; Code:


(provide 'parenthese-setting)


;; required features
(require 'mic-paren)
(require 'highlight-parentheses)

(defun goto-paren ()
  "jump to the matched parenthese"
  (interactive)
  (cond
   ((looking-at "[ \t]*[[\"({]")
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
                        (paren-toggle-open-paren-context 1))))
  )

(defun parenthese-setting ()
  "setting for parenthese"
  (show-paren-mode t)
  (mic-paren-setting)
  (setq blink-matching-paren nil)
  (setq show-paren-style 'parentheses)
  (setq hl-paren-colors
        '("red" "yellow" "cyan" "magenta" "green" "red"))

  (dolist (hook '(lisp-mode-hook
                  emacs-lisp-mode-hook
                  lisp-interaction-mode-hook
                  c-mode-common-hook
                  help-mode-hook
                  Man-mode-hook
                  log-view-mode-hook
                  compilation-mode-hook
                  browse-kill-ring-mode-hook
                  completion-list-mode-hook
                  hs-hide-hook
                  inferior-ruby-mode-hook
                  custom-mode-hook
                  Info-mode-hook
                  svn-log-edit-mode-hook
                  package-menu-mode-hook
                  dired-mode-hook
                  apropos-mode-hook))
    (add-hook hook 'highlight-parentheses-mode))
  
  (lazy-set-key
   '(("C-M-]" . indent-according-to-paren)
     ("C-]" . goto-paren)))
  )

(eval-after-load "parenthese-setting"
  '(parenthese-setting))

;;; parenthese-setting.el ends here
