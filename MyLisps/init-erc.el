;; -*- Emacs-Lisp -*-
;;; init-erc.el ---
;; Time-stamp: <2013-03-22 08:31:59 Friday by lzy>

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
;;   (require 'init-erc)

;;; Code:

(defun erc-setting ()
  "settings of erc"
  ;; required features
  (require 'erc-log)
  (require 'erc-fill)
  (require 'erc-join)
  (require 'erc-track)
  (require 'erc-match)
  (require 'erc-stamp)
  (require 'erc-goodies)
  (require 'erc-nicklist)
  (require 'erc-highlight-nicknames)

  ;; functions definition
  (defun my-erc-cmd-whois (nick)
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

  ;; settings
  (setq erc-auto-query t)
  (setq erc-nick "lzy001")
  (setq erc-keywords '("lzy001"))
  (setq erc-user-full-name "chieftain")
  (setq erc-ignore-list nil)
  (setq erc-auto-query 'bury)
  (setq erc-join-buffer 'bury)
  (setq erc-nick-uniquifier "#")
  (setq erc-fill-static-center 10)
  (setq erc-kill-buffer-on-part t)
  (setq erc-save-buffer-on-part t)
  (setq erc-log-write-after-send t)
  (setq erc-log-write-after-insert t)
  (setq erc-mode-line-format "%t %a")
  (setq erc-timestamp-format "%H:%M ")
  (setq erc-track-enable-keybindings t)
  (setq erc-log-file-coding-system 'utf-8)
  (setq erc-default-coding-system '(utf-8 . utf-8))
  (setq erc-track-priority-faces-only 'all)
  (setq erc-fill-function 'erc-fill-static)
  (setq erc-track-switch-direction 'importance)
  (setq erc-timestamp-only-if-changed-flag nil)
  (setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE"))
  (setq erc-log-channels-directory "~/.emacs.d/ERC/")
  (setq erc-current-nick-highlight-type 'nick-or-keyword)
  (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#haskell")
                                      ("oftc.net" "#emacs-cn")))
  (erc-log-mode 1)
  (erc-fill-mode 1)
  (erc-match-mode 1)
  (erc-smiley-mode 1)
  (erc-autojoin-mode 1)
  (erc-readonly-mode 1)
  (erc-truncate-mode 1)
  (erc-timestamp-mode 1)
  (add-to-list 'erc-modules
               'highlight-nicknames)
  (erc-update-modules))

(eval-after-load "erc"
  '(erc-setting))

(defun my-erc-mode-hook ()
  "erc mode hook"
  (auto-fill-mode 1)
  (abbrev-mode 1)
  (lazy-set-key
   '(("C-c C-w" . my-erc-cmd-whois))
   erc-mode-map))

(defun my-erc-join-hook ()
  "erc join hook"
  (less-minor-mode-on))

(add-hook 'erc-mode-hook 'my-erc-mode-hook)
(add-hook 'erc-join-hook 'my-erc-join-hook)

(autoload 'erc-select "erc" "emacs irc client" t)

(defun my-irc-login ()
  "irc selection for me"
  (interactive)
  (erc-select :server "irc.freenode.net"
              :port 6667
              :nick "lzy001"
              :password "myerc")
  (erc-select :server "irc.oftc.net"
              :port 6667
              :nick "lzy001"
              :password "myerc"))

;;; provide features
(provide 'init-erc)

;;; init-erc.el ends here
