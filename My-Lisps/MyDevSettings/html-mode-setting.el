;;; html-mode-setting.el --- 
;; Time-stamp: <2012-12-07 06:34:37 Friday by lzy>

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


(provide 'html-mode-setting)


(defun html-setting ()
  "setting for html"
  (add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))
  (add-to-list 'auto-mode-alist '("\\.css$" . html-mode))
  (add-to-list 'auto-mode-alist '("\\.cfm$" . html-mode))

  (defun w3m-browse-current-buffer ()
    (interactive)
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

  (lazy-set-key
   '(("C-j" . newline-and-indent)
     ("C-c k" . uncomment)
     ("C-c C-w" . w3m-browse-current-buffer))
   sgml-mode-map)
  )

(eval-after-load "sgml-mode"
  '(html-setting))

;;; html-mode-setting.el ends here
