;; -*- Emacs-Lisp -*-
;;; autopair-setting.el ---
;; Time-stamp: <2013-03-21 18:33:52 Thursday by lzy>

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
;;   (require 'autopair-setting)

;;; Code:

(require 'autopair)

(defvar modes-use-self-opening
  '(c-mode c++-mode java-mode awk-mode)
  "mode use themselves insert opening function.")

(defun skeleton-c-mode-left-brace (arg)
  (interactive "P")
  (if (c-in-literal (c-most-enclosing-brace (c-parse-state)))
      (self-insert-command 1)
    ;; auto insert complex things.
    (let* ((current-line (delete-and-extract-region
                          (line-beginning-position) (line-end-position)))
           (lines (and arg (mark t)
                       (delete-and-extract-region (mark t) (point))))
           (after-point (make-marker)))
      (setq lines (and lines
                       (with-temp-buffer
                         (insert lines)
                         (beginning-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (end-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (buffer-string))))
      (save-excursion
        (let* ((old-point (point)))
          (insert (if current-line current-line "") "{\n")
          (and lines (insert lines))
          (move-marker after-point (point))
          (insert "\n}")
          (indent-region old-point (point) nil)))
      (goto-char after-point)
      (c-indent-line))))

(defun autopair-insert-opening-internal ()
  (interactive)
  (setq autopair-inserted (autopair-calculate-inserted))
  (when (autopair-pair-p)
    (setq autopair-action
          (list 'opening (autopair-find-pair autopair-inserted) (point))))
  (autopair-fallback))

;; redefinition of autopair insert
(defun autopair-insert-opening ()
  (interactive)
  (if (and (fboundp 'skeleton-c-mode-left-brace)
           (memq major-mode modes-use-self-opening)
           (equal last-command-event ?{))
      (call-interactively 'skeleton-c-mode-left-brace)
    (call-interactively 'autopair-insert-opening-internal)))

(setq autopair-extra-pairs '(:everywhere ((?` . ?'))))
(autopair-global-mode 1)

(add-hook 'term-mode-hook
          '(lambda ()
             (autopair-mode -1)))

;;; provide features
(provide 'autopair-setting)

;;; autopair-setting.el ends here
