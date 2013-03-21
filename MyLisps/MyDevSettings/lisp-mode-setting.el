;; -*- Emacs-Lisp -*-
;;; lisp-mode-setting.el ---
;; Time-stamp: <2013-03-21 18:15:40 Thursday by lzy>

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
;;   (require 'lisp-mode-setting)

;;; Code:

(defun lisp-common-setting ()
  "settings for all lisp related mode"
  ;; required features
  (require 'cldoc)

  ;; settings
  (turn-on-eldoc-mode)
  (turn-on-cldoc-mode))

(add-hook 'lisp-mode-hook
          '(lambda ()
             (lisp-common-setting)
             (lazy-set-key
              '(("C-c M-a" . beginning-of-defun)
                ("C-c M-e" . end-of-defun)
                ("M-j" . eval-last-sexp)
                ("<return>" . newline-and-indent)
                ("C-j" . newline-and-indent)
                ("C-c C-c" . comment)
                ("C-c k" . uncomment))
              lisp-mode-map)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (lisp-common-setting)
             (lazy-set-key
              '(("C-c M-a" . beginning-of-defun)
                ("C-c M-e" . end-of-defun)
                ("M-j" . eval-last-sexp)
                ("<return>" . newline-and-indent)
                ("C-j" . newline-and-indent)
                ("C-c C-c" . comment)
                ("C-c k" . uncomment))
              emacs-lisp-mode-map)))

(add-hook 'lisp-interaction-mode-hook
          '(lambda ()
             (lisp-common-setting)
             (lazy-set-key
              '(("C-c M-a" . beginning-of-defun)
                ("C-c M-e" . end-of-defun)
                ("M-j" . eval-last-sexp)
                ("<return>" . newline-and-indent)
                ("C-j" . newline-and-indent)
                ("C-c C-c" . comment)
                ("C-c k" . uncomment))
              lisp-interaction-mode-map)))

(lazy-set-key
 '(("C-x M-E" . toggle-debug-on-error)
   ("C-x Q"   . toggle-debug-on-quit)))

(eval-after-load "edebug"
  '(lambda ()
     (lazy-set-key
      '(("C-c C-d" . nil))
      edebug-mode-map)))

;;; provide features
(provide 'lisp-mode-setting)

;;; lisp-mode-setting.el ends here
