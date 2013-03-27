;; -*- Emacs-Lisp -*-
;;; ifdef-setting.el ---
;; Time-stamp: <2013-03-27 17:41:50 Wednesday by lzy>

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
;;   (require 'ifdef-setting)

;;; Code:

(defun ifdef-setting ()
  "settings for ifdef"
  ;; required features
  (require 'ifdef)
  (require 'hide-ifdef)

  ;; key bindings
  (lazy-set-key
   '(("C-c i h" . hide-ifdef-block)
     ("C-c i H" . hide-ifdefs)
     ("C-c i e" . show-ifdef-block)
     ("C-c i E" . show-ifdefs)
     ("C-c i m" . mark-ifdef))
   c-mode-base-map))

(add-hook 'c-mode-common-hook 'ifdef-setting)

;;; provide features
(provide 'ifdef-setting)

;;; ifdef-setting.el ends here
