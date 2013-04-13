;; -*- Emacs-Lisp -*-
;;; init-misc.el ---
;; Time-stamp: <2013-04-14 01:49:20 Sunday by lzy>

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

(setq-default echo-keystrokes 0.1)
(setq-default ring-bell-function 'ignore)
(setq-default use-file-dialog nil)
(setq-default use-dialog-box nil)
(setq-default inhibit-startup-message t)
(setq-default inhibit-startup-echo-area-message t)
(setq-default indicate-empty-lines nil)
(setq-default initial-scratch-message nil)
(setq-default message-log-max t)
(setq-default default-major-mode 'text-mode)
(setq-default mouse-yank-at-point t)
(setq-default x-stretch-cursor t)
(setq-default x-select-enable-clipboard t)
(setq-default max-lisp-eval-depth 40000)
(setq-default max-specpdl-size 10000)
(setq-default mark-ring-max 1024)
(setq-default global-mark-ring-max 1024)
(setq-default read-quoted-char-radix 16)
(setq-default enable-recursive-minibuffers t)
(setq-default eval-expression-print-length nil)
(setq-default eval-expression-print-level nil)
(setq-default isearch-allow-scroll t)
(setq-default minibuffer-message-timeout 1)
(setq-default require-final-newline t)
(setq-default bookmark-default-file "~/.emacs.d/bookmarks")
(setq-default buffers-menu-max-size 30)
(setq-default case-fold-search t)
(setq-default line-spacing 0.2)
(setq-default set-mark-command-repeat-pop t)
(setq-default show-trailing-whitespace t)
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)
(setq-default visible-bell t)

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(term-mode-hook comint-mode-hook compilation-mode-hook))
  (add-hook hook
            (lambda () (setq show-trailing-whitespace nil))))

;; ask y-or-n before exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; enable history save
(setq savehist-file "~/.emacs.d/minibuf-history")
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq history-delete-duplicates t)
(savehist-mode 1)
;; load savehist file
(if (file-exists-p savehist-file)
    (load-file savehist-file))


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
(setq comment-style 'indent)
;; automatically save place in each file
(setq save-place t)
;; mouse avoidance mode style
(mouse-avoidance-mode "banish")
;; Prompt in the minibuffer for password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; indent settings
(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 4)
(setq tab-always-indent 'complete)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list
            (cons (* x tab-width) tab-stop-list)))

;; backup setting
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;; recent file setting
(setq recentf-max-saved-items 1000)
(setq recentf-exclude '("/tmp/" "ssh:"))
(setq recentf-save-file "~/.emacs.d/recentfiles")
(custom-set-variables '(recentf-auto-cleanup 'never))
(recentf-mode 1)

;; auto fill mode setting
(dolist (hook '(text-mode-hook org-mode-hook change-log-mode-hook))
  (add-hook hook #'(lambda ()
                     (set-fill-column 100)
                     (turn-on-auto-fill))))

;; coding system setting
(setq default-buffer-file-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(setq default-keyboard-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq default-sendmail-coding-system 'utf-8)
(setq default-terminal-coding-system 'utf-8)

;; enable font lock
(global-font-lock-mode 1)
(set 'jit-lock-mode t)

;; enable global auto-revert-mode
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; global key binding
(lazy-set-key
 '(("M-m" . set-mark-command)
   ("M-w" . smart-copy)
   ("M-M" . mark-whole-sexp)
   ("M-k" . smart-kill)
   ("M-g" . goto-line)
   ("C-x m" . get-mode-name)
   ("C-x k" . kill-this-buffer)
   ("C-x C-b" . ibuffer)
   ("C-j" . newline-and-indent)
   ("M-C-8" . (lambda () (interactive) (adjust-opacity nil -5)))
   ("M-C-9" . (lambda () (interactive) (adjust-opacity nil 5)))
   ("M-C-0" . (lambda () (interactive) (modify-frame-parameters nil '((alpha . 100)))))))

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
