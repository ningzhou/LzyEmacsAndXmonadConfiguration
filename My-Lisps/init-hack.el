;; -*- Emacs-Lisp -*-
;;; init-hack.el ---
;; Time-stamp: <2012-12-10 17:13:40 星期一 by lzy>

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
;;   (require 'init-hack)

;;; Code:


(provide 'init-hack)


;; required features
(require 'basic-tools)

(defun search-read-words ()
  "reads words"
  (let ((words (get-current-word)))
    (setq words
          (read-string "Search: " words)))
  )

(defun search-forward-hack (words)
  "hack edition of search forward"
  (interactive
   (list (search-read-words)))
  (search-forward words)
  )

(defun search-backward-hack (words)
  "hack edition of search backward"
  (interactive
   (list (search-read-words)))
  (search-backward words)
  )

(lazy-set-key
 '(("C-s" . search-forward-hack)
   ("C-r" . search-backward-hack)))

;;; init-hack.el ends here
