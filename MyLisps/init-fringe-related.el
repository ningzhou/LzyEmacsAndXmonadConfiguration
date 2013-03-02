;; -*- Emacs-Lisp -*-
;;; init-fringe-related.el ---
;; Time-stamp: <2013-03-02 18:25:08 Saturday by lzy>

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
;;   (require 'init-fringe-related)

;;; Code:


(provide 'init-fringe-related)


;; required features
(require 'flymake)
(require 'hideshowvis)
(require 'fringe-helper)
(require 'hideshow-fringe)

(defvar flymake-fringe-overlays nil)
(make-variable-buffer-local 'flymake-fringe-overlays)

(defadvice flymake-make-overlay (after add-to-fringe first
                                       (beg end tooltip-text face mouse-face)
                                       activate compile)
  (push (fringe-helper-insert-region
         beg end
         (fringe-lib-load (if (eq face 'flymake-errline)
                              fringe-lib-exclamation-mark
                            fringe-lib-question-mark))
         'left-fringe 'font-lock-warning-face)
        flymake-fringqe-overlays))

(defadvice flymake-delete-own-overlays (after remove-from-fringe
                                              activate compile)
  (mapc 'fringe-helper-remove flymake-fringe-overlays)
  (setq flymake-fringe-overlays nil))

(defun hideshowvis-settings ()
  "settings for hideshowvis"
  (set-fringe-mode '(5 . 0))
  (setq hideshowvis-ignore-same-line nil)
  (hideshowvis-symbols)
  )

(dolist (hook (list 'c-mode-common-hook
                    'lisp-mode-hook
                    'emacs-lisp-mode-hook
                    'lisp-interaction-mode-hook
                    ))
  (add-hook hook 'hideshowvis-settings))

;;; init-fringe-related.el ends here