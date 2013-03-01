;; -*- Emacs-Lisp -*-
;;; init-newsticker.el ---
;; Time-stamp: <2012-12-07 07:05:39 Friday by lzy>

;; Copyright (C) 2012 zhengyu li
;;
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-newsticker)

;;; Code:


(provide 'init-newsticker)


(defun newsticker-setting ()
  "setting for newsticker"
  ;; required features
  (require 'newsticker)

  ;; setting
  (setq newsticker-dir "~/.emacs.d/Newsticker")                ;种子目录
  (setq newsticker-url-list-defaults nil)                      ;设置默认的列表为空
  (setq newsticker-automatically-mark-items-as-old t)          ;自动标记项目为已经检索的项目
  (setq newsticker-automatically-mark-visited-items-as-old t)  ;自动标记已经访问过的项目
  (setq newsticker-retrieval-interval 600)                     ;newsticker更新的时间周期(second)
  (setq newsticker-html-renderer 'w3m-region)                  ;用w3m处理HTML格式的信息
  (setq newsticker-retrieval-method 'extern)                   ;用wget抓取
  (setq newsticker-treeview-treewindow-width 35)               ;树列表宽度
  (setq newsticker-treeview-listwindow-height 10)              ;消息窗口高度
  (setq newsticker-wget-arguments '("-q" "-O" "-"              ;wget抓取参数
                                    "--user-agent" "testing")) ;--user-agent参数是为了从google上抓取
  (setq newsticker-url-list
        '(("EmacsWiki Recently Change"
           "http://www.emacswiki.org/emacs/index.rss"
           nil nil nil)
          ("Planet Emacsen"
           "http://planet.emacsen.org/atom.xml"
           nil nil nil)
          ("LUPA Open Source News"
           "http://www.lupaworld.com/myrss.php"
           nil nil nil)
          ("Google Blog Search -- Emacs"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=emacs&ie=utf-8&num=50&output=atom"
           nil 86400 nil)                 ;一天更新一次
          ("Google Blog Search -- linux kernel"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=linux%20kernel&ie=utf-8&num=50&output=atom"
           nil 86400 nil)                 ;一天更新一次
          ("Google Blog Search -- linuxtoy"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=linuxtoy&ie=utf-8&num=50&output=atom"
           nil 86400 nil)                 ;一天更新一次
          ("Google Blog Search -- Haskell"
           "http://blogsearch.google.com/blogsearch_feeds?hl=en&oe=UTF-8&q=haskell&ie=utf-8&num=50&output=atom"
           nil 86400 nil)                 ;一天更新一次
          )))

(eval-after-load "newst-reader"
  '(newsticker-setting))

;;; init-newsticker.el ends here
