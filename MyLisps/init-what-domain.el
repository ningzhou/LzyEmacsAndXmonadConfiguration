;; -*- Emacs-Lisp -*-
;;; init-what-domain.el ---
;; Time-stamp: <2013-03-15 15:08:14 Friday by lzy>

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
;;   (require 'init-what-domain)

;;; Code:

(autoload 'what-domain "what-domain" "alias to what-domain-a2" t)
(autoload 'what-domain-a2 "what-domain" "`what-domain' is aliased to this" t)
(autoload 'what-domain-a3 "what-domain" "lets you query 3-letter country codes" t)
(autoload 'what-domain-num "what-domain" "lets you query numeric country codes" t)
(autoload 'what-domain-apropos "what-domain" "lets you search for domain codes by name" t)

;;; provide features
(provide 'init-what-domain)

;;; init-what-domain.el ends here
