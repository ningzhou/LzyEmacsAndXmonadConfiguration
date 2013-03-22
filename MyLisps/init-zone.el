;; -*- Emacs-Lisp -*-
;;; init-zone.el ---
;; Time-stamp: <2013-03-22 09:01:18 Friday by lzy>

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
;;   (require 'init-zone)

;;; Code:

(defun lock-screen ()
  "Lock screen usng (zone) and strlock
calls M-x zone on all frames and runs xtrlock"
  (interactive)
  (save-excursion
    (set-process-sentinel
     (start-process "xtrlock" nil "xtrlock")
     '(lambda (process event)
        (zone-leave-me-alone)))))

(lazy-set-key
 '(("C-M-L" . lock-screen)))

;;; provide features
(provide 'init-zone)

;;; init-zone.el ends here
