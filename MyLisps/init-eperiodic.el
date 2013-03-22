;; -*- Emacs-Lisp -*-
;;; init-eperiodic.el ---
;; Time-stamp: <2013-03-22 08:31:39 Friday by lzy>

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
;;   (require 'init-eperiodic)

;;; Code:

(defun eperiodic-setting ()
  "settings for eperiodic mode"
  ;; required features
  (require 'eperiodic)
  ;; settings
  (custom-set-variables
   '(eperiodic-web-lookup-location "http://www.webelements.com/webelements/elements/text/%s/key.html")))

;; eperiodic init
(eperiodic-setting)

;;; provide features
(provide 'init-eperiodic)

;;; init-eperiodic.el ends here
