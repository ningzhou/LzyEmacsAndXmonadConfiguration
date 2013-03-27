;; -*- Emacs-Lisp -*-
;;; init-misc.el ---
;; Time-stamp: <2013-03-27 18:44:05 Wednesday by lzy>

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

(menu-bar-mode -1)                      ;;disable menu bar
(tool-bar-mode -1)                      ;;disable tool bar
(scroll-bar-mode -1)                    ;;disable scroll bar
(blink-cursor-mode -1)                  ;;don't blink cursor
(column-number-mode 1)                  ;;show line number
(transient-mark-mode 1)                 ;;highlight transient mark region
(auto-compression-mode 1)               ;;turn on compression mode before openning compressed file

(setq echo-keystrokes 0.1)              ;;show key sequence quickly
(setq ring-bell-function 'ignore)       ;;ignore ring bell
(setq inhibit-startup-message t)        ;;inhibit startup message
(setq initial-scratch-message nil)      ;;inhibit scratch message
(setq default-major-mode 'text-mode)    ;;set the default major mode with text mode
(setq mouse-yank-at-point t)            ;;yank at point instead mouse
(setq x-select-enable-clipboard t)      ;;enable clipboard between emacs and X11 programs
(setq x-stretch-cursor t)               ;;stretch the cursor while at the position of tab
(setq auto-revert-mode 1)               ;;auto revert buffer
(setq max-lisp-eval-depth 40000)        ;;the most eval depth of lisp
(setq max-specpdl-size 10000)           ;;max capabilities
(setq kill-ring-max 10000)              ;;the max size of kill ring
(setq kill-do-not-save-duplicates t)    ;;don't save the duplicates
(setq undo-outer-limit 5000000)         ;;the limits of undo
(setq mark-ring-max 1024)               ;;max size of mark ring
(setq global-mark-ring-max 1024)        ;;set the max size of global mark ring
(setq message-log-max t)                ;;log message without truncating
(setq read-quoted-char-radix 16)        ;;set the radix of quoted char
(setq void-text-area-pointer nil)       ;;don't show the mouse
(setq enable-recursive-minibuffers t)   ;;enable recursive minibuffer
(setq eval-expression-print-length nil) ;;set eval expression print length with no limit
(setq eval-expression-print-level nil)  ;;set eval expression print level with no limit
(setq history-delete-duplicates t)      ;;remove duplicate history
(setq print-escape-newlines t)          ;;display escape newline
(setq tab-always-indent 'complete)      ;;indent before tab
(setq isearch-allow-scroll t)           ;;allow scroll during isearch
(setq minibuffer-message-timeout 1)     ;;show the timeout of minibuffer message
(setq require-final-newline t)          ;;add new line at the end of file
(setq modelinepos-column-limit 80)      ;;set the limit of column with 80 and show it at the mode line
(setq speedbar-show-unknown-files t)    ;;show unknown files at speedbar
;; indent tabs settings
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list
            (cons (* x tab-width) tab-stop-list)))
(fset 'yes-or-no-p 'y-or-n-p)           
(setq-default comment-style 'indent)    
(mouse-avoidance-mode "banish")
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;; backup setting
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs.d/EmacsBackup")))
(setq delete-old-versions t)
;; coding system setting
(setq default-buffer-file-coding-system 'utf-8-unix)            ;;coding system for buffer file
(setq default-file-name-coding-system 'utf-8-unix)              ;;coding system for file name
(setq default-keyboard-coding-system 'utf-8-unix)               ;;coding system for keyboard
(setq default-process-coding-system '(utf-8-unix . utf-8-unix)) ;;coding system for process
(setq default-sendmail-coding-system 'utf-8-unix)               ;;coding system for sending mail
(setq default-terminal-coding-system 'utf-8-unix)               ;;coding system for terminal
;; save the last place
(setq-default save-place t)
;; recent file setting
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(setq recentf-auto-cleanup 300) 
(setq recentf-save-file "~/.emacs.d/recentfiles") ;;list of files opened recently
;; auto fill setting
(setq default-fill-column 80)
(dolist (hook '(after-text-mode-hook
                message-mode-hook
                org-mode-hook))
  (add-hook hook '(lambda () (auto-fill-mode 1))))

;; global key binding for all buffer
(lazy-set-key
 '(("M-m"     . set-mark-command)
   ("M-M" . mark-whole-sexp)
   ("C-x k"   . kill-this-buffer)
   ("C-x C-b" . ibuffer)
   ("C-x m"   . get-mode-name)
   ("M-k"     . kill-whole-paragraph)
   ("M-K"     . kill-paragraph)
   ("C-x <tab>" . indent-whole-buffer)))

;;; provide features
(provide 'init-misc)

;;; init-misc.el ends here
