;; -*- Emacs-Lisp -*-
;;; init-tramp.el ---
;; Time-stamp: <2013-03-27 17:11:04 Wednesday by lzy>

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
;;   (require 'init-tramp)

;;; Code:

(defun tramp-settings ()
  "settings for tramp mode"
  ;; required features
  (require 'ange-ftp)

  ;; settings
  (setq password-cache-expiry 3600)
  (setq tramp-default-method "scp")
  (setq tramp-auto-save-directory "~/.emacs.d/TrampAutoSave"))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (let ((fname (or buffer-file-name
                   dired-directory)))
    (when fname
      (if (string-match "^/sudo:root@localhost:" fname)
          (setq fname (replace-regexp-in-string
                       "^/sudo:root@localhost:" "" fname))
        (setq fname (concat "/sudo:root@localhost:" fname)))
      (find-alternate-file fname))))

(eval-after-load "tramp"
  '(tramp-settings))

(lazy-set-key
 '(("C-x C-r" . find-alternative-file-with-sudo)))

;;; provide features
(provide 'init-tramp)

;;; init-tramp.el ends here
