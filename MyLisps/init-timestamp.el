;; -*- Emacs-Lisp -*-
;;; init-timestamp.el ---
;; Time-stamp: <2013-03-16 22:19:51 Saturday by lzy>

;; Copyright (C) 2013 chieftain
;;
;; Author: chieftain <lizhengyu419@gmail.com>
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
;;   (require 'init-timestamp)

;;; Code:

(defun time-stamp-setting ()
  "settings for time stamp"
  (setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S %:a by %u")
  (setq time-stamp-active t)
  (setq time-stamp-warn-inactive t))

(eval-after-load "time-stamp"
  '(time-stamp-setting))

(autoload 'time-stamp "time-stamp"
  "Update the time stamp string(s) in the buffer" t)

(add-hook 'write-file-hooks 'time-stamp)

;;; provide features
(provide 'init-timestamp)

;;; init-timestamp.el ends here
