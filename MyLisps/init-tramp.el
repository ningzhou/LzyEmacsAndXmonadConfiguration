;; -*- Emacs-Lisp -*-
;;; init-tramp.el ---
;; Time-stamp: <2012-12-06 18:08:04 Thursday by lzy>

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
;;   (require 'init-tramp)

;;; Code:


(provide 'init-tramp)

;; required features
(require 'ange-ftp)
(require 'tramp)

(setq password-cache-expiry 3600)
(setq tramp-default-method "scp")
;; Auto save tramp file in local directory
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

(defun find-alternative-file-with-sudo ()
  (interactive)
  (let ((fname (or buffer-file-name
                   dired-directory)))
    (when fname
      (if (string-match "^/sudo:root@localhost:" fname)
          (setq fname (replace-regexp-in-string
                       "^/sudo:root@localhost:" ""
                       fname))
        (setq fname (concat "/sudo:root@localhost:" fname)))
      (find-alternate-file fname))))

(lazy-set-key
 '(("C-x C-r" . find-alternative-file-with-sudo)))

;;; init-tramp.el ends here
