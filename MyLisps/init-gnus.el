;;; init-gnus.el ---
;; Time-stamp: <2012-12-07 06:52:51 Friday by lzy>

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
;;   (require 'init-gnus)

;;; Code:


(provide 'init-gnus)

(defun gnus-setting ()
  "setting for gnus"
  ;;; required features
  (require 'gnus)
  (require 'gnus-notify)

  ;; directory setting
  (setq gnus-default-directory "~/.emacs.d/Gnus/")                        ;default directory
  (setq gnus-home-directory "~/.emacs.d/Gnus/")                           ;home directory
  (setq gnus-dribble-directory "~/.emacs.d/Gnus/")                        ;restore directory
  (setq gnus-directory "~/.emacs.d/Gnus/News/")                           ;news group directory
  (setq gnus-article-save-directory "~/.emacs.d/Gnus/News/Article/")      ;article save directory
  (setq gnus-kill-files-directory "~/.emacs.d/Gnus/News/Trash/")          ;article delete directory
  (setq nntp-marks-directory "~/.emacs.d/Gnus/News/Marks/")               ;nntp save directory
  (setq gnus-agent-directory "~/.emacs.d/Gnus/News/Agent/")               ;agent directory
  (setq gnus-cache-directory "~/.emacs.d/Gnus/News/Cache/")               ;cache directory
  (setq gnus-cache-active-file "~/.emacs.d/Gnus/News/Cache/active")       ;cache active directory
  (setq nnml-newsgroups-file "~/.emacs.d/Gnus/News/newsgroup")            ;news group file
  (setq message-directory "~/.emacs.d/Gnus/Mail/")                        ;mail save directory
  (setq message-auto-save-directory "~/.emacs.d/Gnus/Mail/Drafts/")       ;mail draft directory
  (setq mail-source-directory "~/.emacs.d/Gnus/Mail/Incoming/")           ;incoming mail directory
  (setq mml-default-directory "~/.emacs.d/Gnus/Mail/Attachment/")         ;mail attachment directory
  (setq nnmail-message-id-cache-file "~/.emacs.d/Gnus/Mail/nnmail-cache") ;nnmail message id cache file

  ;; news group and mail setting
  (setq user-full-name "chieftain")                        ;full name
  (setq user-mail-address "lizhengyu419@gmail.com")        ;mail address
  (setq gnus-select-method '(nntp "news.aioe.org"))        ;main method
  (setq gnus-secondary-select-methods                      ;secondary select methods
        '(
          (nntp "news.newsfan.net")
          ))

  ;; normal setting
  (gnus-agentize)                                     
  (setq gnus-inhibit-startup-message t)               
  (setq gnus-novice-user nil)                         
  (setq gnus-expert-user t)                           
  (setq gnus-show-threads t)                          
  (setq gnus-interactive-exit nil)                    
  (setq gnus-use-dribble-file nil)                    
  (setq gnus-always-read-dribble-file nil)            
  (setq gnus-asynchronous t)                          
  (setq gnus-large-newsgroup 100)                     
  (setq gnus-large-ephemeral-newsgroup nil)           
  (setq gnus-summary-ignore-duplicates t)             
  (setq gnus-treat-fill-long-lines t)                 
  (setq message-confirm-send t)                       
  (setq message-kill-buffer-on-exit t)                
  (setq message-from-style 'angles)                   
  (setq message-syntax-checks '((sender . disabled))) 
  (setq nnmail-expiry-wait 7)                         
  (setq nnmairix-allowfast-default t)                 

  ;; character coding setting
  (setq gnus-default-charset 'chinese-iso-8bit
        gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
        gnus-summary-show-article-charset-alist
        '((1 . cn-gb-2312)
          (2 . gb18030)
          (3 . chinese-iso-8bit)
          (4 . gbk)
          (5 . big5)
          (6 . utf-8))
        gnus-newsgroup-ignored-charsets
        '(unknown-8bit x-unknown iso-8859-1 gb18030))

  ;; windows configuration
  (gnus-add-configuration
   '(article
     (vertical 1.0
               (summary .35 point)
               (article 1.0))))

  ;; show setting
  (setq mm-text-html-renderer 'w3m)                     ;display html with w3m
  ;; (setq mm-inline-large-images t)                       ;show image
  (auto-image-file-mode)                                ;load image automatically
  (add-to-list 'mm-attachment-override-types "image/*") 

  (setq gnus-summary-gather-subject-limit 'fuzzy)
  (setq gnus-summary-line-format "%4P %U%R%z%O %{%5k%} %{%14&user-date;%}   %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
  (defun gnus-user-format-function-a (header)
    (let ((myself (concat "< lizhengyu419@gmail.com >"))
          (references (mail-header-references header))
          (message-id (mail-header-id header)))
      (if (or (and (stringp references)
                   (string-match myself references))
              (and (stringp message-id)
                   (string-match myself message-id)))
          "X" "│")))
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

  ;; time display setting
  (add-hook 'gnus-article-prepare-hook 'gnus-article-date-local) ;translate mail sending time to local time
  (add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)   ;trace time axes of group
  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)              ;news group display mode

  ;; visual header of mail setting
  (setq gnus-visible-headers
        (mapconcat 'regexp-quote
                   '("From:" "Newsgroups:" "Subject:" "Date:"
                     "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:"
                     "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:"
                     "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing"
                     "X-Attachments" "X-Diagnostic")
                   "\\|"))
  ;; all kinds of citation setting
  (setq sc-attrib-selection-list nil
        sc-auto-fill-region-p nil
        sc-blank-lines-after-headers 1
        sc-citation-delimiter-regexp "[>]+\\|\\(: \\)+"
        sc-cite-blank-lines-p nil
        sc-confirm-always-p nil
        sc-electric-references-p nil
        sc-fixup-whitespace-p t
        sc-nested-citation-p nil
        sc-preferred-header-style 4
        sc-use-only-preference-p nil)

  ;; thread setting
  (setq
   gnus-use-trees t                                                       
   gnus-tree-minimize-window nil                                          
   gnus-fetch-old-headers 'some                                           
   gnus-generate-tree-function 'gnus-generate-horizontal-tree             
   gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject 
   )

  ;; sort setting
  (setq gnus-thread-sort-functions
        '(
          (not gnus-thread-sort-by-date)                              
          (not gnus-thread-sort-by-number)))                          
  ;; go to the first unread group
  (add-hook 'gnus-switch-on-after-hook 'gnus-group-first-unread-group)
  (add-hook 'gnus-summary-exit-hook 'gnus-group-first-unread-group)

  ;; strip regexp setting
  (setq gnus-summary-stripe-regexp
        (concat "^[^"
                gnus-sum-thread-tree-vertical
                "]*")))

(eval-after-load "gnus"
  '(gnus-setting))

;;; init-gnus.el ends here
