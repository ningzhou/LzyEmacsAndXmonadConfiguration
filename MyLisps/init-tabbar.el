;; -*- Emacs-Lisp -*-
;;; init-tabbar.el ---
;; Time-stamp: <2013-04-23 16:08:12 Tuesday by lzy>

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

(require 'tabbar-extension)

;; settings
(setq tabbar-separator '(0.2))
(tabbar-mode 1)

;; disable tabbar mode in w3m
(add-hook 'w3m-mode-hook
          #'(lambda ()
              (lazy-unset-key
               '("C-<f11>"
                 "<f11>")
               tabbar-mode-map)))

;; key bindings
(lazy-set-key
 '(("C-<f11>"  . tabbar-backward)
   ("<f11>"    . tabbar-forward)
   ("C-<f12>"  . tabbar-backward-group)
   ("<f12>"    . tabbar-forward-group))
 tabbar-mode-map)

;;; provide features
(provide 'init-tabbar)

;;; init-tabbar.el ends here
