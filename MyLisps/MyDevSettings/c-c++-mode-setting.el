;; -*- Emacs-Lisp -*-
;;; c-c++-mode-setting.el ---
;; Time-stamp: <2013-04-07 07:42:26 Sunday by lzy>

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
;;   (require 'c-c++-mode-setting)

;;; Code:

(defun c-c++-mode-setting ()
  "settings for c/c++ mode"
  (require 'ffap)
  
  ;; variables definition
  (defvar c-c++-hightligh-included-files-key-map nil
    "keymap for highlight include overlay")
  (defconst c-c++-system-head-file-dir
    '("/usr/include"
      "/usr/local/include"
      "/usr/include/linux")
    "system header files directory")
  (defconst c-c++-user-head-file-dir
    '("."
      "./include"
      "../include"
      "../../include"
      "../../../include")
    "user header files directory")

  ;; functions definition
  (define-skeleton skeleton-include-system
    "generate #include<>" "" > "#include <"
    (completing-read "include system header file: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    c-c++-system-head-file-dir)))) ">\n")
  (define-skeleton skeleton-include-user
    "generate #include\"\"" "" > "#include \""
    (completing-read "include user header file: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    c-c++-user-head-file-dir)))) "\"\n")

  (defun c-c++-include-file-setup ()
    "add a system/user header file quickly"
    (mapc                                 
     (lambda (mode)
       (define-abbrev-table mode '(("incs" "" skeleton-include-system 1)))
       (define-abbrev-table mode '(("incu" "" skeleton-include-user 1))))
     '(c-mode-abbrev-table c++-mode-abbrev-table)))

  (defun c-c++-hightligh-included-files ()
    (interactive)
    (when (or (eq major-mode 'c-mode)
              (eq major-mode 'c++-mode))
      (save-excursion
        (goto-char (point-min))
        ;; remove all overlay first
        (mapc (lambda (ov) (if (overlay-get ov 'c-c++-hightligh-included-files)
                               (delete-overlay ov)))
              (overlays-in (point-min) (point-max)))
        (while (re-search-forward "^[ \t]*#include[ \t]+[\"<]\\(.*\\)[\">]" nil t nil)
          (let* ((begin  (match-beginning 1))
                 (end (match-end 1))
                 (ov (make-overlay begin end)))
            (overlay-put ov 'c-c++-hightligh-included-files t)
            (overlay-put ov 'keymap c-c++-hightligh-included-files-key-map)
            (overlay-put ov 'face '((t (:foreground "orange" :underline t :height 1.07)))))))))

  (defun c-c++-hightligh-included-files-setup ()
    "key setting for c-c++-hightligh-included-files"
    (setq c-c++-hightligh-included-files-key-map (make-sparse-keymap))
    (setq c-c++-hightligh-included-files-timer
          (run-with-idle-timer 0.5 t 'c-c++-hightligh-included-files))
    (lazy-set-key
     '(("<return>" . find-file-at-point))
     c-c++-hightligh-included-files-key-map))

  ;; settings
  (c-c++-include-file-setup)
  (c-c++-hightligh-included-files-setup)
  (add-to-list 'auto-mode-alist '("\\.h$" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
  (setq ffap-c-path (append ffap-c-path
                            c-c++-system-head-file-dir
                            c-c++-user-head-file-dir)))

(add-hook 'c-mode-hook 'c-c++-mode-setting)
(add-hook 'c++-mode-hook 'c-c++-mode-setting)

;;; provide features
(provide 'c-c++-mode-setting)

;;; c-c++-mode-setting.el ends here
