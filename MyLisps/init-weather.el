;; -*- Emacs-Lisp -*-
;;; init-weather.el ---
;; Time-stamp: <2013-03-20 07:50:07 Wednesday by lzy>

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
;;   (require 'init-weather)

;;; Code:

(eval-after-load "cn-weather"
  '(setq cn-weather-city "南京"))

(autoload 'cn-weather-today "cn-weather" nil t)
(autoload 'cn-weather-forecast "cn-weather" nil t)

(defalias 'weather 'cn-weather-today)
(defalias 'weather-tomorrow 'cn-weather-forecast)

;;; provide features
(provide 'init-weather)

;;; init-weather.el ends here
