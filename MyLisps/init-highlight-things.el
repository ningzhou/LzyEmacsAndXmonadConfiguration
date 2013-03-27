;; -*- Emacs-Lisp -*-
;;; init-highlight-things.el ---
;; Time-stamp: <2013-03-27 16:35:12 Wednesday by lzy>

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
;;   (require 'init-highlight-things)

;;; Code:

;;============================================================
;;; highlight tail settings
(require 'highlight-tail)

(setq highlight-tail-colors
      '(("black" . 0)
        ("red3" . 25)
        ("black" . 66)))

(highlight-tail-mode 1)

;;============================================================
;;; highlight sexp settings
(defun highlight-sexp-setting ()
  "settings for highlight sexp"
  ;; required features
  (require 'highlight-sexp)
  ;; settings
  (custom-set-variables
   '(hl-sexp-background-color "#002011"))
  (hl-line-mode -1)
  (highlight-sexp-mode 1))

(add-hook 'lisp-mode-hook 'highlight-sexp-setting)
(add-hook 'emacs-lisp-mode-hook 'highlight-sexp-setting)
(add-hook 'lisp-interaction-mode-hook 'highlight-sexp-setting)

;;; provide features
(provide 'init-highlight-things)

;;; init-highlight-things.el ends here
