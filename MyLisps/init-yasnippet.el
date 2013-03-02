;; -*- Emacs-Lisp -*-
;;; init-yasnippet.el ---
;; Time-stamp: <2013-03-02 20:14:48 Saturday by lzy>

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

(defun yasnippet-reload-after-save ()
  (let* ((bfn (expand-file-name (buffer-file-name)))
         (root (expand-file-name yas/root-directory)))
    (when (string-match (concat "^" root) bfn)
      (yas-load-snippet-buffer))))

(defun yasnippet-setting ()
  "setting for yasnippet"
  (setq yas-snippet-dirs (concat my-emacs-path "Snippets"))
  (yas-load-directory yas-snippet-dirs)
  (add-hook 'after-save-hook 'yasnippet-reload-after-save)
  (yas-global-mode 1))

(eval-after-load "init-yasnippet"
  '(yasnippet-setting))

;;; init-yasnippet.el ends here
