;; -*- Emacs-Lisp -*-
;;; init-shell-cmd-history.el ---
;; Time-stamp: <2013-03-15 17:10:45 Friday by lzy>

;; Copyright (C) 2013 chieftain
;;
;; Author: chieftain <lizhengyu419@gmail.com>
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
;;   (require 'init-shell-cmd-history)

;;; Code:

(defun shell-command-and-history-settings ()
  "settings for shell command and history"
  ;; required features
  (require 'shell-history)
  (require 'shell-command-extension)
  ;; settings
  (shell-command-completion-mode))

(add-hook 'term-mode-hook
          'shell-command-and-history-settings)

;;; provide features
(provide 'init-shell-cmd-history)

;;; init-shell-cmd-history.el ends here

