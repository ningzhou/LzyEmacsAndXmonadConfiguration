;; -*- Emacs-Lisp -*-
;;; html-mode-setting.el ---
;; Time-stamp: <2013-04-25 16:41:56 Thursday by lzy>

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
;;   (require 'html-mode-setting)

;;; Code:

(defun html-mode-setting ()
  "settings for html mode"
  ;; functions definition
  (defun w3m-browse-current-buffer ()
    (interactive)
    (require 'w3m)
    (let ((filename (concat (make-temp-file "w3m-") ".html")))
      (unwind-protect
          (progn
            (write-region (point-min) (point-max) filename)
            (w3m-find-file filename))
        (delete-file filename))))

  (defun add-target-to-link ()
    "Add \"target=\"_blank\" to link."
    (interactive)
    (query-replace-regexp "<a\\s-+href=\\(\"[^\"#][^\"]*?\"\\)>\\(.*?\\)</a>" "<a href=\\1 target=\"_blank\">\\2</a>"))

  ;; settings
  (add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))

  ;; key bindings
  (lazy-set-key
   '(("C-x <tab>" . smart-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment)
     ("C-c M-a" . beginning-of-defun)
     ("C-c M-e" . end-of-defun)
     ("C-c C-w" . w3m-browse-current-buffer))
   html-mode-map))

(eval-after-load "sgml-mode"
  '(html-mode-setting))

;;; provide features
(provide 'html-mode-setting)

;;; html-mode-setting.el ends here
