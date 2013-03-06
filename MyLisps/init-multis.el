;;; init-multis.el --- 
;; Time-stamp: <2013-03-06 11:44:07 Wednesday by lzy>

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
  (setq buffer-face-mode-face '(:family "Monospace" :height 1.0 :weight normal))
  (buffer-face-mode)
  ;; close yasnippet minor mode
  (yas-minor-mode 0)
  )

(defun term-send-esc ()
  "Send ESC in term mode"
  (interactive)
  (term-send-raw-string "\e"))

(defun multis-setting ()
  "setting for multi-shell, multi-terminal and multi-scratch"
  (setq multi-term-program "/bin/bash")
  (setq ansi-term-color-vector
        [unspecified "#000000" "#FF0000" "#FFFDA5" "#00FF00"
                     "#00AAFF" "#FF2180" "#57DCDB" "#FFFFFF"]) 

  (add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))
  (lazy-set-key
   '(("<f9>" . multi-scratch-new)
     ("C-<f9>" . multi-term)))

  (add-hook 'term-mode-hook 'set-ansi-term-font)
  (add-hook 'c-mode-common-hook '(lambda ()
                                   (require 'yasnippet)
                                   (yas-minor-mode 0))))

(eval-after-load "init-multis"
  '(multis-setting))

;;; init-multis.el ends here
