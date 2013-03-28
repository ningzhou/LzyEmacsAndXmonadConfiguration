;; -*- Emacs-Lisp -*-
;;; init-misc.el ---
;; Time-stamp: <2013-03-28 09:26:39 Thursday by lzy>

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

(setq echo-keystrokes 0.1)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq default-major-mode 'text-mode)
(setq mouse-yank-at-point t)
(setq x-stretch-cursor t)
(setq x-select-enable-clipboard t)
(setq auto-revert-mode 1)
(setq max-lisp-eval-depth 40000)
(setq max-specpdl-size 10000)
(setq mark-ring-max 1024)
(setq global-mark-ring-max 1024)
(setq message-log-max t)
(setq read-quoted-char-radix 16)
(setq void-text-area-pointer nil)
(setq enable-recursive-minibuffers t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)
(setq history-delete-duplicates t)
(setq print-escape-newlines t)
(setq isearch-allow-scroll t)
(setq minibuffer-message-timeout 1)
(setq require-final-newline t)
(setq speedbar-show-unknown-files t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default comment-style 'indent)
(setq-default save-place t)
(mouse-avoidance-mode "banish")
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; indent tabs settings
(setq tab-always-indent 'complete)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list
            (cons (* x tab-width) tab-stop-list)))

;; backup setting
(setq make-backup-files nil)
(setq auto-save-default nil)

;; coding system setting
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)

;; recent file setting
(setq recentf-max-saved-items 100)
(setq recentf-auto-cleanup 300)
(setq recentf-save-file "~/.emacs.d/recentfiles")
(recentf-mode 1)

;; auto fill setting
(setq default-fill-column 80)
(dolist (hook '(text-mode-hook
                message-mode-hook
                org-mode-hook))
  (add-hook hook
            #'(lambda () (auto-fill-mode 1))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode 1)
(transient-mark-mode 1)
(auto-compression-mode 1)

;; global key binding for all buffer
(lazy-set-key
 '(("M-m" . set-mark-command)
   ("M-M" . mark-whole-sexp)
   ("M-k" . smart-kill)
   ("C-x <tab>" . smart-indent)
   ("C-x m" . get-mode-name)
   ("C-x k" . kill-this-buffer)
   ("C-x C-b" . ibuffer)))

;;; provide features
(provide 'init-misc)

;;; init-misc.el ends here
