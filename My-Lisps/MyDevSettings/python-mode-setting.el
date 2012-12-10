;;; python-mode-setting.el ---
;; Time-stamp: <2012-12-07 06:36:13 Friday by lzy>

;; Copyright (C) 2012 zhengyu li
;;
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'python-mode-setting)

;;; Code:


(provide 'python-mode-setting)

(defun python-mode-setting ()
  "setting for python mode"
  ;; setting
  (lazy-set-key
   '(("RET" . newline-and-indent)
     ("C-j" . newline-and-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment))
   python-mode-map)
  )

(eval-after-load "python"
  '(python-mode-setting))

;;; python-mode-setting.el ends here

