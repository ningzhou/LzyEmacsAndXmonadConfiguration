;; -*- Emacs-Lisp -*-
;;; basic-tools.el ---
;; Time-stamp: <2013-03-04 12:08:09 Monday by lzy>

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
;;   (require 'basic-tools)

;;; Code:


(provide 'basic-tools)


;; required features
(require 'cl)

;; font setting tools
(defun font-existsp (font)
  (if (null (x-list-fonts font))
      nil
    t))

(defun make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

;; get mode information
(defun get-mode-name ()
  "display `major-mode' and `mode-name'"
  (interactive)
  (message "major-mode: %s, mode-name: %s" major-mode mode-name))

;; get word under point
(defun get-current-word ()
  (interactive)
  (let ((begin (point-min)) (end (point-max)))
    (save-excursion      
      (when (not mark-active)
        (forward-char)
        (backward-word)
        (mark-word))
      (setq begin (region-beginning)
            end (region-end)))
    (buffer-substring-no-properties begin end)))

;; frame transparency
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(95 50))))

;;; basic-tools.el ends here
