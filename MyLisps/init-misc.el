;; -*- Emacs-Lisp -*-
;;; init-misc.el ---
;; Time-stamp: <2013-03-28 14:01:35 Thursday by lzy>

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
;;   (require 'init-misc)

;;; Code:

(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq message-log-max t)
(setq default-major-mode 'text-mode)
(setq mouse-yank-at-point t)
(setq x-stretch-cursor t)
(setq x-select-enable-clipboard t)
(setq auto-revert-mode 1)
(setq max-lisp-eval-depth 40000)
(setq max-specpdl-size 10000)
(setq mark-ring-max 1024)
(setq global-mark-ring-max 1024)
(setq read-quoted-char-radix 16)
(setq enable-recursive-minibuffers t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)
(setq history-delete-duplicates t)
(setq isearch-allow-scroll t)
(setq minibuffer-message-timeout 1)
(setq require-final-newline t)

;; disable scroll bar
(scroll-bar-mode -1)
;; disable menu bar
(menu-bar-mode -1)
;; disable cursor blink
(blink-cursor-mode -1)
;; disable tool bar
(tool-bar-mode -1)
;; enable auto compression mode
(auto-compression-mode 1)
;; show column number
(column-number-mode 1)
;; enable transient mark mode
(transient-mark-mode 1)
;; ask user a "y or n" question
(fset 'yes-or-no-p 'y-or-n-p)
;; style to be used for comment-region
(setq-default comment-style 'indent)
;; automatically save place in each file
(setq-default save-place t)
;; mouse avoidance mode style
(mouse-avoidance-mode "banish")
;; Prompt in the minibuffer for password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; indent settings
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
(setq default-tab-width 4)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list
            (cons (* x tab-width) tab-stop-list)))

;; backup setting
(setq make-backup-files nil)
(setq auto-save-default nil)

;; recent file setting
(setq recentf-max-saved-items 100)
(setq recentf-save-file "~/.emacs.d/recentfiles")
(custom-set-variables '(recentf-auto-cleanup never))
(recentf-mode 1)

;; auto fill mode setting
(dolist (hook '(text-mode-hook org-mode-hook))
  (add-hook hook #'(lambda () (auto-fill-mode 1))))

;; coding system setting
(setq default-buffer-file-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(setq default-keyboard-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq default-sendmail-coding-system 'utf-8)
(setq default-terminal-coding-system 'utf-8)

;; global key binding
(lazy-set-key
 '(("M-m" . set-mark-command)
   ("M-w" . smart-copy)
   ("M-M" . mark-whole-sexp)
   ("M-k" . smart-kill)
   ("C-x m" . get-mode-name)
   ("C-x k" . kill-this-buffer)
   ("C-x C-b" . ibuffer)
   ("C-j" . newline-and-indent)
   ("C-x <tab>" . smart-indent)
   ("C-c C-c" . comment)
   ("C-c k" . uncomment)
   ("C-c M-a" . beginning-of-defun)
   ("C-c M-e" . end-of-defun)))

;; cleanup tmp buffer
(if (get-buffer ".bash_history")
    (kill-buffer ".bash_history"))
(if (get-buffer "*Compile-Log*")
    (kill-buffer "*Compile-Log*"))
(if (get-buffer "*Messages*")
    (kill-buffer "*Messages*"))
(if (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))

;;; provide features
(provide 'init-misc)

;;; init-misc.el ends here
