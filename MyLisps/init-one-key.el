;; -*- Emacs-Lisp -*-
;;; init-one-key.el ---
;; Time-stamp: <2013-03-20 13:17:01 Wednesday by lzy>

;; Copyright (C) 2013 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@gmail.com>
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
;;   (require 'init-one-key)

;;; Code:

(require 'one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variable ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar my-home-directory "~/" "home directory of current login user")
(defvar my-download-directory "~/Downloads/" "download directory")
(defvar my-backup-directory "~/BackUp/" "Backup directory for backup file")
(defvar my-book-directory "~/Documents/Book/" "ebook directory")
(defvar my-picture-directory "~/Pictures" "pictures directory")
(defvar my-note-directory "~/OrgDir/" "diary directory")
(defvar my-screenshot-directory "~/Screenshots/" "screenshot directory")
(defvar my-music-directory "~/Music/" "music directory")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Root ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-root-alist nil
  "The `one-key' menu alist for one key root")

(setq one-key-menu-root-alist
      '((("d" . "Directory") . one-key-menu-directory)
        (("e" . "Emms") . one-key-menu-emms)
        (("h" . "Help Info") . one-key-menu-help)
        (("t" . "Tools") . one-key-menu-tools)
        (("w" . "W3m search") . one-key-menu-w3m-search)
        (("u" . "UI") . one-key-menu-ui)))

(defun one-key-menu-root ()
  "The `one-key' menu for root"
  (interactive)
  (one-key-menu "Roots" one-key-menu-root-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Open Directory ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-directory-alist nil
  "The `one-key' menu alist for DIRECTORY.")

(autoload 'dired-x-find-file "dired-x" nil t)

(setq one-key-menu-directory-alist
      '((("b" . "Backup") . (lambda () (interactive) (dired-x-find-file my-backup-directory)))
        (("d" . "Download") . (lambda () (interactive) (dired-x-find-file my-download-directory)))
        (("e" . "Book") . (lambda () (interactive) (dired-x-find-file my-book-directory)))
        (("h" . "Home") . (lambda () (interactive) (dired-x-find-file my-home-directory)))
        (("m" . "Music") . (lambda () (interactive) (dired-x-find-file my-music-directory)))
        (("n" . "Note") . (lambda () (interactive) (dired-x-find-file my-note-directory)))
        (("p" . "Picture") . (lambda () (interactive) (dired-x-find-file my-picture-directory)))
        (("s" . "Screenshot") . (lambda () (interactive) (dired-x-find-file my-screenshot-directory)))))

(defun one-key-menu-directory ()
  "The `one-key' menu for DIRECTORY."
  (interactive)
  (one-key-menu "Directory" one-key-menu-directory-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-alist nil
  "The `one-key' menu alist for EMMS.")
(autoload 'emms-play-now "emms-extension" nil t)
(autoload 'emms-history-load "emms-history" nil t)
(autoload 'emms-play-directory-tree "emms-source-file" nil t)
(autoload 'emms-add-directory-tree "emms-source-file" nil t)
(autoload 'emms-play-playlist "emms-source-playlist" nil t)
(autoload 'emms-streams "emms-streams" nil t)
(autoload 'emms-browser "emms-browser" nil t)

(setq one-key-menu-emms-alist
      '((("a" . "Add Directory Tree") . emms-add-directory-tree)
        (("b" . "Emms Browser") . emms-browser)
        (("d" . "Play Directory Tree") . emms-play-directory-tree)
        (("h" . "Play emms history") . emms-history-load)
        (("i" . "Play Playlist") . emms-play-playlist)
        (("p" . "Play Now") . emms-play-now)
        (("s" . "Emms Streams") . emms-streams)))

(defun one-key-menu-emms ()
  "The `one-key' main menu for EMMS."
  (interactive)
  (one-key-menu "Emms" one-key-menu-emms-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Help ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-help-alist nil
  "The `one-key' menu alist for help.")

(autoload 'view-emacs-debugging "help" nil t)
(autoload 'view-external-packages "help" nil t)
(autoload 'view-emacs-FAQ "help" nil t)
(autoload 'view-emacs-news "help" nil t)
(autoload 'view-emacs-problems "help" nil t)
(autoload 'view-emacs-todo "help" nil t)
(autoload 'view-order-manuals "help" nil t)
(autoload 'view-lossage "help" nil t)

(setq one-key-menu-help-alist
      '((("d" . "View Emacs Debugging") . view-emacs-debugging)
        (("e" . "View External Packages") . view-external-packages)
        (("f" . "View Emacs FAQ") . view-emacs-FAQ)
        (("n" . "View Emacs News") . view-emacs-news)
        (("p" . "View Emacps Problems") . view-emacs-problems)
        (("t" . "View Emacs Todo") . view-emacs-todo)
        (("r" . "View Order Manuals") . view-order-manuals)
        (("l" . "View Lossage") . view-lossage)))

(defun one-key-menu-help ()
  "The `one-key' menu for help."
  (interactive)
  (one-key-menu "help" one-key-menu-help-alist t))

(lazy-set-key
 '(("C-c O"  .  one-key-menu-root)))

;;; provide features
(provide 'init-one-key)

;;; init-one-key.el ends here
