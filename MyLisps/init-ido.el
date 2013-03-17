;; -*- Emacs-Lisp -*-
;;; init-ido.el ---
;; Time-stamp: <2013-03-17 19:01:45 Sunday by lzy>

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
;;   (require 'init-ido)

;;; Code:

(require 'ido)
(if (equal 24 emacs-major-version)
    (require 'ido-hacks-24)
  (require 'ido-hacks))

(defun ido-sort-mtime ()
  "sort ido filelist by mtime instead of alphabetically"
  (setq ido-temp-list
        (sort ido-temp-list 
              (lambda (a b)
                (time-less-p
                 (sixth (file-attributes (concat ido-current-directory b)))
                 (sixth (file-attributes (concat ido-current-directory a)))))))
  (ido-to-end (delq nil (mapcar
                         (lambda (x)
                           (and (char-equal (string-to-char x) ?.) x))
                         ido-temp-list))))

(defun ido-my-keys ()
  "Set up the keymap for `ido'."
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match))

(defun ido-disable-line-truncation ()
  (set (make-local-variable 'truncate-lines) nil))

(defun ido-setting ()
  (setq ido-save-directory-list-file "~/.emacs.d/ido.last")
  (setq ido-enable-flex-matching t)
  (setq ido-max-directory-size 1000000)
  ;; Display ido results vertically, rather than horizontally
  (setq ido-decorations
        '("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]"
          " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))
  (add-hook 'ido-setup-hook 'ido-my-keys)
  (add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
  (add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (ido-mode t)
  (ido-hacks-mode t))

(eval-after-load "ido"
  '(ido-setting))

;;; provide features
(provide 'init-ido)

;;; init-ido.el ends here
