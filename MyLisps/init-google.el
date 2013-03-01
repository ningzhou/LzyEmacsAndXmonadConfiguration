;; -*- Emacs-Lisp -*-
;;; init-google.el ---
;; Time-stamp: <2012-12-07 06:54:00 Friday by lzy>

;; Copyright (C) 2012 chieftain
;;
;; Author: chieftain <lizhengyu419@gmail.com>
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
;;   (require 'init-google)

;;; Code:


(provide 'init-google)


;; required features
(require 'g)
(require 'google-weather)
(require 'org-google-weather)

;; use large icons
(defun google-setting ()
  "setting of google client and weather"
  (setq g-user-email "lizhengyu419@gmail.com")
  ;; (setq g-curl-common-options "--proxy 127.0.0.1:8087 --compressed --silent --location --location-trusted")
  (setq browse-url-browser-function 'w3m-browse-url)
  (setq org-google-weather-icon-directory (concat my-emacs-path "/WeatherIcons")))

(eval-after-load "init-google"
  '(google-setting))

;;; init-google.el ends here
