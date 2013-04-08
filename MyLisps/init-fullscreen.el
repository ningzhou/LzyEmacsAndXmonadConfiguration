;; -*- Emacs-Lisp -*-
;;; init-fullscreen.el ---
;; Time-stamp: <2013-04-08 23:22:13 Monday by lzy>

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
;;   (require 'init-fullscreen)

;;; Code:

(autoload 'fullscreen-toggle "fullscreen"
  "toggle fullscreen status" t)
(autoload 'max-window-toggle "fullscreen"
  "toggle max window status" t)

(when (window-system)
  (fullscreen-toggle)
  (lazy-set-key
   '(("C-<f10>" . fullscreen-toggle)
     ("M-<f10>" . max-window-toggle))))

;;; provide features
(provide 'init-fullscreen)

;;; init-fullscreen.el ends here
