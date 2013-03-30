;; -*- Emacs-Lisp -*-
;;; init-killring.el ---
;; Time-stamp: <2013-03-30 07:42:00 Saturday by lzy>

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
;;   (require 'init-killring)

;;; Code:

(require 'browse-kill-ring)

(setq kill-ring-max 1024)
(setq kill-do-not-save-duplicates t)
(setq browse-kill-ring-quit-action 'save-and-restore)
(browse-kill-ring-default-keybindings)

(lazy-set-key
 '(("k" . browse-kill-ring-delete))
 browse-kill-ring-mode-map)

;;; provide features
(provide 'init-killring)

;;; init-killring.el ends here
