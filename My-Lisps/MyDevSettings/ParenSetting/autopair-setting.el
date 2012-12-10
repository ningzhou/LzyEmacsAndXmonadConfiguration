;;; autopair-setting.el --- 
;; Time-stamp: <2012-12-07 06:31:06 Friday by lzy>

;; Copyright (C) 2012  zhengyu li

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

;;; Code:


(provide 'autopair-setting)


;; required features
(require 'autopair)

(defvar modes-use-self-opening
  '(c-mode c++-mode java-mode awk-mode)
  "*Modes use themselves insert opening function.")

(defvar mode-hooks-use-self-opening
  '(c-mode-hook c++-mode-hook java-mode-hook awk-mode-hook)
  "*Mode hooks use themselves insert opening function.")

(defun skeleton-c-mode-left-brace (arg)
  (interactive "P")
  (if  (c-in-literal (c-most-enclosing-brace (c-parse-state)))
      (self-insert-command 1)
    ;; auto insert complex things.
    (let* ((current-line (delete-and-extract-region
                          (line-beginning-position) (line-end-position)))
           (lines (and arg (mark t)
                       (delete-and-extract-region (mark t) (point))))
           (after-point (make-marker)))
                     ;;; delete extra blank begin and after the LINES
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
          (insert (if current-line current-line "")  "{\n")
          (and lines (insert lines))
          (move-marker after-point (point))
          (insert "\n}")
          (indent-region old-point (point) nil)))
      (goto-char after-point)
      (c-indent-line)))
  )

(defun change-autopair-insert-opening ()
  "Change definition of `autopair-insert-opening'."
  (defun autopair-insert-opening-internal ()
    (interactive)
    (when (autopair-pair-p)
      (setq autopair-action
            (list 'opening (autopair-find-pair last-input-event) (point))))
    (autopair-fallback))

  (defun autopair-insert-opening ()
    (interactive)
    (if (and (fboundp 'skeleton-c-mode-left-brace)
             (memq major-mode modes-use-self-opening)
             (equal last-command-event ?{))
        (call-interactively 'skeleton-c-mode-left-brace)
      (call-interactively 'autopair-insert-opening-internal)))
  )

(defun autopair-setting ()
  "setting for `autopair'."
  (autopair-global-mode 1)
  (setq autopair-extra-pairs '(:everywhere ((?` . ?'))))
  (eval-after-load "cc-mode"
    '(lazy-set-key
      '(("\{" . skeleton-c-mode-left-brace))
      c-mode-base-map))
  (dolist (hook mode-hooks-use-self-opening)
    (add-hook hook 'change-autopair-insert-opening))
  )

(eval-after-load "autopair-setting"
  '(autopair-setting))

;;; autopair-setting.el ends here
