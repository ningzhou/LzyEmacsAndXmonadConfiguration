;; -*- Emacs-Lisp -*-
;;; init-mode-line.el ---
;; Time-stamp: <2012-12-07 07:04:45 Friday by lzy>

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
;;   (require 'init-mode-line)

;;; Code:


(provide 'init-mode-line)


(defun get-lines-4-mode-line ()
  "get line numbers of current buffer"
  (let ((lines (count-lines (point-min) (point-max))))
    (propertize
     (format " %dL " lines)
     'face '(:foreground "white")
     'mouse-face 'mode-line-highlight
     'help-echo (format "%d lines" lines))))

(defun get-size-indication-format ()
  (if (and transient-mark-mode mark-active)
      (propertize (format "(%dLs,%dCs)" (count-lines (region-beginning) (region-end)) (abs (- (mark t) (point))))
                  'face '(:foreground "white"))
    (propertize "@%I]"
                'face '(:foreground "black"))
    ))

(defun set-mode-line-format ()
  ;;  "set mode-line-format"
  (setq-default mode-line-position
                `(
                  (:eval (get-lines-4-mode-line))
                  (:eval
                   (propertize
                    "[%p"
                    'face '(:foreground "white")
                    'local-map mode-line-column-line-number-mode-map
                    'mouse-face 'mode-line-highlight
                    'help-echo "Size indication mode\n\
                               mouse-1: Display Line and Column Mode Menu"))
                  ;; when region is active, then show the number of characters, else show buffer size
                  (:eval
                   (and transient-mark-mode mark-active
                        (propertize "]"
                                    'face '(:foreground "white"))))
                  (:eval
                   (propertize (get-size-indication-format)
                               'face '(:foreground "white")
                               'local-map mode-line-column-line-number-mode-map
                               'mouse-face 'mode-line-highlight
                               'help-echo "Buffer position, mouse-1: Line/col menu"))
                  (:eval
                   ;; if line number mode is active, disable line-number-mode
                   (if (not linum-mode)
                       (if column-number-mode
                           (propertize
                            " (%l,%c) "
                            'face '(:foreground "white")
                            'local-map mode-line-column-line-number-mode-map
                            'mouse-face 'mode-line-highlight
                            'help-echo "Line number and Column number\n\
                                        mouse-1: Display Line and Column Mode Menu")
                         (propertize
                          " L%l "
                          'face '(:foreground "white")
                          'local-map mode-line-column-line-number-mode-map
                          'mouse-face 'mode-line-highlight
                          'help-echo "Line Number\n\
                                      mouse-1: Display Line and Column Mode Menu"))
                     (if column-number-mode
                         (propertize
                          " C%c "
                          'face '(:foreground "white")
                          'local-map mode-line-column-line-number-mode-map
                          'mouse-face 'mode-line-highlight
                          'help-echo "Column number\n\
                                      mouse-1: Display Line and Column Mode Menu")))
                   )
                  )
                )

  (setq-default mode-line-format
                '(
                  (:eval
                   (if (eql buffer-read-only t)
                       (propertize " ⚡RO⚡" 'face
                                   '(:foreground "Deepskyblue" :weight normal))
                     (propertize " ⚡W/R⚡" 'face
                                 '(:foreground "Deepskyblue" :weight normal))))
                  (:eval
                   (propertize " $%b$" 'face
                               (if (buffer-modified-p)
                                   '(:foreground "white" :slant italic)
                                 '(:foreground "white"))))
                  (:eval
                   (propertize (if overwrite-mode " Ovr" " Ins")
                               'face '(:foreground "SpringGreen" :weight normal)
                               'help-echo (concat "Buffer is in "
                                                  (if overwrite-mode "overwrite" "insert") " mode")))
                  mode-line-position
                  (:eval (propertize "(" 'face '(:foreground "yellow" :weight normal)))
                  (:eval (propertize "%m" 'face '(:foreground "yellow" :weight normal)))
                  minor-mode-alist
                  (:eval (propertize ") " 'face '(:foreground "yellow" :weight normal)))
                  ;; which-func-format
                  " "
                  (:eval
                   (propertize (format-time-string " %H:%M ")
                               'face '(:foreground "white" :weight normal)
                               'help-echo
                               (concat (format-time-string "%c; ")
                                       (emacs-uptime "Uptime:%hh"))))
                  )))

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
          (:eval (or (buffer-file-name) (buffer-name)))))
  )

(eval-after-load "init-mode-line"
  '(mode-line-setting))

;;; init-mode-line.el ends here
