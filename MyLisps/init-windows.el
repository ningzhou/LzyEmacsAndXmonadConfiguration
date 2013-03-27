;; -*- Emacs-Lisp -*-
;;; init-windows.el ---
;; Time-stamp: <2013-03-27 16:26:02 Wednesday by lzy>

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
;;   (require 'init-windows)

;;; Code:

;;; revive settings

;;==============================================================
;;; revive settings
(defun revive-setting ()
  "settings for revive"
  (setq revive:configuration-file "~/.emacs.d/ReviveConfigure"))

(eval-after-load "revive"
  '(revive-setting))

(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
(autoload 'toggle-one-window "window-extension" t)

(lazy-set-key
 '(("C-c w s" . save-current-configuration)
   ("C-c w f" . resume)
   ("C-c w k" . wipe)
   ("C-c w 0" . toggle-one-window)))

;;==============================================================
;;; windows settings
(require 'window-number)
(window-number-mode 1)
(window-number-meta-mode 1)

;;==============================================================
;;; window resize settings
(lazy-set-key
 '(("C-<left>"  . shrink-window-horizontally)
   ("C-<right>" . enlarge-window-horizontally)
   ("C-<down>"  . shrink-window)
   ("C-<up>"    . enlarge-window)))

;;; provide features
(provide 'init-windows)

;;; init-windows.el ends here
