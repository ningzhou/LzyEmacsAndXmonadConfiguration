;; -*- Emacs-Lisp -*-
;;; init-linum.el ---
;; Time-stamp: <2013-03-01 17:57:30 Friday by lzy>

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
;;   (require 'init-linum)

;;; Code:


(provide 'init-linum)


;; required features
(require 'linum+)

(defcustom linum-disabled-modes-list '(org-mode w3m-mode dired-mode image-mode CHART)
  "* List of modes disabled when global linum mode is on *"
  :type '(repeat (sexp :tag "Major mode"))
  :tag "Major modes where linum is disabled:"
  :group 'linum)

(defcustom linum-disable-starred-buffers 't
  "* Disable buffers that have stars in them like *Gnu Emacs *"
  :type 'boolean
  :group 'linum)

;; redefine linum-on
(defun linum-on ()
  "* When linum is running globally, disable line number in modes defined
in `linum-disabled-modes-list', also turns off numbering in starred modes
like *scratch*"
  (unless (or (minibufferp)
              (member major-mode linum-disabled-modes-list)
              (and linum-disable-starred-buffers (string-match "*" (buffer-name)))
              )
    (linum-mode 1)))

(global-linum-mode t)

;;; init-linum.el ends here


















