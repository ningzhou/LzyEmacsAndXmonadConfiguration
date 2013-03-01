;;; cc-mode-common-setting.el --- 
;; Time-stamp: <2013-03-02 07:29:16 Saturday by lzy>

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


(provide 'cc-mode-common-setting)


(defun cc-mode-common-setting ()
  "Setting for `cc-mode'."
  ;; required features
  (require 'ifdef)
  (require 'hide-ifdef)

  (if (and (>= emacs-major-version 23)
           (>= (+ emacs-major-version emacs-minor-version) 25))
      (subword-mode t))
  
  (c-set-style "stroustrup")
  (c-toggle-hungry-state)

  (lazy-set-key
   '(("C-c i h" . hide-ifdef-block)
     ("C-c i H" . hide-ifdefs)
     ("C-c i e" . show-ifdef-block)
     ("C-c i E" . show-ifdefs)
     ("C-c i m" . mark-ifdef)
     ("C-c M-a" . beginning-of-defun)
     ("C-c M-e" . end-of-defun)
     ("RET" . newline-and-indent)
     ("C-j" . newline-and-indent)
     ("C-c C-c" . comment)
     ("C-c k" . uncomment))
   c-mode-base-map)
  )

(add-hook 'c-mode-common-hook 'cc-mode-common-setting)

;;; cc-mode-common-setting.el ends here
