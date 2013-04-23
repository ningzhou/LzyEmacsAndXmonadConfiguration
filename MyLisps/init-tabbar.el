;; -*- Emacs-Lisp -*-
;;; init-tabbar.el ---
;; Time-stamp: <2013-04-23 18:00:18 Tuesday by lzy>

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

(defadvice tabbar-forward (around tabbar-forward-w3m activate)
  ""
  (if (derived-mode-p 'w3m-mode)
      (w3m-next-buffer 1)
    ad-do-it))

(defadvice tabbar-backward (around tabbar-backward-w3m activate)
  ""
  (if (derived-mode-p 'w3m-mode)
      (w3m-previous-buffer 1)
    ad-do-it))

;; settings
(setq tabbar-separator '(0.2))
(tabbar-mode 1)

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
