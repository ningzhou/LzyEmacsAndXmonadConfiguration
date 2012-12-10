;;; autoconf-mode-setting.el --- 
;; Time-stamp: <2012-12-07 06:32:26 Friday by lzy>

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


(provide 'autoconf-mode-setting)


(defun autoconf-mode-setting ()
  "setting for autoconf"
  (lazy-set-key
   '(("C-c C-c" . comment)
     ("C-c k" . uncomment))
   autoconf-mode-map)
  )

(eval-after-load "autoconf"
  '(autoconf-mode-setting))

;;; autoconf-mode-setting ends here
