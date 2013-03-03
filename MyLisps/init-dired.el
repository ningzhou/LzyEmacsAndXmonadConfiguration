;;; init-dired.el --- 
;; Time-stamp: <2013-03-02 04:10:52 Saturday by lzy>

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

(provide 'init-dired)

;; required features
(require 'dired-x)
(require 'dired-aux)
(require 'dired-tar)
(require 'dired-view)
(require 'dired-image)
(require 'color-moccur)
(require 'smart-compile)
(require 'dired-extension)
(require 'wuxch-dired-extension)
(require 'wuxch-dired-copy-paste)

(defun dired-key-setting ()
  "key settings for dired mode"
  ;;this key will conflict with one-key library
  (lazy-unset-key 
   '("C-o")
   dired-mode-map)

  (lazy-set-key
   `(("C-x d" . dired-jump)
     ("C-x C-d" . ido-dired))
   global-map)

  (define-prefix-command 'dired-slash-map)
  (lazy-set-key
   `(("h"           . dired-up-directory-same-buffer)
     ("<backspace>" . dired-up-directory-same-buffer)
     ("e"           . emms-play-dired)
     ("/"           . dired-slash-map)
     ("/m"          . dired-filter-regexp)
     ("/."          . dired-filter-extension)
     ("r"           . wdired-change-to-wdired-mode)
     ("C-q"         . dired-quickview)
     ("C-s"         . dired-isearch-forward)
     ("C-r"         . dired-isearch-backward)
     ("M-s"         . dired-isearch-forward-regexp)
     ("M-r"         . dired-isearch-backward-regexp)
     ("M-o"         . dired-omit-mode)
     ("C-k"         . dired-do-delete)
     ("k"           . kill-this-buffer)
     ("I"           . view-image-dired)
     ("a"           . display-image-with-feh)
     ("E"           . dired-do-touch)
     ("J"           . dired-goto-file)
     ("1"           . delete-other-windows)
     ("2"           . split-window-vertically)
     ("3"           . split-window-horizontally)
     ("o"           . other-window)
     ("O"           . dired-do-moccur)
     ("c"           . dired-do-copy)
     ("{"           . dired-gnome-open-file)
     ("}"           . dired-gnome-open-file)
     ("?"           . dired-get-size)
     ("0"           . dired-smart-shell-command)
     ("*m"          . dired-mark-files-regexp)
     ("SPC"         . dired-scroll-half-page-forward)
     ("g"           . wuxch-dired-revert)
     ("M-,"         . wuxch-dired-goto-first-line)
     ("M-."         . wuxch-dired-goto-last-line)
     ("<home>"      . wuxch-dired-goto-first-line)
     ("<end>"       . wuxch-dired-goto-last-line)
     ("p"           . wuxch-dired-previous-line)
     ("n"           . wuxch-dired-next-line)
     ("<up>"        . wuxch-dired-previous-line)
     ("<down>"      . wuxch-dired-next-line)
     ("M-w"         . wuxch-dired-copy)
     ("M-k"         . wuxch-dired-cut)
     ("C-y"         . wuxch-dired-paste)
     ("TAB"         . wuxch-dired-tab-process)
     ("C-c +"       . wuxch-dired-create-directory)
     ("C-c n"       . wuxch-get-file-name-without-path)
     ("C-c p"       . wuxch-get-file-name-only-path)
     ("C-c f"       . wuxch-get-file-name-with-path)
     ("C-x d"       . ido-dired)
     (";"           . dired-view-minor-mode-toggle)
     (":"           . dired-view-minor-mode-dired-toggle))
   dired-mode-map))

(defun dired-buffer-face-mode ()
  "Sets a fixed width (monospace) font in current buffer"
  (interactive)
  (setq buffer-face-mode-face '(:family "Monospace" :height 1.05 :foreground "grey90" :weight normal))
  (buffer-face-mode))

(defun dired-settings ()
  "Settings for `dired'."
  (setq truncate-lines t)
  (setq dired-dwim-target t)
  (setq ls-lisp-dirs-first t)
  (setq dired-omit-size-limit 1000000)
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq dired-details-initially-hide nil)
  (setq mode-line-buffer-identification
        (propertized-buffer-identification "%b"))
  (setq dired-omit-files
        (concat dired-omit-files "\\|^\\.\\|^semantic.cache$\\|^CVS$"))
  (setq dired-guess-shell-alist-user
        (list
         '("\\.mp3$" "mplayer")
         '("\\.mkv$" "mplayer")
         '("\\.rmvb$" "mplayer")
         '("\\.avi$" "mplayer")
         '("\\.mp4$" "mplayer")
         '("\\.vob$" "mplayer")
         '("\\.doc$" "libreoffice")
         '("\\.xls$" "libreoffice")
         '("\\.ppt$" "libreoffice")
         '("\\.pptx$" "libreoffice")
         '("\\.pdf$" "acroread")
         '("\\.jpg$" "feh -r -g 1024x768 -B black -Y")
         '("\\.JPG$" "feh -r -g 1024x768 -B black -Y")
         '("\\.jpeg$" "feh -r -g 1024x768 -B black -Y")
         '("\\.JPEG$" "feh -r -g 1024x768 -B black -Y")
         '("\\.p[bgpn]m$" "feh -r -g 1024x768 -B black -Y")
         '("\\.gif$" "feh -r -g 1024x768 -B black -Y")
         '("\\.tif$" "feh -r -g 1024x768 -B black -Y")))
  (diredp-toggle-find-file-reuse-dir 1)
  (dired-omit-mode t)
  (dired-key-setting)
  (dired-buffer-face-mode))

(add-hook 'dired-load-hook 'wuxch-dired-load-hook)
(add-hook 'dired-after-readin-hook 'his-dired-sort)
(add-hook 'dired-mode-hook 'wuxch-dired-mode-hook-fun)
(add-hook 'dired-mode-hook 'dired-settings)

;;; init-dired.el ends here