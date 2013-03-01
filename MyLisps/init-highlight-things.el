;; -*- Emacs-Lisp -*-
;;; init-highlight-things.el ---
;; Time-stamp: <2012-12-07 06:55:22 Friday by lzy>

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
;;   (require 'init-highlight-things)

;;; Code:


(provide 'init-highlight-things)


;; required features
(require 'highlight-sexp)
(require 'highlight-tail)

(defun highlight-tail-setting ()
  "setting for highlight tail"
  (setq highlight-tail-colors
          '(("black" . 0)
            ("red3" . 25)
            ("black" . 66)))
  (highlight-tail-mode t))

(eval-after-load "init-highlight-things"
  '(highlight-tail-setting))

;;; init-highlight-things.el ends here

