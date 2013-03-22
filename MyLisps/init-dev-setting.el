;; -*- Emacs-Lisp -*-
;;; init-dev-setting.el ---
;; Time-stamp: <2013-03-22 09:32:08 Friday by lzy>

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
;;   (require 'init-dev-setting)

;;; Code:

;; required features
(require 'autopair-setting)            ;; autopair setting
(require 'parenthese-setting)          ;; parenthese setting
(require 'which-func-setting)          ;; which func setting
(require 'font-lock-setting)           ;; font lock setting
(require 'etags-setting)               ;; etags setting
(require 'hex-color-setting)           ;; hex color display setting
(require 'hideshow-setting)            ;; hide/show setting
(require 'ifdef-setting)               ;; ifdef setting
(require 'ctypes-setting)              ;; ctypes setting
(require 'doxymacs-setting)            ;; setting for doxymacs
(require 'xcscope-setting)             ;; c code navigation setting
(require 'compile-setting)             ;; setting for smart compile
(require 'gud-setting)                 ;; gdb setting
(require 'cc-mode-setting)             ;; CC mode setting
(require 'c-c++-mode-setting)          ;; common setting for c&c++ mode
(require 'lisp-mode-setting)           ;; lisp realted setting
(require 'autoconf-mode-setting)       ;; autoconf setting
(require 'sql-mode-setting)            ;; sql mode setting
(require 'nxml-mode-setting)           ;; xml mode setting
(require 'html-mode-setting)           ;; html mode setting
(require 'python-mode-setting)         ;; python mode
(require 'sh-mode-setting)             ;; shell mode setting
(require 'haskell-mode-setting)        ;; haskell mode setting

;;; provide features
(provide 'init-dev-setting)

;;; init-dev-setting.el ends here
