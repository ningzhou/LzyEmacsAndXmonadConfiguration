;; -*- Emacs-Lisp -*-
;;; c&c++-mode-setting.el ---
;; Time-stamp: <2013-03-21 16:02:36 Thursday by lzy>

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
;;   (require 'c&c++-mode-setting)

;;; Code:

;; required features
(require 'ifdef)
(require 'hide-ifdef)
;; (lazy-set-key
;;  '(("C-c i h" . hide-ifdef-block)
;;    ("C-c i H" . hide-ifdefs)
;;    ("C-c i e" . show-ifdef-block)
;;    ("C-c i E" . show-ifdefs)
;;    ("C-c i m" . mark-ifdef)
;;    ("C-c M-a" . beginning-of-defun)
;;    ("C-c M-e" . end-of-defun)
;;    ("RET" . newline-and-indent)
;;    ("C-j" . newline-and-indent)
;;    ("C-c C-c" . comment)
;;    ("C-c k" . uncomment))
;;  c-mode-base-map)


(defvar c/c++-hightligh-included-files-key-map nil)
(defconst c/c++-system-head-file-dir '("/usr/include"
                                       "/usr/local/include"
                                       "/usr/include/linux")
  "system header files directory")
(defconst c/c++-user-head-file-dir  '("."
                                      "./include"
                                      "../include"
                                      "../../include"
                                      "../../../include")
  "user header files directory")

(defun c&c++-mode-common-setting ()
  "common setting for c/c++"
  ;; func definition
  (define-skeleton skeleton-include-system
    "generate #include<>" "" > "#include <"
    (completing-read "include system header file: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    c/c++-system-head-file-dir)))) ">")
  (define-skeleton skeleton-include-user
    "generate #include\"\"" "" > "#include \""
    (completing-read "include user header file: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    c/c++-user-head-file-dir)))) "\"")

  (defun c/c++-include-file-setting ()
    "add a system/user header file quickly"
    (mapc                                 
     (lambda (mode)
       (define-abbrev-table mode '(("incs" "" skeleton-include-system 1)))
       (define-abbrev-table mode '(("incu" "" skeleton-include-user 1))))
     '(c-mode-abbrev-table c++-mode-abbrev-table))
    )

  (defun c/c++-hightligh-included-files ()
    (interactive)
    (when (or (eq major-mode 'c-mode)
              (eq major-mode 'c++-mode))
      (save-excursion
        (goto-char (point-min))
        ;; remove all overlay first
        (mapc (lambda (ov) (if (overlay-get ov 'c/c++-hightligh-included-files)
                               (delete-overlay ov)))
              (overlays-in (point-min) (point-max)))
        (while (re-search-forward "^[ \t]*#include[ \t]+[\"<]\\(.*\\)[\">]" nil t nil)
          (let* ((begin  (match-beginning 1))
                 (end (match-end 1))
                 (ov (make-overlay begin end)))
            (overlay-put ov 'c/c++-hightligh-included-files t)
            (overlay-put ov 'keymap c/c++-hightligh-included-files-key-map)
            (overlay-put ov 'face 'underline))))))

  (defun c/c++-hightligh-included-files-setting ()
    "key setting for c/c++-hightligh-included-files"
    (setq c/c++-hightligh-included-files-key-map (make-sparse-keymap))
    (setq c/c++-hightligh-included-files-timer
          (run-with-idle-timer 0.5 t 'c/c++-hightligh-included-files))
    (lazy-set-key
     '(("<RET>"    . find-file-at-point)
       ("<return>" . find-file-at-point))
     c/c++-hightligh-included-files-key-map)
    )

  ;; setting
  (c/c++-include-file-setting)
  (c/c++-hightligh-included-files-setting)
  (add-to-list 'auto-mode-alist '("\\.h$" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
  )

(add-hook 'c-mode-hook 'c&c++-mode-common-setting)
(add-hook 'c++-mode-hook 'c&c++-mode-common-setting)

;;; provide features
(provide 'c&c++-mode-setting)

;;; c&c++-mode-setting.el ends here
