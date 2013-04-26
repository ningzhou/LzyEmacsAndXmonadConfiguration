;; -*- Emacs-Lisp -*-
;;; script-common-setting.el ---
;; Time-stamp: <2013-04-26 12:10:30 Friday by lzy>

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
;;   (require 'script-common-setting)

;;; Code:

(defvar script-mode-names '(sh-mode awk-mode python-mode perl-mode ruby-mode)
  "script mode need to add exec privilage automatically.")

(defun script-add-exec-privilage ()
  "add exec privilage for script file automatically."
  (if (and (memq major-mode script-mode-names)
           (= (shell-command (concat "test -x " (buffer-file-name))) 1))
      (shell-command (concat "chmod u+x " (buffer-file-name)))))

(add-hook 'after-save-hook 'script-add-exec-privilage)

;;; provide features
(provide 'script-common-setting)

;;; script-common-setting.el ends here
