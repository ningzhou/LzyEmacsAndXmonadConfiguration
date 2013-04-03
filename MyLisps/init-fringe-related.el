;; -*- Emacs-Lisp -*-
;;; init-fringe-related.el ---
;; Time-stamp: <2013-04-03 07:01:09 Wednesday by lzy>

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
;;   (require 'init-fringe-related)

;;; Code:

(defun hideshowvis-settings ()
  "settings for hideshowvis"
  ;; required features
  (require 'hideshowvis)
  ;; settings
  (setq hideshowvis-ignore-same-line nil)
  (hideshowvis-symbols))

(add-hook 'c-mode-common-hook 'hideshowvis-settings)
(add-hook 'lisp-mode-hook 'hideshowvis-settings)
(add-hook 'emacs-lisp-mode-hook 'hideshowvis-settings)
(add-hook 'lisp-interaction-mode-hook 'hideshowvis-settings)

;; fringe settings
(fringe-mode '(5 . 0))

;;; provide features
(provide 'init-fringe-related)

;;; init-fringe-related.el ends here
