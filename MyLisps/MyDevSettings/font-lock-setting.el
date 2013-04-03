;; -*- Emacs-Lisp -*-
;;; font-lock-setting.el ---
;; Time-stamp: <2013-04-03 08:24:38 Wednesday by lzy>

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
;;   (require 'font-lock-setting)

;;; Code:

(require 'zjl-hl)

(setq zjl-hl-c++-mode-keywords zjl-hl-c-mode-keywords)
(setq zjl-hl-lisp-mode-keywords zjl-hl-emacs-lisp-mode-keywords)
(setq zjl-hl-lisp-interaction-mode-keywords zjl-hl-emacs-lisp-mode-keywords)

(zjl-hl-enable-global 'c-mode)
(zjl-hl-enable-global 'c++-mode)
(zjl-hl-enable-global 'emacs-lisp-mode)
(zjl-hl-enable-global 'lisp-mode)
(zjl-hl-enable-global 'lisp-interaction-mode)

(global-font-lock-mode 1)

;;; provide features
(provide 'font-lock-setting)

;;; font-lock-setting.el ends here
