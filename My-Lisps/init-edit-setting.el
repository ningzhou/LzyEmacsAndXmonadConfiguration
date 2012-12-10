;;; init-edit-setting.el ---
;; Time-stamp: <2012-12-07 06:40:15 Friday by lzy>

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
;;   (require 'init-edit-setting)

;;; Code:


(provide 'init-edit-setting)


;; required features
(require 'edit-misc)
(require 'thing-edit-extension)

;; 缩进设置
;; 不用TAB字符来indent
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x tab-width) tab-stop-list)))

;; 自动的在文件末增加一新行
(setq require-final-newline t)

(define-key minibuffer-local-completion-map (kbd "C-k") 'kill-line)

(autoload 'copy-region-as-kill-nomark "pc-select"
  "Save the region as if killed; but don't kill it; deactivate mark.
If `interprogram-cut-function' is non-nil, also save the text for a window
system cut and paste.

Deactivating mark is to avoid confusion with `delete-selection-mode'
and `transient-mark-mode'." t)

;;;###autoload
(defun apply-args-list-to-fun (fun-list args-list)
  "Apply args list to function FUN-LIST.
FUN-LIST can be a symbol, also can be a list whose element is a symbol."
  (let ((is-list (and (listp fun-list) (not (functionp fun-list)))))
    (dolist (args args-list)
      (if is-list
          (dolist (fun fun-list)
            (apply-args-to-fun fun args))
        (apply-args-to-fun fun-list args)))))

;;;###autoload
(defun apply-args-to-fun (fun args)
  "Apply args to function FUN."
  (if (listp args)
      (eval `(,fun ,@args))
    (eval `(,fun ,args))))

;;;###autoload
(defmacro def-action-on-area-command (fun-name action mark-area doc)
  `(defun ,fun-name ()
     ,doc
     (interactive)
     (save-excursion
       (funcall ,mark-area)
       (call-interactively ,action))))

(apply-args-list-to-fun
 'def-action-on-area-command
 `((copy-function        'copy-region   'mark-function     "Copy function.")
   (kill-function        'kill-region   'mark-function     "Kill function.")
   (indent-function      'indent-region 'mark-function     "Indent function.")
   (indent-paragraph     'indent-region 'mark-paragraph    "Indent paragraph.")
   (copy-whole-buffer    'copy-region   'mark-whole-buffer "Copy whole buffer.")
   (kill-whole-buffer    'kill-region   'mark-whole-buffer "Kill whole buffer.")
   (indent-whole-buffer  'indent-region 'mark-whole-buffer "Indent whole buffer.")))

;;;###autoload
(defmacro def-redo-command (fun-name redo undo)
  "Make redo command."
  `(defun ,fun-name ()
     (interactive)
     (if (equal last-command ,redo)
         (setq last-command 'undo)
       (setq last-command nil))
     (call-interactively ,undo)
     (setq this-command ,redo)))
(def-redo-command redo 'redo 'undo)

(lazy-set-key
 '(("M-k"     . kill-whole-paragraph)
   ("M-K"     . kill-paragraph)
   ("C-M-k"   . kill-whole-buffer)
   ("C-^"     . case-trans)
   ("C-6"     . case-trans)
   ("C-x S"   . wcy-mark-some-thing-at-point)
   ("M-D"     . my-kill-word)
   ("C-x TAB" . indent-whole-buffer)))

(define-key global-map (kbd "M-M") 'mark-whole-sexp)

;;; init-edit-setting.el ends here
