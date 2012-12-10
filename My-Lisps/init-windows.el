;; -*- Emacs-Lisp -*-
;;; init-windows.el ---
;; Time-stamp: <2012-12-06 18:14:46 Thursday by lzy>

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
;;   (require 'init-windows)

;;; Code:


(provide 'init-windows)


;; required features
(require 'revive)
(require 'windows)
(require 'winpoint)
(require 'windresize)
(require 'window-number)
(require 'window-extension)

(setq revive:configuration-file "~/.emacs.d/ReviveConfigure") 
(lazy-set-key
 '(("C-c w s" . save-current-configuration)
   ("C-c w f" . resume)
   ("C-c w k" . wipe)
   ("C-c w 0" . toggle-one-window))
 global-map)

(win:startup-with-window)
(setq win:configuration-file "~/.emacs.d/WindowsConfigure")

(window-number-mode t)
(window-number-meta-mode t)  

(setq window-point-remember-mode 1)
(setq winpoint-non-restore-buffer-list
      '("*Group*"))

(lazy-set-key
 '(("C-<left>"  . shrink-window-horizontally)
   ("C-<right>" . enlarge-window-horizontally)
   ("C-<down>"  . shrink-window)
   ("C-<up>"    . enlarge-window)))

;;; init-windows.el ends here
