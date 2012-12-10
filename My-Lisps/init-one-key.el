;;; init-one-key.el ---
;; Time-stamp: <2012-12-06 01:18:14 Thursday by lzy>

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
;;   (require 'init-one-key)

;;; Code:


(provide 'init-one-key)


;; required features
(require 'one-key-config)

(setq my-home-directory "~/")
(setq my-default-download-directory "~/Downloads/")
(setq my-resource-backup-directory "~/.emacs.d/Backup/")
(setq my-book-directory "~/Book/")
(setq my-reading-directory "~/Book/")
(setq my-translate-png-directory "~/.emacs.d/PNG")
(setq my-picture-directory "~/Pictures")
(setq my-emacs-lisp-package-directory "~/.emacs.d/Packages/")
(setq my-notes-directory "~/OrgDir/")
(setq my-emacs-backup-directory "~/.emacs.d/Backup/")
(setq my-screenshots-storage-directory "~/Screenshots/")
(setq my-emlue-download-directory "~/Downloads/")
(setq my-elisp-directory "~/My_Software_Dir/")

(lazy-set-key
 '(("C-c O"  .  one-key-menu-root)))

;;; init-one-key.el ends here 
