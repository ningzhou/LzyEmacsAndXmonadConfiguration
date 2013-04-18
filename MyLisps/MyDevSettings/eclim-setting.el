;; -*- Emacs-Lisp -*-
;;; eclim-setting.el ---
;; Time-stamp: <2013-04-18 22:37:21 Thursday by lzy>

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
(require 'ac-emacs-eclim-source)

(defvar eclim-enable-ac-sources t
  "flag to indicate whether use eclim ac sources")

;; redefinition of original eclim ac sources setup
(defun help-at-pt-config ()
  (make-local-variable 'help-at-pt-display-when-idle)
  (make-local-variable 'help-at-pt-timer-delay)
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1))

(defun eclim-java-setup ()
  (if eclim-enable-ac-sources
      (push 'ac-source-emacs-eclim ac-sources))
  (help-at-pt-config))

(defun eclim-xml-setup ()
  (if eclim-enable-ac-sources
      (push 'ac-source-emacs-eclim ac-sources))
  (help-at-pt-config))

(defun eclim-php-setup ()
  (if eclim-enable-ac-sources
      (push 'ac-source-emacs-eclim ac-sources))
  (help-at-pt-config))

(defun eclim-ruby-setup ()
  (if eclim-enable-ac-sources
      (push 'ac-source-emacs-eclim ac-sources))
  (help-at-pt-config))

(defun eclim-config ()
  (add-hook 'java-mode-hook 'eclim-java-setup)
  (add-hook 'xml-mode-hook 'eclim-xml-setup)
  (add-hook 'nxml-mode-hook 'eclim-xml-setup)
  (add-hook 'php-mode-hook 'eclim-php-setup)
  (add-hook 'ruby-mode-hook 'eclim-ruby-setup))

(defun eclim-disable-ac-sources ()
  "remove ac-emacs-eclim-source from hook"
  (interactive)
  (setq eclim-enable-ac-sources nil)
  (setq ac-sources (remove 'ac-source-emacs-eclim ac-sources)))

(defun eclim-enable-ac-sources ()
  "remove ac-emacs-eclim-source from hook"
  (interactive)
  (setq eclim-enable-ac-sources t)
  (setq ac-sources (push 'ac-source-emacs-eclim ac-sources)))

(setq eclim-executable (concat (getenv "ECLIPSE_HOME") "eclim"))
(setq eclimd-wait-for-process nil)
(setq compilation-skip-threshold 2)
(setq eclim-auto-save t)
(help-at-pt-set-timer)
(eclim-config)
(global-eclim-mode)

;; key binds
(lazy-set-key
 '(("p" . previous-line)
   ("n" . next-line))
 eclim-project-mode-map)

;;; provide features
(provide 'eclim-setting)

;;; eclim-setting.el ends here
