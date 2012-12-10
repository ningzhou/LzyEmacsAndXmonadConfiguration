;;; compile-setting.el --- 
;; Time-stamp: <2012-12-07 06:33:02 Friday by lzy>

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


(provide 'compile-setting)


;; required features
(require 'compile-misc)
(require 'smart-compile)

(setq compile-command "make -k")
(setq compilation-scroll-output t)

(lazy-set-key
 '(("M-p"     . previous-error)
   ("M-n"     . next-error))
 compilation-mode-map)

(defun c-mode-compile-setting ()
  "compile setting for c/c++ mode"
  (lazy-set-key
   '(("C-c C-m" . make)
     ("C-c C-b" . compile-buffer)
     ("C-c C-r" . run-program)
     ("M-p"     . previous-error)
     ("M-n"     . next-error)
     ("<f5>"    . smart-compile)
     ("<f7>"    . gdb))
   c-mode-map)
  )

(defun c++-mode-compile-setting ()
  "compile setting for c/c++ mode"
  (lazy-set-key
   '(("C-c C-m" . make)
     ("C-c C-b" . compile-buffer)
     ("C-c C-r" . run-program)
     ("M-p"     . previous-error)
     ("M-n"     . next-error)
     ("<f5>"    . smart-compile)
     ("<f7>"    . gdb))
   c++-mode-map)
  )

(defun java-mode-compile-setting ()
  "compile setting for java mode"
  (lazy-set-key
   '(("C-c C-m" . ant)
     ("C-c C-b" . compile-buffer)
     ("C-c C-t" . ant-test)
     ("C-c C-r" . run-program)
     ("M-p"     . previous-error)
     ("M-n"     . next-error)
     ("<f5>"    . smart-compile))
   java-mode-map)
  )

(defun ruby-mode-compile-setting ()
  "compile setting for ruby mode"
  (lazy-set-key
   '(("C-c C-m" . make)
     ("C-c C-b" . compile-buffer)
     ("C-c C-r" . run-program)
     ("M-p"     . previous-error)
     ("M-n"     . next-error)
     ("<f5>"    . smart-compile)
     ("<f7>"    . gdb))
   ruby-mode-map)
  )

(add-hook 'c-mode-hook 'c-mode-compile-setting)
(add-hook 'c++-mode-hook 'c++-mode-compile-setting)
(add-hook 'java-mode-hook 'java-mode-compile-setting)
(add-hook 'ruby-mode-hook 'ruby-mode-compile-setting)
;;; compile-setting.el ends here
