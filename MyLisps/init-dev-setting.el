;;; init-dev-setting.el --- 

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


(provide 'init-dev-setting)


;; required features
;;(require 'dev-misc)                     ;; misc setting for dev
(require 'cc-mode-common-setting)      ;; CC mode setting
(require 'c&c++-mode-common-setting)   ;; common setting for c&c++ mode
(require 'autoconf-mode-setting)       ;; autoconf setting
(require 'sql-mode-setting)            ;; sql mode setting
(require 'nxml-mode-setting)           ;; xml mode setting
(require 'html-mode-setting)           ;; html mode setting
(require 'python-mode-setting)         ;; python mode
(require 'sh-mode-setting)             ;; shell mode setting
(require 'emacs-lisp-mode-setting)     ;; all lisp realted setting
(require 'haskell-mode-setting)        ;; haskell mode setting
(require 'hideshow-setting)            ;; hide/show setting
(require 'xcscope-setting)             ;; c code navigation setting
(require 'doxymacs-setting)            ;; setting for doxymacs
(require 'flymake-setting)             ;; flymake setting
(require 'which-func-setting)          ;; show which function
(require 'gud-setting)                 ;; gdb setting
(require 'eclim-setting)               ;; eclispse mode for emacs
(require 'compile-setting)             ;; setting for smart compile
(require 'font-lock-setting)           ;; highlight symbol and function
(require 'ctypes-setting)              ;; ctypes setting
(require 'ffap-setting)                ;; ffap setting
(require 'autopair-setting)            ;; auto pair mode
(require 'hex-colour-setting)          ;; hex color display setting
(require 'parenthese-setting)          ;; all parents realted setting

;;; init-dev-setting.el ends here
