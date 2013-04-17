;; -*- Emacs-Lisp -*-
;;; eclim-setting.el ---
;; Time-stamp: <2013-04-17 13:44:04 Wednesday by lzy>

;; Copyright (C) 2013 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@gmail.com>
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
;;   (require 'eclim-setting)

;;; Code:

(require 'eclim)
(require 'eclimd)
(require 'ac-emacs-eclim-source)

(setq eclim-executable (concat (getenv "ECLIPSE_HOME") "eclim"))
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(setq compilation-skip-threshold 2)
(help-at-pt-set-timer)
(ac-emacs-eclim-config)
(global-eclim-mode)

;; key binds
(lazy-set-key
 '(("p" . previous-line)
   ("n" . next-line))
 eclim-project-mode-map)

;;; provide features
(provide 'eclim-setting)

;;; eclim-setting.el ends here
