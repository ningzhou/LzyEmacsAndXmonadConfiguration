;; -*- Emacs-Lisp -*-
;;; init-yasnippet.el ---
;; Time-stamp: <2013-03-14 17:34:21 Thursday by lzy>

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
;;   (require 'init-yasnippet)

;;; Code:


(provide 'init-yasnippet)


;; required features
(require 'yasnippet)
(require 'dropdown-list)

(defun disable-yas-in-term ()
  "disable yasnippet in term mode"
  (interactive)
  (yas-minor-mode 0))

(defun yas-reload ()
  "reload all yasnippet"
  (interactive)
  (yas-compile-directory yas-snippet-dirs)
  (yas-reload-all))

(defun yasnippet-setting ()
  "setting for yasnippet"
  (yas-global-mode 1)  
  (setq yas-snippet-dirs my-emacs-snippets-path)
  (setq yas-prompt-functions '(yas-dropdown-prompt
                               yas-ido-prompt
                               yas-completing-prompt))
  (yas-load-directory yas-snippet-dirs)
  (add-hook 'term-mode-hook 'disable-yas-in-term)
  )

(eval-after-load "init-yasnippet"
  '(yasnippet-setting))

;;; init-yasnippet.el ends here
