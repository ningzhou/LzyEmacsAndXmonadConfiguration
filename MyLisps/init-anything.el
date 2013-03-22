;; -*- Emacs-Lisp -*-
;;; init-anything.el ---
;; Time-stamp: <2013-03-22 07:34:47 Friday by lzy>

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
;;   (require 'init-anything)

;;; Code:

(defun anything-setting ()
  "settings for anything"
  ;; required features
  (require 'anything-config)
  (require 'anything-complete)
  (require 'anything-match-plugin)

  ;; settings
  (setq anything-idle-delay 1.0)
  (setq anything-quick-update t)
  (setq anything-candidate-number-limit 10000)
  (setq anything-sources
        (list anything-c-source-ffap-guesser
              anything-c-source-buffers
              anything-c-source-recentf
              anything-c-source-file-name-history
              anything-c-source-locate
              anything-c-source-files-in-current-dir+
              anything-c-source-extended-command-history
              anything-c-source-complex-command-history
              anything-c-source-emacs-process
              anything-c-source-buffer-not-found
              anything-c-source-tracker-search
              anything-c-source-calculation-result
              anything-c-source-evaluation-result
              anything-c-source-kill-ring)))

(eval-after-load "anything"
  '(anything-setting))

(autoload 'anything "anything" nil t)

(lazy-set-key
 '(("C-<f6>" . anything)))

;;; provide features
(provide 'init-anything)

;;; init-anything.el ends here
