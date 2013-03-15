;; -*- Emacs-Lisp -*-
;;; init-babel.el ---
;; Time-stamp: <2013-03-15 13:49:13 Friday by lzy>

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
;;   (require 'init-babel)

;;; Code:

(defun babel-settings ()
  "settings for babel mode"
  (custom-set-variables
   '(babel-preferred-from-language "English"))
  (custom-set-variables
   '(babel-preferred-to-language "Chinese (Simplified)"))
  (setq babel-backends
        '(("FreeTranslation" . free)
          ("Google" . google)
          ("Babelfish at Yahoo" . fish)))
  )

(eval-after-load "babel"
  '(babel-settings))

(autoload 'babel "babel"
  "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)

;;; provide features
(provide 'init-babel)

;;; init-babel.el ends here
