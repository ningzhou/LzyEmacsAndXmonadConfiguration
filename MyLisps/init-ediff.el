;; -*- Emacs-Lisp -*-
;;; init-ediff.el ---
;; Time-stamp: <2013-03-18 08:58:46 Monday by lzy>

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
;;   (require 'init-ediff)

;;; Code:

(defvar ediff-window-config-already-save nil)

(defun ediff-setting ()
  "settings for ediff"
  ;; required features
  (require 'ediff-trees)
  (require 'revive)
  ;; advice define
  (defadvice ediff-files (before ediff-files-windows-save activate)
    "save windows layout"
    (if (not ediff-window-config-already-save)
        (progn
          (save-current-configuration)
          (setq ediff-window-config-already-save t))))
  (defadvice ediff-trees (before ediff-trees-windows-save activate)
    "save windows layout"
    (if (not ediff-window-config-already-save)
        (progn
          (save-current-configuration)
          (setq ediff-window-config-already-save t))))
  (defadvice ediff-quit (after ediff-quit-windows-restore activate)
    "save windows layout"
    (if ediff-window-config-already-save
        (progn
          (resume)
          (setq ediff-window-config-already-save nil))))
  ;; settings
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (lazy-set-key
   '(("M-n"  . ediff-trees-examine-next)
     ("M-p"  . ediff-trees-examine-previous))
   ediff-mode-map)
  (lazy-set-key
   '(("=" . ediff-files)
     ("M-="  . ediff-trees))
   dired-mode-map))

(eval-after-load "dired"
  '(ediff-setting))

;;; provide features
(provide 'init-ediff)

;;; init-ediff.el ends here
