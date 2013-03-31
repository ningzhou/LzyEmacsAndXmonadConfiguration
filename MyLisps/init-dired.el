;; -*- Emacs-Lisp -*-
;;; init-dired.el ---
;; Time-stamp: <2013-03-31 06:51:48 Sunday by lzy>

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
;;   (require 'init-dired)

;;; Code:

(defun dired-settings ()
  "Settings for dired"
  ;;required features
  (require 'wdired)
  (require 'dired-isearch)
  (require 'dired-aux)
  (require 'dired-tar)
  (require 'dired-single)
  (require 'dired-image)
  (require 'dired-filetype-face)
  (require 'color-moccur)
  (require 'dired-extension)

  ;; autoload definition
  (autoload 'emms-play-dired "emms-source-file" nil t)

  ;; functions definition
  (defun dired-backup-file ()
    "backup file in current directory"
    (interactive)
    (let* ((origin-file (dired-get-file-for-visit))
           (backup-file (concat origin-file ".backup")))
      (copy-file origin-file backup-file)
      (wuxch-dired-revert)))
  
  ;; settings
  (setq dired-dwim-target t)
  (setq ls-lisp-dirs-first t)
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq dired-omit-extensions '(".cache"))
  (setq dired-omit-files
        (concat dired-omit-files "\\|^\\.\\|^semantic.cache$\\|^CVS$"))
  (setq buffer-face-mode-face
        '(:family "Monospace" :height 1.1 :foreground "grey75"))
  (buffer-face-mode)
  (dired-omit-mode 1)

  ;; key bindings
  (lazy-unset-key 
   '("C-o")
   dired-mode-map)

  (lazy-set-key
   '(("f"              . dired-single-buffer)
     ("<return>"       . dired-single-buffer)
     ("<down-mouse-1>" . dired-single-buffer)
     ("h"              . dired-up-directory-same-buffer)
     ("<backspace>"    . dired-up-directory-same-buffer)
     ("e"           . emms-play-dired)
     ("r"           . wdired-change-to-wdired-mode)
     ("v"           . dired-view-file)
     ("C-s"         . dired-isearch-forward)
     ("C-r"         . dired-isearch-backward)
     ("M-s"         . dired-isearch-forward-regexp)
     ("M-r"         . dired-isearch-backward-regexp)
     ("M-o"         . dired-omit-mode)
     ("C-k"         . dired-do-delete)
     ("k"           . kill-this-buffer)
     ("I"           . view-image-dired)
     ("a"           . display-image-with-feh)
     ("B"           . dired-backup-file)
     ("E"           . dired-do-touch)
     ("j"           . dired-goto-file)
     ("0"           . dired-smart-shell-command)
     ("1"           . delete-other-windows)
     ("2"           . split-window-vertically)
     ("3"           . split-window-horizontally)
     ("o"           . other-window)
     ("O"           . dired-do-moccur)
     ("c"           . dired-do-copy)
     ("{"           . dired-gnome-open-file)
     ("}"           . dired-gnome-open-file)
     ("?"           . dired-get-size)
     ("g"           . wuxch-dired-revert)
     ("M-,"         . wuxch-dired-goto-first-line)
     ("M-."         . wuxch-dired-goto-last-line)
     ("<home>"      . wuxch-dired-goto-first-line)
     ("<end>"       . wuxch-dired-goto-last-line)
     ("p"           . wuxch-dired-previous-line)
     ("<up>"        . wuxch-dired-previous-line)
     ("n"           . wuxch-dired-next-line)
     ("<down>"      . wuxch-dired-next-line)
     ("M-w"         . wuxch-dired-copy)
     ("M-k"         . wuxch-dired-cut)
     ("C-y"         . wuxch-dired-paste)
     ("TAB"         . wuxch-dired-tab-process)
     ("/*"          . dired-mark-files-regexp)
     ("/m"          . dired-filter-regexp)
     ("/."          . dired-filter-extension)
     ("C-c +"       . wuxch-dired-create-directory)
     ("C-c n"       . wuxch-get-file-name-without-path)
     ("C-c p"       . wuxch-get-file-name-only-path)
     ("C-c f"       . wuxch-get-file-name-with-path)
     ("C-x d"       . ido-dired))
   dired-mode-map))

(autoload 'his-dired-sort "dired-extension" nil nil)
(autoload 'wuxch-dired-mode-hook-fun "dired-extension" nil nil)

(add-hook 'dired-after-readin-hook 'his-dired-sort)
(add-hook 'dired-mode-hook 'dired-settings)

(autoload 'dired-jump "dired-x" nil t)
(autoload 'dired-single-magic-buffer "dired-single" nil t)

(lazy-set-key
 '(("C-x d" . dired-jump)
   ("C-x C-d" . ido-dired)
   ("<f5> " . dired-single-magic-buffer)))

;;; provide features
(provide 'init-dired)

;;; init-dired.el ends here
