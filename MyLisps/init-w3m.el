;;; init-w3m.el --- 
;; Time-stamp: <2013-03-01 17:47:01 Friday by lzy>

;; Copyright (C) 2012  zhengyu li

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

;;; Code:


(provide 'init-w3m)


;; require features
(require 'w3m)                          ;W3M
(require 'w3m-search)                   ;w3m搜索
(require 'w3m-bookmark)                 ;w3m书签
(require 'w3m-tabmenu)                  ;W3m标签菜单
(require 'w3m-wget)                     ;W3m wget 集成
(require 'w3m-lnum)                     ;W3M 数字快速导航
(require 'w3m-form)                     ;W3m 表格
(require 'w3m-util)                     ;w3m 工具
(require 'w3m-symbol)                   ;w3m 符号处理
(require 'w3m-extension)
(require 'lazycat-toolkit-)

;; w3m proxy
(defun w3m-toggle-proxy (&optional proxy)
  "Toggle proxy. With prefix, set proxy on."
  (interactive "sProxy Server:")
  (if (string= proxy "")
      (progn
        (setenv "http_proxy" nil)
        (message "turn w3m proxy off"))
    (if (string-match "^http://" proxy)
        (setenv "http_proxy" proxy)
      (setenv "http_proxy" (concat "http://" proxy)))
    (message "set w3m proxy to %s" (getenv "http_proxy"))))

;; Google 广告过滤
(defun my-w3m-filter-rules-for-google (&rest args)
  "Filter rules for Google in w3m."
  (goto-char (point-min))
  (while (re-search-forward             ;remove publicize from google.cn or google.com
          "\\(赞助商链接\\|<h2>Sponsored Links</h2>\\).*aclk.*\\(</cite></ol><p>\\|在此展示您的广告\\)"
          nil t)
    (replace-match ""))
  (while (re-search-forward             ;remove publicize from google.com (English)
          "<h2>Sponsored Links</h2>.*aclk.*<h2>Search Results</h2>"
          nil t)
    (replace-match "")))

(defun w3m-setting ()
  "setting for w3m"
  (setq my-homepage "")                   ;
  (setq my-default-download-directory "~/Downloads/")
  ;; 常规设置
  (setq browse-url-browser-function 'w3m-browse-url)      ;设定用Emacs－wiki打开URL
  (setq browse-url-new-window-flag t)                     ;用适当的浏览器打开新窗口
  (setq w3m-home-page my-homepage)                        ;设置首页
  (setq w3m-make-new-session t)                           ;当浏览一个新的页面时开启一个新的缓存页面
  (setq w3m-use-cookies t)                                ;启用cookie
  (setq w3m-use-header-line-title t)                      ;显示标题
  (setq w3m-cookie-accept-bad-cookies t)                  ;接收 BAD cookie
  (setq w3m-view-this-url-new-session-in-background t)    ;后台打开连接
  (setq w3m-new-session-in-background t)                  ;后台建立新任务
  (setq w3m-session-time-format "%Y-%m-%d %A %H:%M")      ;上次浏览记录的时间显示格式
  (setq w3m-favicon-use-cache-file t)                     ;使用网站图标的缓存文件
  (setq w3m-show-graphic-icons-in-mode-line t)            ;不在mode-line显示网站图标
  (setq w3m-keep-arrived-urls 50000)                      ;浏览历史记录的最大值
  (setq w3m-keep-cache-size 1000)                         ;缓存的大小
  (setq w3m-edit-function (quote find-file-other-window)) ;在其他窗口编辑当前页面
  (setq w3m-session-automatic-save t)                     ;退出时自动保存
  (setq w3m-session-deleted-save nil)                     ;关闭一个标签时不保存
  (setq w3m-default-display-inline-images t)              ;显示网页中的图像
  (setq w3m-toggle-inline-images-permanently t)           ;继续保持当前buffer的图像状态
  (setq w3m-enable-google-feeling-lucky nil)              ;禁止使用 Google Lucky
  (setq w3m-use-filter t)                                 ;开启过滤
  (setq w3m-filter-google-separator "")                   ;设置过滤器的分离字符
  (setq w3m-fb-mode t)                                    ;让标签和创建它的FRAME关联
  (setq w3m-session-load-crashed-sessions t)              ;默认加载崩溃的对话
  (setq wget-hide-status t)                               ;show wget status
  (w3m-fb-mode 1)                                         ;可以显示FRAME
  ;; 存储设置
  (setq w3m-default-save-directory my-default-download-directory)             ;设置默认的保存目录
  (setq w3m-bookmark-file "~/.emacs.d/W3M/bookmark.html") ;设定书签文件
  (setq w3m-cookie-file "~/.emacs.d/W3M/W3m-cookie")      ;设置w3m-cookie保存位置
  (setq w3m-session-file "~/.emacs.d/W3M/W3m-session")    ;设定任务保存的文件位置
  ;; 修改Buffer名字为网页的标题或链接, 以利于 anything 搜索
  (add-hook 'w3m-display-hook
            (lambda (url)
              (rename-buffer
               (format "*w3m: %s*"
                       (prettyfy-string (or w3m-current-title
                                            w3m-current-url) 50)) t)))
  (eval-after-load "w3m-filter"
    '(add-to-list 'w3m-filter-rules
                  '("\\`http://www\\.google\\.\\(cn\\|com\\)/"
                    my-w3m-filter-rules-for-google)))

  (lazy-set-key
   '(
     ("C-<f8>" . w3m)                          
     ("C-x C-z" . toggle-w3m-with-other-buffer)))

  (lazy-set-key
   '(("1" . emms-play-online)                             ;在线听音乐
     ("2" . w3m-open-rcirc-window)                        ;打开RCIRC窗口
     ("3" . w3m-session-save)                             ;保存浏览纪录
     ("4" . w3m-session-select)                           ;加载退出前的浏览器纪录
     ("5" . w3m-emacswiki-view-other-version)             ;查看当前wiki页面的其他版本
     ("6" . w3m-auto-install-elisp)                       ;自动安装elisp文件
     ("7" . w3m-gmail-toggle-mark)                        ;切换标记选项框
     ("(" . w3m-gmail-mark-all)                           ;标记选项框
     (")" . w3m-gmail-unmark-all)                         ;取消标记选项框
     ("c" . w3m-delete-buffer-and-select-right)           ;关闭当前标签并选择右边的标签
     ("f" . w3m-next-form)                                ;下一个表格处
     ("b" . w3m-previous-form)                            ;previous form
     ("B" . w3m-previous-anchor)                          ;previous anchor
     ("e" . w3m-edit-current-url)                         ;编辑当前页面
     ("z" . w3m-zoom-in-image)                            ;放大图片
     ("x" . w3m-zoom-out-image)                           ;缩小图片
     ("O" . w3m-goto-linknum)                             ;数字连接快速跳转
     ("n" . w3m-scroll-up-1)                              ;可视化向上滚动
     ("p" . w3m-visual-scroll-down)                       ;可视化向下滚动
     ("H" . w3m-history)                                  ;历史
     ("D" . w3m-dtree)                                    ;显示本地目录树
     ("P" . w3m-view-previous-page)                       ;后退
     ("F" . w3m-view-next-page)                           ;前进
     ("S" . w3m-search-new-session)                       ;w3m search
     ("L" . w3m-submit-form)                              ;提交form中的内容
     ("C" . w3m-delete-other-buffers)                     ;关闭后台标签
     ("d" . w3m-download-with-wget-current-position)      ;用Wget异步下载当前地连接
     ("Y" . wget-web-page)                                ;网页下载
     ("o" . org-w3m-copy-for-org-mode)                    ;转换网页成 `org-mode' 的链接格式
     ("_" . w3m-copy-link-in-region)                      ;拷贝w3m buffer 的所有链接
     ("&" . yaoddmuse-w3m-edit-emacswiki-page)            ;编辑 emacswiki 页面
     ("*" . w3m-emacswiki-view-diff)                      ;查看当前wiki页面的不同
     ("\"" . w3m-emacswiki-recent-changes)                ;最近的修改
     ("C-u s" . w3m-db-history)                           ;历史数据库
     ("<up>" . w3m-visual-scroll-down)                    
     ("<down>" . w3m-scroll-up-1)                         
     ("<left>" . emms-seek-backward)                      ;后退
     ("<right>" . emms-seek-forward)                      ;前进
     ("<" . w3m-shift-left)                               ;向左滚动屏幕一像素
     (">" . w3m-shift-right)                              ;向右滚动屏幕一像素
     ("." . go-to-char-forward-word)                      ;向后查找某一个字符, 以单词为单位前进
     ("," . go-to-char-backward-word)                     ;向前查找某一个字符, 以单词为单位后退
     ("M-s" . lazy-search-menu)                           ;懒惰搜索
     ("C-M-7" . w3m-tab-move-left)                        ;移动当前标签到左边
     ("C-M-8" . w3m-tab-move-right)                       ;移动当前标签到右边
     ("C-S-7" . w3m-delete-left-tabs)                     ;删除左边的标签
     ("C-S-8" . w3m-delete-right-tabs)                    ;删除右边的标签
     ("M-n" . w3m-next-buffer)
     ("M-p" . w3m-previous-buffer)
     )
   w3m-mode-map))

(eval-after-load "w3m"
  '(w3m-setting))

;;; init-w3m.el ends here
