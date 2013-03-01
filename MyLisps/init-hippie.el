;; -*- Emacs-Lisp -*-
;;; init-hippie.el ---
;; Time-stamp: <2013-03-01 17:41:45 Friday by lzy>

;; Copyright (C) 2012 chieftain
;;
;; Author: chieftain <lizhengyu419@gmail.com>
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-hippie)

;;; Code:


(provide 'init-hippie)


;; required features
(require 'hippie-exp)

(defun hippie-settings ()
  (setq hippie-expand-try-functions-list
        '(try-expand-dabbrev
          try-expand-dabbrev-visible
          try-expand-dabbrev-all-buffers
          try-expand-dabbrev-from-kill
          try-complete-file-name-partially
          try-complete-file-name
          try-expand-all-abbrevs
          try-expand-list
          try-expand-line
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol
          try-expand-whole-kill))

  (dolist (hook '(emacs-lisp-mode-hook
                  lisp-interaction-mode-hook))
    (add-hook hook
              '(lambda ()
                 (make-local-variable 'hippie-expand-try-functions-list)
                 (setq hippie-expand-try-functions-list
                       '(try-expand-dabbrev
                         try-expand-dabbrev-visible
                         try-expand-dabbrev-all-buffers
                         try-expand-dabbrev-from-kill
                         try-complete-file-name-partially
                         try-complete-file-name
                         try-expand-all-abbrevs
                         try-expand-list
                         try-expand-line
                         try-expand-whole-kill)))))
  (lazy-set-key
   '(("M-/" . hippie-expand))))

(eval-after-load "init-hippie"
  '(hippie-settings))

;;; init-hippie.el ends here
