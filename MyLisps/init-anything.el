;; -*- Emacs-Lisp -*-
;;; init-anything.el ---
;; Time-stamp: <2013-03-11 13:26:05 Monday by lzy>

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
;;   (require 'init-anything)

;;; Code:


(provide 'init-anything)


(defun anything-setting ()
  "settings for anything"
  ;; required features
  (require 'anything-config)              ;Anything config
  (require 'anything-complete)            ;Anything 补全
  (require 'anything-match-plugin)        ;Anything 匹配算法的人性话提升
  (require 'anything-gtags)               ;Anything 结合 Gtags
  (require 'anything-c-moccur)            ;Anything 和 moccur搜索

  ;; settings
  (setq anything-idle-delay 1.0)                        ;设定开始显示 `延迟源' 的空闲间隔时间
  (setq anything-quick-update t)                        ;不显示提示窗口外的变量, 加快刷新速度
  (setq anything-candidate-number-limit 10000)          ;候选数量限制
  (setq anything-etags-enable-tag-file-dir-cache t)     ;使用缓存的tag文件
  (setq anything-c-use-standard-keys nil)               ;不使用标准按键
  (setq anything-etags-cache-tag-file-dir "~/.emacs.d/Anything/") ;tag缓存文件的目录

  (setq anything-c-google-suggest-url                   ;设置Google建议允许访问的URL
        "http://www.google.cn/complete/search?hl=en&js=true&qu=")
  (setq anything-sources                  ;Anything 源列表
        (list
         anything-c-source-ffap-guesser             ;光标处的文件
         anything-c-source-buffers                  ;Buffer
         anything-c-source-recentf                  ;最近打开的文件列表
         anything-c-source-file-name-history        ;文件名历史
         anything-c-source-locate                   ;本地文件
         anything-c-source-files-in-current-dir+    ;当前目录的文件
         anything-c-source-extended-command-history ;Emacs命令历史
         ;; anything-c-source-info-elisp               ;Info Elisp
         ;; anything-c-source-info-cl                  ;Info Common-Lisp
         ;; anything-c-source-info-pages               ;Info Pages
         anything-c-source-fixme                    ;FIX ME
         anything-c-source-semantic                 ;Sematic Tag
         anything-c-source-etags-select             ;etags
         anything-c-source-gtags-select             ;Gtags
         anything-c-source-emacs-commands           ;Emacs 命令相关的
         anything-c-source-complex-command-history  ;复杂命令历史
         ;;anything-c-source-complete-shell-history   ;Shell历史
         anything-c-source-occur                    ;occur 搜索, (后面一点, 增加性能)
         ;;anything-c-source-man-pages                ;man
         anything-c-source-emacs-process            ;进程
         anything-c-source-call-source              ;call source
         ;;anything-c-source-customize-face           ;自定义颜色
         anything-c-source-bbdb                     ;bbdb
         ;;anything-c-source-colors                   ;颜色
         anything-c-source-buffer-not-found         ;创建buffer
         anything-c-source-tracker-search           ;Tracker桌面搜索
         anything-c-source-calculation-result       ;计算结果
         anything-c-source-evaluation-result        ;执行表达式结果
         anything-c-source-kill-ring                ;Kill ring
         )
        )
  )

(eval-after-load "anything"
  '(anything-setting))

(defun anything-preload ()
  "preload edition"
  (interactive)
  (require 'anything)
  (anything)
  )

(lazy-set-key
 '(("C-<f6>" . anything-preload)))

;;; init-anything.el ends here
