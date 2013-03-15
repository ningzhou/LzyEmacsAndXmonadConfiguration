;; -*- Emacs-Lisp -*-
;;; init-less.el ---
;; Time-stamp: <2013-03-15 18:05:13 Friday by lzy>

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
;;   (require 'init-less)

;;; Code:

(defun less-minor-mode-setting ()
  "settings for less minor mode"
  (lazy-set-key
   '(("n" . less-scroll-up-one-line)
     ("p" . less-scroll-down-one-line)
     ("q" . less-quit))
   less-minor-mode-map))

(eval-after-load "less"
  '(less-minor-mode-setting))

(autoload 'less-minor-mode "less" nil t)
(autoload 'less-minor-mode-on "less" nil t)
(autoload 'auto-less-minor-mode "less" nil nil)

(add-hook 'find-file-hook 'auto-less-minor-mode)

;;; provide features
(provide 'init-less)

;;; init-less.el ends here
