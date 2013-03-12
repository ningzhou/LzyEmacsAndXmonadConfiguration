;;; emacs-lisp-mode-setting.el --- 
;; Time-stamp: <2013-03-12 07:37:07 Tuesday by lzy>

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


(provide 'emacs-lisp-mode-setting)


(defun paredit-setting ()
  "setting for paredit"
  ;; required features
  (interactive)
  (require 'paredit)
  (paredit-mode t))

(defun eldoc-setting ()
  "setting for `eldoc'."
  ;; required features
  (require 'eldoc)
  (require 'parenthese-setting)

  ;; func definition
  (defun eldoc-print-current-symbol-info-anyway ()
    "Print current symbol info."
    (interactive)
    (condition-case err
        (if eldoc-documentation-function
            (eldoc-message (funcall eldoc-documentation-function))
          (let* ((current-symbol (eldoc-current-symbol))
                 (current-fnsym  (eldoc-fnsym-in-current-sexp))
                 (doc (cond
                       ((null current-fnsym)
                        nil)
                       ((eq current-symbol (car current-fnsym))
                        (or (apply 'eldoc-get-fnsym-args-string
                                   current-fnsym)
                            (eldoc-get-var-docstring current-symbol)))
                       (t
                        (or (eldoc-get-var-docstring current-symbol)
                            (apply 'eldoc-get-fnsym-args-string
                                   current-fnsym))))))
            (eldoc-message doc)))
      ;; This is run from post-command-hook or some idle timer thing,
      ;; so we need to be careful that errors aren't ignored.
      (error (message "eldoc error: %s" err))))

  (defun eldoc-pre-command-refresh-echo-area ())

  ;; setting
  (setq eldoc-idle-delay 0.5)
  (eldoc-add-command 'l-command
                     'save-buffer-sb
                     'switch-to-other-buffer
                     'describe-symbol-at-point
                     'View-scroll-half-page-backward)
  (eldoc-remove-command 'goto-paren)
  (turn-on-eldoc-mode))

(defun cldoc-setting ()
  "setting for `cldoc'"
  ;; required features
  (require 'cldoc)

  ;; setting
  (turn-on-cldoc-mode)
  )

(defun edebug-clear-global-break-condition ()
  "Clear `edebug-global-break-condition'."
  (interactive)
  (setq edebug-global-break-condition nil))

(add-hook 'lisp-mode-hook
          '(lambda ()
             (eldoc-setting)
             (cldoc-setting)
             (edebug-clear-global-break-condition)
             (lazy-set-key
              '(("C-c M-a" . beginning-of-defun)
                ("C-c M-e" . end-of-defun)
                ("M-j" . eval-last-sexp)
                ("RET" . newline-and-indent)
                ("C-j" . newline-and-indent)
                ("C-c C-c" . comment)
                ("C-c k" . uncomment))
              lisp-mode-map)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (eldoc-setting)
             (cldoc-setting)
             (edebug-clear-global-break-condition)
             (lazy-set-key
              '(("C-c M-a" . beginning-of-defun)
                ("C-c M-e" . end-of-defun)
                ("M-j" . eval-last-sexp)
                ("RET" . newline-and-indent)
                ("C-j" . newline-and-indent)
                ("C-c C-c" . comment)
                ("C-c k" . uncomment))
              emacs-lisp-mode-map)))

(add-hook 'lisp-interaction-mode-hook
          '(lambda ()
             (eldoc-setting)
             (cldoc-setting)
             (edebug-clear-global-break-condition)
             (lazy-set-key
              '(("C-c M-a" . beginning-of-defun)
                ("C-c M-e" . end-of-defun)
                ("M-j" . eval-last-sexp)
                ("RET" . newline-and-indent)
                ("C-j" . newline-and-indent)
                ("C-c C-c" . comment)
                ("C-c k" . uncomment))
              lisp-interaction-mode-map)))

(lazy-set-key
 '(("C-x M-E" . toggle-debug-on-error)
   ("C-x Q"   . toggle-debug-on-quit)))

(eval-after-load "edebug"
  '(lambda ()
     (lazy-set-key
      '(("C-c C-d" . nil))
      edebug-mode-map)))

;;; emacs-lisp-mode-setting.el ends here
