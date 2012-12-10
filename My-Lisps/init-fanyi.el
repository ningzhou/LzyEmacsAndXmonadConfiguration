;; -*- Emacs-Lisp -*-
;;; init-fanyi.el ---
;; Time-stamp: <2012-12-10 11:20:50 Monday by lzy>

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
;;   (require 'init-youdao-fanyi)

;;; Code:


(provide 'init-fanyi)


;;; require features:
(require 'xml)
(require 'pos-tip)
(require 'xml-parse)


;; get words to translate
(defun get-current-word ()
  (interactive)
  (let ((begin (point-min)) (end (point-max)))
    (save-excursion      
      (when (not mark-active)
        (forward-char)
        (backward-word)
        (mark-word))
      (setq begin (region-beginning)
            end (region-end)))
    (buffer-substring-no-properties begin end)))

;; get results of translation
(defun get-translate-result (word)
  (shell-command-to-string (concat (format "curl --max-time 2 'http://fanyi.youdao.com/openapi.do?keyfrom=hellochieftain&key=979553915&type=data&doctype=xml&version=1.1&q=%s' 2>/dev/null" word))))

;; analysis translation result
(defun analytic-translate-result (translateresult)
  (let* ((root (with-temp-buffer (insert translateresult)
                                 (xml-parse-region (point-min) (point-max))))
         (youdao-fanyi (car root))
         (basic (car (xml-get-children youdao-fanyi 'basic)))
         (phonetic-texts (car (xml-node-children (car (xml-get-children basic 'phonetic)))))
         (explains-ex (xml-get-children (car (xml-get-children basic 'explains)) 'ex))
         (web (car (xml-get-children youdao-fanyi 'web)))
         (web-explain (xml-get-children web 'explain))
         (translated (car (xml-get-children youdao-fanyi 'translation)))
         (translated-ex)
         (explains-texts (if phonetic-texts
                             (concat "[:" phonetic-texts ":]\n")
                           nil)))
    (loop for ex in explains-ex
          do (setq explains-texts (concat explains-texts  (car (xml-node-children ex)) "\n")))
    (while web-explain
      (let ((explain)
            (web-ex))
        (setq explain (car web-explain))
        (setq web-explain (cdr web-explain))
        (setq web-ex (xml-get-children (car (xml-get-children explain 'value)) 'ex))
        (loop for ex in web-ex
              do (setq explains-texts (concat explains-texts  (car (xml-node-children ex)) "\n")))))
    (loop for ex in translated-ex
          do (setq explains-texts (concat explains-texts  (car (xml-node-children ex)) "\n")))
    (if translated
        (progn
          (setq translated-ex (xml-get-children translated 'paragraph))
          (if translated-ex
              (loop for ex in translated-ex
                    do (setq explains-texts (concat explains-texts  (car (xml-node-children ex)) "\n"))))))
    explains-texts))

(defun lookup-word ()
  "translate world from youdao fanyi or sdcv"
  (interactive)
  (let* ((word (get-current-word))
         (sdcv-command (format "sdcv -n %s" word))
         (print sdcv-command)
         (translate-result (get-translate-result word))
         (explains-texts (if (string= translate-result "")
                             (shell-command-to-string sdcv-command)
                           (analytic-translate-result translate-result))))
    (pos-tip-show explains-texts '("blue3" . "light yellow") nil nil -1))
  )

(global-set-key (kbd "C-x p") 'lookup-word)

;;; init-fanyi.el ends here
