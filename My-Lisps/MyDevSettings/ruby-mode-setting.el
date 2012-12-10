;;; ruby-mode-setting.el --- 
;; Time-stamp: <2012-12-07 06:36:20 Friday by lzy>

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


(provide 'ruby-mode-setting)


(defun ruby-setting ()
  "Setting for `ruby'."
  ;; func definition
  (defun complete-or-indent-for-ruby (arg)
    (interactive "P")
    (complete-or-indent arg nil 'ruby-indent-command))

  (defun ruby-keys ()
    "Ruby keys definition."
    (local-set-key (kbd "<return>") 'newline-and-indent))

  (defun ruby-mark-defun ()
    "Put mark at end of this Ruby function, point at beginning."
    (interactive)
    (push-mark (point))
    (ruby-end-of-defun)
    (push-mark (point) nil t)
    (ruby-beginning-of-defun))

  (defalias 'irb 'run-ruby)
  (font-lock-add-keywords 'ruby-mode '(("\\<require\\>" . font-lock-keyword-face)))
  (setq ri-ruby-script "~/.emacs.d/ri-emacs.rb")

  (add-hook 'ruby-mode-hook
            (lambda ()
              (setq ruby-indent-level 4)
              (ruby-electric-mode nil)
              (ruby-keys)) t)

  (lazy-set-key
   '(("C-x r"   . run-ruby)
     ("C-x R"   . ri)
     ("TAB"     . complete-or-indent-for-ruby)
     ("C-j"     . goto-line)
     ("C-c C-c" . comment)
     ("{"       . self-insert-command)
     ("}"       . self-insert-command))
   ruby-mode-map)
  )

(eval-after-load "ruby-mode"
  '(ruby-setting))

;;; ruby-mode-setting.el ends here
