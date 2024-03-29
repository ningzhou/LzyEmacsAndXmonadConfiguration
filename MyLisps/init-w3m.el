;; -*- Emacs-Lisp -*-
;;; init-w3m.el ---
;; Time-stamp: <2013-04-24 13:01:29 Wednesday by lzy>

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
;;   (require 'init-w3m)

;;; Code:

(defun w3m-setting ()
  "settings for w3m"
  ;; required features
  (require 'wget)
  (require 'w3m-fb)
  (require 'org-w3m)
  (require 'w3m-ems)
  (require 'w3m-form)
  (require 'w3m-lnum)
  (require 'w3m-util)
  (require 'w3m-wget)
  (require 'w3m-hist)
  (require 'w3m-image)
  (require 'w3m-cookie)
  (require 'w3m-symbol)
  (require 'w3m-search)
  (require 'w3m-filter)
  (require 'w3m-favicon)
  (require 'w3m-session)
  (require 'w3m-bookmark)
  (require 'w3m-extension)

  ;; functions definition
  (defun w3m-set-proxy (&optional proxy)
    "set proxy for w3m"
    (interactive "sProxy Server:")
    (if (string= proxy "")
        (setenv "http_proxy" nil)
      (if (string-match "^http://" proxy)
          (setenv "http_proxy" proxy)
        (setenv "http_proxy" (concat "http://" proxy)))
      (message "set w3m proxy to %s" (getenv "http_proxy"))))

  (defun w3m-filter-rules-for-google (&rest args)
    "Filter rules for Google in w3m.
   remove publicize from google.cn or google.com."
    (goto-char (point-min))
    (while (re-search-forward "\\(赞助商链接\\|<h2>Sponsored Links</h2>\\).*aclk.*\\(</cite></ol><p>\\|在此展示您的广告\\)" nil t)
      (replace-match ""))
    (while (re-search-forward "<h2>Sponsored Links</h2>.*aclk.*<h2>Search Results</h2>" nil t)
      (replace-match "")))

  ;; settings
  (unless (file-exists-p "~/.emacs.d/W3M/DownloadPages/")
    (make-directory "~/.emacs.d/W3M/DownloadPages/" t))
  (setq w3m-cookie-file "~/.emacs.d/W3M/cookie")
  (setq w3m-session-file "~/.emacs.d/W3M/session")
  (setq w3m-bookmark-file "~/.emacs.d/W3M/bookmark.html")
  (setq w3m-home-page "")
  (setq w3m-use-cookies t)
  (setq w3m-make-new-session t)
  (setq w3m-use-header-line-title t)
  (setq w3m-cookie-accept-bad-cookies t)
  (setq browse-url-new-window-flag t)
  (setq w3m-session-time-format "%Y-%m-%d (%a) %H:%M")
  (setq w3m-favicon-use-cache-file t)
  (setq w3m-show-graphic-icons-in-mode-line t)
  (setq w3m-edit-function '(find-file-other-window))
  (setq w3m-session-deleted-save nil)
  (setq w3m-default-display-inline-images t)
  (setq w3m-toggle-inline-images-permanently t)
  (setq w3m-enable-google-feeling-lucky nil)
  (setq w3m-use-filter t)
  (setq w3m-fb-mode t)
  (setq w3m-session-load-crashed-sessions t)
  (add-hook 'w3m-display-hook
            (lambda (url)
              (rename-buffer
               (format "*w3m: %s*"
                       (beautify-string (or w3m-current-title
                                            w3m-current-url) 50)) t)))
  (add-to-list 'w3m-filter-rules
               '("\\`http://www\\.google\\.\\(cn\\|com\\)/"
                 w3m-filter-rules-for-google))
  (w3m-fb-mode 1)

  ;; key bindings
  (lazy-set-key
   '(("1" . w3m-session-save)
     ("2" . w3m-session-select)
     ("3" . w3m-search-dict-cn)
     ("4" . w3m-search-google-web-en)
     ("s" . w3m-search-google-web-en)
     ("S" . w3m-search-google-web-cn)
     ("5" . w3m-search-emacswiki)
     ("0" . emms-play-online)
     ("b" . w3m-previous-form)
     ("f" . w3m-next-form)
     ("B" . w3m-previous-anchor)
     ("<tab>" . w3m-next-anchor)
     ("e" . w3m-edit-current-url)
     ("+" . w3m-zoom-in-image)
     ("-" . w3m-zoom-out-image)
     ("n" . w3m-visual-scroll-up)
     ("p" . w3m-visual-scroll-down)
     ("H" . w3m-history)
     ("h" . w3m-db-history)
     ("D" . w3m-dtree)
     ("P" . w3m-view-previous-page)
     ("<backspace>" . w3m-view-previous-page)
     ("F" . w3m-view-next-page)
     ("c" . w3m-delete-buffer-and-select)
     ("C" . w3m-delete-other-buffers)
     ("d" . w3m-wget)
     ("o" . w3m-go-to-linknum)
     ("O" . org-w3m-copy-for-org-mode)
     ("l" . w3m-copy-link-in-region)
     ("<" . w3m-shift-left)
     (">" . w3m-shift-right)
     ("<down>" . w3m-visual-scroll-up)
     ("<up>" . w3m-visual-scroll-down)
     ("M-n" . w3m-next-buffer)
     ("M-p" . w3m-previous-buffer)
     ("<f5>" . w3m-reload-this-page)
     ("M-<f5>" . w3m-reload-all-pages)
     ("<f11>" . w3m-next-buffer)
     ("C-<f11>" . w3m-previous-buffer))
   w3m-mode-map))

(eval-after-load "w3m"
  '(w3m-setting))

(autoload 'w3m-browse-url "w3m" "Ask emacs-w3m to browse URL" t)
(autoload 'toggle-w3m-with-other-buffer "w3m-extension"
  "switch w3m and current buffer smoothly" t)
(autoload 'w3m-search-google-web-en "w3m-extension"
  "search google web en")

;; global set browse url function
(setq browse-url-browser-function 'w3m-browse-url)

(lazy-set-key
 '(("C-x C-z" . toggle-w3m-with-other-buffer)
   ("<f8>" . w3m-search-google-web-en)))

;;; provide features
(provide 'init-w3m)

;;; init-w3m.el ends here
