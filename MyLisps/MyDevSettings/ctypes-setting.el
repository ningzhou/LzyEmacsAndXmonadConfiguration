;; -*- Emacs-Lisp -*-
;;; ctypes-setting.el ---
;; Time-stamp: <2013-03-27 17:42:00 Wednesday by lzy>

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
;;   (require 'ctypes-setting)

;;; Code:

(defun ctypes-setting ()
  "settings for ctypes"
  ;;; required features:
  (require 'ctypes)

  ;; settings
  (setq ctypes-write-types-at-exit t)
  (setq ctypes-file-name "~/.emacs.d/ctypes")
  (ctypes-auto-parse-mode 1)
  (ctypes-read-file nil nil t t))

(add-hook 'c-mode-hook 'ctypes-setting)
(add-hook 'c++-mode-hook 'ctypes-setting)

;;; provide features
(provide 'ctypes-setting)

;;; ctypes-setting.el ends here
