;; -*- Emacs-Lisp -*-
;;; hide-ifdef.el ---
;; Time-stamp: <2012-12-06 15:57:50 Thursday by lzy>

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
;;   (require 'hide-ifdef)

;;; Code:


(provide 'hide-ifdef)


(autoload 'hide-ifdef-block "hideif"
  "Hide the ifdef block (true or false part) enclosing or before the cursor."
  t)
(autoload 'hide-ifdefs "hideif"
  "Hide the contents of some #ifdefs.
Assume that defined symbols have been added to `hide-ifdef-env'.
The text hidden is the text that would not be included by the C
preprocessor if it were given the file with those symbols defined.

Turn off hiding by calling `show-ifdefs'."
  t)
(autoload 'show-ifdef-block "hideif"
  "Show the ifdef block (true or false part) enclosing or before the cursor."
  t)
(autoload 'show-ifdefs "hideif"
  "Cancel the effects of `hide-ifdef': show the contents of all #ifdefs."
  t)

(eval-after-load "hideif"
  '(progn
     (setq hide-ifdef-env
           '((GNU_LINUX . t)
             (__GNUC__ . t)
             (__cplusplus . t)))))

(add-hook 'c-mode-common-hook 'hide-ifdef-mode)


(defun hif-goto-endif ()
  "Goto #endif."
  (interactive)
  (unless (or (hif-looking-at-endif)
              (save-excursion)
              (hif-ifdef-to-endif))))

(defun hif-goto-if ()
  "Goto #if."
  (interactive)
  (hif-endif-to-ifdef))

(defun hif-gototo-else ()
  "Goto #else."
  (hif-find-next-relevant)
  (cond ((hif-looking-at-else)
         'done)
        (hif-ifdef-to-endif) ; find endif of nested if
        (hif-ifdef-to-endif)) ; find outer endif or else
  ((hif-looking-at-else)
   (hif-ifdef-to-endif)) ; find endif following else
  ((hif-looking-at-endif)
   'done)
  (t
   (error "Mismatched #ifdef #endif pair")))


(defun hif-find-next-relevant ()
  "Move to next #if..., #else, or #endif, after the current line."
  ;; (message "hif-find-next-relevant at %d" (point))
  (end-of-line)
  ;; avoid infinite recursion by only going to beginning of line if match found
  (re-search-forward hif-ifx-else-endif-regexp (point-max) t))

;;; hide-ifdef.el ends here
