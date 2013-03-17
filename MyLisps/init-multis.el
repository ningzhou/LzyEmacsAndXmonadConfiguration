;;; init-multis.el --- 
;; Time-stamp: <2013-03-17 18:51:57 Sunday by lzy>

;; Copyright (C) 2012  zhengyu li

;; Author: zhengyu li <lizhengyu419@gmail.com>
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

;;; Code:


(provide 'init-multis)


;; required features
(require 'multi-term)
(require 'multi-scratch)

(defun set-ansi-term-font ()
  "font setting for ansi term"
  (interactive)
  (setq buffer-face-mode-face
        '(:family "Monospace" :height 1.0 :weight normal))
  (buffer-face-mode))

(defun set-ansi-term-color ()
  "color setting for ansi term"
  (if (and (>= emacs-major-version 24)
           (>= (+ emacs-major-version emacs-minor-version) 27))
      (progn
        (set-face-background 'term "black")
        (set-face-foreground 'term "green")

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
    (progn
        (setq term-default-fg-color "black")
        (setq term-default-bg-color "green")
        (setq ansi-term-color-vector
        [unspecified "black" "red3" "green" "yellow" "DeepSkyBlue"
                     "magenta3" "cyan3" "white"]))
    ))

(defun term-send-esc ()
  "Send ESC in term mode"
  (interactive)
  (term-send-raw-string "\e"))

(defun multis-setting ()
  "setting for multi-shell, multi-terminal and multi-scratch"
  (setq multi-term-program "/bin/bash")

  (add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))
  (lazy-set-key
   '(("<f9>" . multi-scratch-new)
     ("C-<f9>" . multi-term)))

  (add-hook 'term-mode-hook 'set-ansi-term-font)
  (add-hook 'term-mode-hook 'set-ansi-term-color))

(eval-after-load "init-multis"
  '(multis-setting))

;;; init-multis.el ends here
