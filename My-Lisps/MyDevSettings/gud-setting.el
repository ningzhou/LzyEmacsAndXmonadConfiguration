;;; gud-setting.el --- 
;; Time-stamp: <2012-12-07 06:34:05 Friday by lzy>

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


(provide 'gud-setting)


(defun gud-setting ()
  "setting for gud"
  ;; func definitions
  (defun kill-buffer-when-shell-command-exit ()
    "Close current buffer when `shell-command' exit."
    (let ((process (ignore-errors (get-buffer-process (current-buffer)))))
      (when process
        (set-process-sentinel process
                              (lambda (proc change)
                                (when (string-match "\\(finished\\|exited\\)" change)
                                  (kill-buffer (process-buffer proc))))))))

  ;; setting
  ;; 退出gdb的时候关闭gdb对应的buffer
  (add-hook 'gud-gdb-mode-hook 'kill-buffer-when-shell-command-exit)
  ;; 显示gdb的鼠标提示
  (gud-tooltip-mode 1)
  )

(eval-after-load "gud"
  '(gud-setting))

;;; gud-setting.el ends here
