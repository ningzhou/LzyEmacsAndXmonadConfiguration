;; -*- Emacs-Lisp -*-
;;; init-newsticker.el ---
;; Time-stamp: <2013-03-31 19:19:17 Sunday by lzy>

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
;;   (require 'init-newsticker)

;;; Code:


(defun newsticker-setting ()
  "settings for newsticker"
  ;; required features
  (require 'w3m)
  (require 'newsticker)

  ;; settings
  (setq newsticker-dir "~/.emacs.d/Newsticker")
  (setq newsticker-url-list-defaults nil)
  (setq newsticker-automatically-mark-items-as-old nil)
  (setq newsticker-automatically-mark-visited-items-as-old t)
  (setq newsticker-retrieval-interval 600)
  (setq newsticker-html-renderer 'w3m-region)
  (setq newsticker-retrieval-method 'extern)
  (setq newsticker-treeview-treewindow-width 20)
  (setq newsticker-treeview-listwindow-height 5)
  (setq newsticker-wget-arguments
        '("-q" "-O" "-" "--user-agent" "testing"))
  (setq newsticker-url-list
        '(("EmacsWiki"
           "http://www.emacswiki.org/emacs/index.rss"
           nil nil nil)
          ("PlanetEmacsen"
           "http://planet.emacsen.org/atom.xml"
           nil nil nil)
          ("LUPAOpenSourceNews"
           "http://www.lupaworld.com/myrss.php"
           nil nil nil)
          ("EmacsBlog"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=emacs&ie=utf-8&num=50&output=atom"
           nil 86400 nil)
          ("LinuxkernelBlog"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=linux%20kernel&ie=utf-8&num=50&output=atom"
           nil 86400 nil)
          ("LinuxtoyBlog"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=linuxtoy&ie=utf-8&num=50&output=atom"
           nil 86400 nil)
          ("HaskellBlog"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=haskell&ie=utf-8&num=50&output=atom"
           nil 86400 nil))))

(eval-after-load "newst-treeview"
  '(newsticker-setting))

(autoload 'newsticker-treeview "newst-treeview"
  "Start newsticker treeview" t)

(defalias 'newsticker 'newsticker-treeview)

;;; provide features
(provide 'init-newsticker)

;;; init-newsticker.el ends here
