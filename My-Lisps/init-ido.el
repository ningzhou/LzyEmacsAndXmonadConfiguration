;; -*- Emacs-Lisp -*-
;;; init-ido.el ---
;; Time-stamp: <2012-12-07 06:59:29 Friday by lzy>

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
;;   (require 'init-ido)

;;; Code:


(provide 'init-ido)


;; required features
(require 'ido)

(if (= 24 emacs-major-version)
    (require 'ido-hacks-24)
  (require 'ido-hacks-23))

(defun ido-setting ()
  (ido-mode t)
  (ido-hacks-mode t)
  (setq ido-enable-flex-matching t)
  (setq ido-max-directory-size 1000000)
  (setq ido-last-directory-list nil)
  ;; use normal find-file function for ftp files
  (setq ido-slow-ftp-host-regexps '(".*"))
  ;; don't search files in other directories
  (setq ido-work-directory-list-ignore-regexps '(".*")))

(eval-after-load "init-ido"
  '(ido-setting))

;;; init-ido.el ends here
