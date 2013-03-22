;; -*- Emacs-Lisp -*-
;;; init-gnus.el ---
;; Time-stamp: <2013-03-22 08:35:57 Friday by lzy>

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
;;   (require 'init-gnus)

;;; Code:

(defun gnus-setting ()
  "settings for gnus"
  ;; required features
  (require 'mml)
  (require 'nnmail)
  (require 'message)
  (require 'gnus-art)
  (require 'gnus-sum)
  (require 'gnus-start)
  (require 'gnus-agent)
  (require 'gnus-cache)
  (require 'gnus-group)
  (require 'gnus-notify)
  (require 'mail-source)

  ;; functions definition
  (defun gnus-user-format-function-a (header)
    (let ((myself (concat "< lizhengyu419@gmail.com >"))
          (references (mail-header-references header))
          (message-id (mail-header-id header)))
      (if (or (and (stringp references)
                   (string-match myself references))
              (and (stringp message-id)
                   (string-match myself message-id)))
          "X"
        "│")))

  ;; settings
  (setq gnus-home-directory "~/.emacs.d/Gnus/")
  (setq gnus-directory "~/.emacs.d/Gnus/News/")
  (setq gnus-default-directory "~/.emacs.d/Gnus/")
  (setq gnus-dribble-directory "~/.emacs.d/Gnus/")
  (setq gnus-agent-directory "~/.emacs.d/Gnus/News/Agent/")
  (setq gnus-cache-directory "~/.emacs.d/Gnus/News/Cache/")
  (setq gnus-kill-files-directory "~/.emacs.d/Gnus/News/Trash/")
  (setq gnus-cache-active-file "~/.emacs.d/Gnus/News/Cache/active")
  (setq gnus-article-save-directory "~/.emacs.d/Gnus/News/Article/")
  (setq message-directory "~/.emacs.d/Gnus/Mail/")
  (setq message-auto-save-directory "~/.emacs.d/Gnus/Mail/Drafts/")
  (setq mail-source-directory "~/.emacs.d/Gnus/Mail/Incoming/")
  (setq mml-default-directory "~/.emacs.d/Gnus/Mail/Attachment/")
  (setq nnmail-message-id-cache-file "~/.emacs.d/Gnus/Mail/nnmail-cache")
  ;; news group setting
  (setq gnus-select-method '(nntp "news.aioe.org"))
  (setq gnus-secondary-select-methods '((nntp "news.newsfan.net")))
  ;; normal setting
  (gnus-agentize)
  (setq gnus-expert-user t)
  (setq gnus-show-threads t)
  (setq gnus-novice-user nil)
  (setq gnus-large-newsgroup 100)
  (setq gnus-interactive-exit nil)
  (setq gnus-use-dribble-file nil)
  (setq gnus-treat-fill-long-lines t)
  (setq gnus-inhibit-startup-message t)
  (setq gnus-summary-ignore-duplicates t)             
  (setq gnus-always-read-dribble-file nil)
  (setq gnus-large-ephemeral-newsgroup nil)
  (setq message-confirm-send t)
  (setq message-from-style 'angles)
  (setq message-kill-buffer-on-exit t)
  (setq nnmail-expiry-wait 7) 
  ;; coding setting
  (setq gnus-default-charset 'chinese-iso-8bit)
  (setq gnus-group-name-charset-group-alist '((".*" . cn-gb-2312)))
  (setq gnus-newsgroup-ignored-charsets
        '(unknown-8bit x-unknown iso-8859-1 gb18030))
  (setq gnus-summary-show-article-charset-alist
        '((1 . cn-gb-2312)
          (2 . gb18030)
          (3 . chinese-iso-8bit)
          (4 . gbk)
          (5 . big5)
          (6 . utf-8)))
  ;; window setting
  (gnus-add-configuration
   '(article (vertical 1.0 (summary .35 point) (article 1.0))))
  ;; show setting
  (setq mm-text-html-renderer 'gnus-w3m)
  (setq mm-inline-large-images t)
  (auto-image-file-mode)
  (add-to-list 'mm-attachment-override-types "image/*") 
  (setq gnus-summary-gather-subject-limit 'fuzzy)
  (setq gnus-summary-line-format
        "%4P %U%R%z%O %{%5k%} %{%14&user-date;%}   %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
  (setq gnus-user-date-format-alist
        '(((gnus-seconds-today) . "TD %H:%M")
          (604800 . "W%w %H:%M")
          ((gnus-seconds-month) . "%d %H:%M")
          ((gnus-seconds-year) . "%m-%d %H:%M")
          (t . "%y-%m-%d %H:%M")))
  ;;threads visualization
  (setq gnus-summary-same-subject "")
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-single-indent "◎ ")
  (setq gnus-sum-thread-tree-root "● ")
  (setq gnus-sum-thread-tree-false-root "☆")
  (setq gnus-sum-thread-tree-vertical "│")
  (setq gnus-sum-thread-tree-leaf-with-other "├─► ")
  (setq gnus-sum-thread-tree-single-leaf "╰─► ")
  ;; visual header of mail setting
  (setq gnus-visible-headers
        (mapconcat 'regexp-quote
                   '("From:" "Newsgroups:" "Subject:" "Date:"
                     "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:"
                     "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:"
                     "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing"
                     "X-Attachments" "X-Diagnostic")
                   "\\|"))
  ;; thread setting
  (setq gnus-use-trees t)
  (setq gnus-fetch-old-headers 'some)
  (setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject)
  ;; sort setting
  (setq gnus-thread-sort-functions
        '((not gnus-thread-sort-by-date)
          (not gnus-thread-sort-by-number)))
  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
  (add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
  (add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)
  (add-hook 'gnus-summary-exit-hook 'gnus-group-first-unread-group))

(eval-after-load "gnus"
  '(gnus-setting))

;;; provide features
(provide 'init-gnus)

;;; init-gnus.el ends here
