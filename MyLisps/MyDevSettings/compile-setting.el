;; -*- Emacs-Lisp -*-
;;; compile-setting.el ---
;; Time-stamp: <2013-04-10 15:09:55 Wednesday by lzy>

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
;;   (require 'compile-setting)

;;; Code:

(defun compile-setting ()
  "compile setting for c/c++ mode"
  ;; required features
  (require 'compile)
  (require 'smart-compile)

  ;; functions definition
  (defun kill-buffer-when-compile-success (process)
    "Close current buffer when `shell-command' exit."
    (set-process-sentinel
     process
     (lambda (proc change)
       (when (string-match "finished" change)
         (delete-windows-on (process-buffer proc))))))

  ;; settings
  (setq compilation-scroll-output t)
  (add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)

  ;; key bindings
  (lazy-set-key
   '(("M-p"     . previous-error)
     ("M-n"     . next-error))
   compilation-mode-map)

  (lazy-set-key
   '(("C-c C-m" . smart-compile)
     ("C-c C-b" . smart-compile)
     ("M-p"     . previous-error)
     ("M-n"     . next-error))
   c-mode-base-map))

(add-hook 'c-mode-hook 'compile-setting)
(add-hook 'c++-mode-hook 'compile-setting)
(add-hook 'java-mode-hook 'compile-setting)

;;; provide features
(provide 'compile-setting)

;;; compile-setting.el ends here
