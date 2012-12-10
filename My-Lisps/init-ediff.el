;; -*- Emacs-Lisp -*-
;;; init-ediff.el ---
;; Time-stamp: <2012-12-06 17:15:23 Thursday by lzy>

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
;;   (require 'init-ediff)

;;; Code:


(provide 'init-ediff)


;; required features
(require 'ediff-trees)

(defun ediff-file (file)
  "Compare file at point with file FILE using `diff'.
FILE defaults to the file at the mark.  (That's the mark set by
\\[set-mark-command], not by Dired's \\[dired-mark] command.)
The prompted-for file is the first file given to `diff'.
With prefix arg, prompt for second argument SWITCHES,
which is options for `diff'."
  (interactive
   (let* ((current (dired-get-filename t))
          ;; Get the file at the mark.
          (file-at-mark (if (mark t)
                            (save-excursion (goto-char (mark t))
                                            (dired-get-filename t t))))
          ;; Use it as default if it's not the same as the current file,
          ;; and the target dir is the current dir or the mark is active.
          (default (if (and (not (equal file-at-mark current))
                            (or (equal (dired-dwim-target-directory)
                                       (dired-current-directory))
                                mark-active))
                       file-at-mark))
          (target-dir (if default
                          (dired-current-directory)
                        (dired-dwim-target-directory)))
          (defaults (dired-dwim-target-defaults (list current) target-dir)))
     (require 'diff)
     (list
      (minibuffer-with-setup-hook
          (lambda ()
            (set (make-local-variable 'minibuffer-default-add-function) nil)
            (setq minibuffer-default defaults))
        (read-file-name
         (format "Diff %s with%s: " current
                 (if default (format " (default %s)" default) ""))
         target-dir default t)))))
  (let ((current (dired-get-filename t)))
    (when (or (equal (expand-file-name file)
                     (expand-file-name current))
              (and (file-directory-p file)
                   (equal (expand-file-name current file)
                          (expand-file-name current))))
      (error "Attempt to compare the file to itself"))
    (ediff-files file current)))

(defun ediff-settings ()
  "settings for ediff"
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)

  (lazy-set-key
   '(("M-n"  . ediff-trees-examine-next)
     ("M-p"  . ediff-trees-examine-previous))
   ediff-mode-map)

  (lazy-set-key
   '(("=" . ediff-file)
     ("M-="  . ediff-trees))
   dired-mode-map))

(eval-after-load "init-ediff"
  '(ediff-settings))

;;; init-ediff.el ends here
