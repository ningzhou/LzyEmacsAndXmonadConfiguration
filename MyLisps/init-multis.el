;; -*- Emacs-Lisp -*-
;;; init-multis.el ---
;; Time-stamp: <2013-04-12 11:25:18 Friday by lzy>

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
;;   (require 'init-multis)

;;; Code:

;; required features
(require 'multi-term)
(require 'multi-scratch)

(defun set-ansi-term-color ()
  "color setting for ansi term"
  (set-face-background 'term "black")
  (set-face-foreground 'term "green")
  (if (>= emacs-major-version 24)
      (progn
        (defface term-color-light-yellow
          '((t :foreground "yellow" :background "yellow"))
          "Face used to render light yellow color code."
          :group 'term)
        (defface term-color-light-green
          '((t :foreground "green" :background "green"))
          "Face used to render light green color code."
          :group 'term)
        (defface term-color-red2
          '((t :foreground "red2" :background "red2"))
          "Face used to render red2 color code."
          :group 'term)
        (defface term-color-skyblue
          '((t :foreground "DeepSkyBlue" :background "DeepSkyBlue"))
          "Face used to render skyblue color code."
          :group 'term)
        (setq ansi-term-color-vector
              [term
               term-color-black
               term-color-red2
               term-color-light-green
               term-color-light-yellow
               term-color-skyblue
               term-color-magenta
               term-color-cyan
               term-color-white]))
    (setq ansi-term-color-vector
          [unspecified
           "black"
           "red3"
           "green"
           "yellow"
           "DeepSkyBlue"
           "magenta3"
           "cyan3"
           "white"])))

(defun term-send-esc ()
  "Send ESC in term mode"
  (interactive)
  (term-send-raw-string "\e"))

(defun multi-term-setting ()
  "settings for multi-term"
  (setq multi-term-program "/bin/bash")
  (add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc) t)
  (add-to-list 'term-bind-key-alist '("C-p" . term-send-up) t)
  (add-to-list 'term-bind-key-alist '("C-n" . term-send-down) t))

(add-hook 'term-mode-hook 'set-ansi-term-color)

(eval-after-load "multi-term"
  '(multi-term-setting))

(autoload 'multi-scratch-new "multi-scratch"
  "Create a new multi-scratch buffer" t)
(autoload 'multi-term "multi-term"
  "Create new term buffer" t)

(lazy-set-key
 '(("<f9>" . multi-scratch-new)
   ("C-<f9>" . multi-term)))

;;; provide features
(provide 'init-multis)

;;; init-multis.el ends here
