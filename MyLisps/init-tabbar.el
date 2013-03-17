;; -*- Emacs-Lisp -*-
;;; init-tabbar.el ---
;; Time-stamp: <2013-03-16 08:02:47 Saturday by lzy>

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
;;   (require 'init-tabbar)

;;; Code:

(defun tarbar-setting ()
  "setting for tabbar mode"
  ;; required features
  (require 'tabbar-extension)
  ;; settings
  (setq tabbar-separator '(0.3))
  (tabbar-mode 1)
  (lazy-set-key
   '(("C-<f11>"  . tabbar-backward)
     ("<f11>"    . tabbar-forward)
     ("C-<f12>"  . tabbar-backward-group)
     ("<f12>"    . tabbar-forward-group))
   tabbar-mode-map))

(eval-after-load "init-tabbar"
  '(tarbar-setting))

;;; provide features
(provide 'init-tabbar)

;;; init-tabbar.el ends here
