;; -*- Emacs-Lisp -*-
;;; init-mode-line.el ---
;; Time-stamp: <2013-04-17 11:40:09 Wednesday by lzy>

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
;;   (require 'init-mode-line)

;;; Code:

(defun get-lines-4-mode-line ()
  "get line numbers of current buffer"
  (let ((lines (count-lines
                (point-min) (point-max))))
    (format " %dL" lines)))

(defun get-size-indication-format ()
  (if (and transient-mark-mode mark-active)
      (format " (%dLs,%dCs)"
              (count-lines (region-beginning) (region-end))
              (abs (- (mark t) (point))))
    ""))

(defun set-mode-line-format ()
  "set mode-line-format"
  (setq-default mode-line-format
                '((:eval
                   (if (eql buffer-read-only t)
                       (propertize " **RO**" 'face
                                   '(:foreground "Deepskyblue"))
                     (propertize " --W/R--" 'face
                                 '(:foreground "Deepskyblue"))))
                  (:eval
                   (propertize " %b"
                               'face (if (buffer-modified-p)
                                         '(:foreground "SpringGreen" :slant italic)
                                       '(:foreground "SpringGreen"))))
                  (:eval
                   (propertize (get-lines-4-mode-line)
                               'face '(:foreground "grey90")))
                  (:eval
                   (propertize (get-size-indication-format)
                               'face '(:foreground "yellow")))
                  (:eval
                   (propertize " (%l,%c)"
                               'face '(:foreground "#00eedd")))
                  (:eval
                   (propertize " ("
                               'face '(:foreground "Yellow" :weight normal)))
                  (:eval
                   (propertize "%m"
                               'face '(:foreground "Yellow" :weight normal)))
                  minor-mode-alist
                  (:eval
                   (propertize ") "
                               'face '(:foreground "Yellow" :weight normal)))
                  which-func-format
                  (:eval
                   (propertize (format-time-string " %H:%M ")
                               'face '(:foreground "White" :weight normal)
                               'help-echo
                               (concat (format-time-string "%c; ")
                                       (emacs-uptime "Uptime:%hh")))))))

(defun mode-line-setting ()
  "setings for modeline"
  (set-mode-line-format)
  (column-number-mode 1)
  ;; display log and buffer name on frame title
  (setq frame-title-format
        '((:eval
           (let ((login-name (getenv-internal "LOGNAME")))
             (if login-name (concat login-name "@") "")))
          (:eval (system-name))
          ":"
          (:eval (or (buffer-file-name) (buffer-name))))))

(mode-line-setting)

;;; provide features
(provide 'init-mode-line)

;;; init-mode-line.el ends here
