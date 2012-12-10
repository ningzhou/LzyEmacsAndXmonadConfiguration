;;; which-func-setting.el --- 
;; Time-stamp: <2012-12-07 06:36:48 Friday by lzy>

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


(provide 'which-func-setting)

(defun which-func-setting ()
  "Setting for `which-func'."
  ;; required features
  (require 'which-func)

  ;; func definition
  (defun copy-current-fun-name ()
    "Copy current function name."
    (interactive)
    (kill-new (which-function)))

  ;; setting
  (which-func-mode 1)
  (setq which-func-unknown "unknown")
  (lazy-set-key
   '(("C-c M-F" . copy-current-fun-name))
   c-mode-base-map)
  )

(eval-after-load "cc-mode"
  '(which-func-setting))

;;; which-func-setting.el ends here
