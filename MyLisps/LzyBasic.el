;; -*- Emacs-Lisp -*-
;;; LzyBasic.el ---
;; Time-stamp: <2013-03-30 07:46:59 Saturday by lzy>

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
;; This package contains basic libraries and many other useful functions
;; used by other packages, it should be loaded at startup.

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'LzyBasic)

;;; Code:

(require 'cl)
(require 'ffap)
(require 'recentf)
(require 'uniquify)
(require 'saveplace)
(require 'thingatpt)
(require 'ansi-color)

(defun get-mode-name ()
  "display `major-mode' and `mode-name'"
  (interactive)
  (message "major-mode: %s, mode-name: %s"
           major-mode mode-name))

(defun kill-buffer-when-shell-command-exit ()
  "Close current buffer when `shell-command' exit."
  (let ((process (ignore-errors (get-buffer-process (current-buffer)))))
    (when process
      (set-process-sentinel
       process
       (lambda (proc change)
         (when (string-match "\\(finished\\|exited\\)" change)
           (kill-buffer (process-buffer proc))))))))

(defun get-current-word ()
  "Get word under curosr."
  (let ((begin (point-min))
        (end (point-max)))
    (save-excursion
      (when (not mark-active)
        (forward-char)
        (backward-word)
        (mark-word))
      (setq begin (region-beginning)
            end (region-end)))
    (buffer-substring-no-properties begin end)))

(defun mark-whole-sexp ()
  "Mark whole sexp."
  (interactive)
  (let ((region (bounds-of-thing-at-point 'sexp)))
    (if (not region)
        (message "Can not found sexp.")
      (goto-char (car region))
      (call-interactively 'set-mark-command)
      (forward-sexp))))

(defun lisp-mark-function ()
  "Lisp mark function"
  (interactive)
  (mark-defun)
  (let (next-is-fun)
    (save-excursion
      (forward-line)
      (setq next-is-fun (looking-at "[ \t]*(defun")))
    (if (or (looking-at "$")
            (and next-is-fun (not (looking-at "[ \t]*(defun"))))
        (forward-line))))

(defun mark-function ()
  "Mark function."
  (interactive)
  (cond
   ((or (equal major-mode 'c-mode)
        (equal major-mode 'c++-mode))
    (c-mark-function))
   ((or (equal major-mode 'emacs-lisp-mode)
        (equal major-mode 'lisp-mode)
        (equal major-mode 'lisp-interaction-mode))
    (lisp-mark-function))))

(defun comment ()
  "If mark is active comment region, else comment
current line"
  (interactive)
  (if mark-active
      (comment-region (region-beginning) (region-end))
      (comment-region (line-beginning-position) (line-end-position))))

(defun uncomment ()
  "If region is active, uncomment region else uncomment
current line"
  (interactive)
  (if mark-active
      (uncomment-region (region-beginning) (region-end))
    (let (fun)
      (setq fun 'uncomment-region)
      (funcall fun (line-beginning-position) (line-end-position)))))

(defun comment-function ()
  "Comment function."
  (interactive)
  (save-excursion
    (mark-function)
    (comment-region (region-beginning) (region-end))))

(defun copy-cur-line ()
  "Copy current line"
  (interactive)
  (let ((end (min (point-max) (line-end-position))))
    (copy-region-as-kill (line-beginning-position) end)))

(defun copy-region ()
  "Copy region"
  (interactive)
  (copy-region-as-kill (region-beginning) (region-end)))

(defun smart-copy ()
  "Smart copy, if mark is active then copy
region else copy current line"
  (interactive)
  (save-excursion
    (if mark-active
        (call-interactively 'copy-region)
      (call-interactively 'copy-cur-line))))

(defun copy-sexp ()
  "Copy symbol expression"
  (interactive)
  (save-excursion
    (mark-whole-sexp)
    (copy-region-as-kill (region-beginning) (region-end))))

(defun insert-cur-line ()
  "Copy current line and paste it to buffer"
  (interactive)
  (copy-cur-line)
  (forward-line)
  (beginning-of-line)
  (call-interactively 'yank)
  (previous-line)
  (end-of-line))

(defun insert-cur-sexp ()
  "Copy current sexp and paste it to buffer"
  (interactive)
  (copy-sexp)
  (call-interactively 'yank))

(defun smart-kill ()
  "If `mark-active', call `kill-region', otherwise call `kill-whole-line'."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'kill-whole-line)))

(defun smart-indent ()
  "If `mark-active', call `indent-region', otherwise indent all buffer."
  (interactive)
  (save-excursion
    (unless mark-active
      (call-interactively 'mark-whole-buffer))
    (call-interactively 'indent-region)))

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun lazy-set-key (key-alist &optional keymap key-prefix)
  "This function is to little type when define key binding.
`KEYMAP' is a add keymap for some binding, default is `current-global-map'.
`KEY-ALIST' is a alist contain main-key and command.
`KEY-PREFIX' is a add prefix for some binding, default is nil."
  (let (key def)
    (or keymap (setq keymap (current-global-map)))
    (if key-prefix
        (setq key-prefix (concat key-prefix " "))
      (setq key-prefix ""))
    (dolist (element key-alist)
      (setq key (car element))
      (setq def (cdr element))
      (cond ((stringp key) (setq key (read-kbd-macro (concat key-prefix key))))
            ((vectorp key) nil)
            (t (signal 'wrong-type-argument (list 'array key))))
      (define-key keymap key def))))

(defun lazy-unset-key (key-list &optional keymap)
  "This function is to little type when unset key binding.
`KEYMAP' is add keymap for some binding, default is `current-global-map'
`KEY-LIST' is list contain key."
  (let (key)
    (or keymap (setq keymap (current-global-map)))
    (dolist (key key-list)
      (cond ((stringp key) (setq key (read-kbd-macro (concat key))))
            ((vectorp key) nil)
            (t (signal 'wrong-type-argument (list 'array key))))
      (define-key keymap key nil))))


;;; provide features
(provide 'LzyBasic)

;;; LzyBasic.el ends here

