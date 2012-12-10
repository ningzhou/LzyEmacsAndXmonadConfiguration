;; -*- Emacs-Lisp -*-
;;; init-erc.el ---
;; Time-stamp: <2012-12-07 06:42:09 Friday by lzy>

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
;;   (require 'init-erc)

;;; Code:


(provide 'init-erc)


(defun irc-login ()
  "erc selection for lzy"
  (interactive)
  (erc-select :server "irc.freenode.net"
              :port 6667
              :nick "lzy001"
              :password "myerc")
  (erc-select :server "irc.oftc.net"
              :port 6667
              :nick "lzy001"
              :password "myerc"))

(defun erc-setting ()
  "Setting of `erc'."
  ;; required features
  (require 'erc)
  (require 'erc-log)
  (require 'erc-fill)
  (require 'erc-join)
  (require 'erc-track)
  (require 'erc-match)
  (require 'erc-stamp)
  (require 'erc-goodies)
  (require 'erc-nicklist)
  (require 'erc-highlight-nicknames)

  ;; func definitions
  (defface erc-query-buffer-face '((t (:bold t :foreground "magenta")))
    "ERC face for your query buffers."
    :group 'erc-faces)

  (defun lzy-erc-cmd-WHOIS (nick)
    "Run /whois easily by key sequence"
    (interactive
     (list
      (ido-completing-read
       "/whois "
       (erc-get-channel-nickname-list))))
    (let ((inhibit-read-only t))
      (goto-char (point-max))
      (insert (concat "/whois " nick))
      (erc-send-current-line)
      (goto-char (point-max))))


  (defun lzy-erc-mode-hook ()
    "erc mode hook"
    (auto-fill-mode 1)
    (abbrev-mode 1)
    (define-key erc-mode-map (kbd "C-c C-w") 'lzy-erc-cmd-WHOIS))

  (defun lzy-erc-join-hook ()
    "erc join hook"
    (less-minor-mode-on))

  ;; setting
  (setq erc-nick "lzy"
        erc-user-full-name "Zhengyu Li")
  (setq erc-auto-query t)
  (setq erc-nick-uniquifier "#")
  (setq erc-kill-buffer-on-part t)
  (setq erc-track-enable-keybindings t)
  (setq erc-echo-notices-in-minibuffer-flag t)
  (setq erc-default-coding-system '(utf-8 . utf-8))
  (setq erc-common-server-suffixes nil)
  (setq erc-mode-line-format "%t %a")

  ;; auto join
  (erc-autojoin-mode 1)
  (setq erc-autojoin-channels-alist
        '(("freenode.net"
           "#emacs"
           "#haskell")
          ("oftc.net"
           "#emacs-cn")))
  (setq erc-join-buffer 'bury
        erc-auto-query 'bury)

  ;; match & track
  (erc-match-mode 1)
  (setq erc-current-nick-highlight-type 'nick-or-keyword)
  (setq erc-keywords '("lzy"))
  (setq erc-pals nil)

  (setq erc-track-faces-priority-list
        '(erc-query-buffer-face
          erc-current-nick-face
          erc-keyword-face
          erc-pal-face
          erc-default-face))
  (setq erc-track-priority-faces-only 'all)
  (setq erc-track-switch-direction 'importance)
  
  ;; erc fill
  (erc-fill-mode 1)
  (setq erc-fill-function 'erc-fill-static
        erc-fill-static-center 10
        erc-fill-prefix "    ")

  ;; timestamp
  (erc-timestamp-mode 1)
  (setq erc-timestamp-only-if-changed-flag nil
        erc-timestamp-format "%H:%M "
        erc-insert-timestamp-function 'erc-insert-timestamp-left)

  ;; erc ignore
  (setq erc-ignore-list nil)
  (setq erc-hide-list
        '("JOIN" "PART" "QUIT" "MODE"))

  ;; erc log
  (erc-log-mode 1)
  (setq erc-log-channels-directory "~/.emacs.d/erc/"
        erc-save-buffer-on-part t
        erc-log-file-coding-system 'utf-8
        erc-log-write-after-send t
        erc-log-write-after-insert t)
  (unless (file-exists-p erc-log-channels-directory)
    (mkdir erc-log-channels-directory))

  ;; erc goodies
  (erc-readonly-mode 1)
  (erc-smiley-mode 1)

  (erc-truncate-mode 1)
  (add-hook 'erc-mode-hook 'lzy-erc-mode-hook)
  (add-hook 'erc-join-hook 'lzy-erc-join-hook)
  
  (add-to-list 'erc-modules 'highlight-nicknames)
  (erc-update-modules)
  )

(eval-after-load "erc"
  '(erc-setting))

;;; init-erc.el ends here
