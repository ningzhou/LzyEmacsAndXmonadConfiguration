;;; haskell-mode-setting.el ---
;; Time-stamp: <2012-12-07 06:34:13 Friday by lzy>

;; Copyright (C) 2012 zhengyu li
;;
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'haskell-mode-setting)

;;; Code:


(provide 'haskell-mode-setting)


;;; required features:
(load (concat my-emacs-site-lisps-path "HaskellMode/haskell-mode-2.8.0/haskell-site-file"))

(add-hook 'haskell-mode-hook 'turn-on-font-lock)             ;高亮模式
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)        ;智能缩进模式
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)      ;文档模式

;;; init-haskell.el ends here
