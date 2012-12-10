;; -*- Emacs-Lisp -*-
;;; doxymacs-setting.el ---
;; Time-stamp: <2012-12-07 06:29:33 Friday by lzy>

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
;;   (require 'doxymacs-setting)

;;; Code:


(provide 'doxymacs-setting)


;; required features
(require 'doxymacs)


;; C++ style comments
(defconst doxymacs-C++-file-comment-template
  '(
    "/// " > n
    "/// @file "
    (if (buffer-file-name)
        (file-name-nondirectory (buffer-file-name))" ") 
    " -*- c++ -*-" > n
    "///" > n
    "/// @brief none" > n
    "/// " > n
    "/// Time-stamp: <2012-04-14>" > n
    "/// " > n
    "/// Copyright (c) 2011-2012, zhengyu li <lizhengy419 at gmail dot com>" > n
    "/// All rights reserved." > n
    "///" > n
    "/// Redistribution and use in source and binary forms, with or without" > n
    "/// modification, are permitted provided that the following conditions are met:" > n
    "///" > n
    "///   * Redistributions of source code must retain the above copyright notice," > n
    "///     this list of conditions and the following disclaimer." > n
    "///   * Redistributions in binary form must reproduce the above copyright" > n
    "///     notice, this list of conditions and the following disclaimer in the" > n
    "///     documentation and/or other materials provided with the distribution." > n
    "///   * Neither the name of Redis nor the names of its contributors may be used" > n
    "///     to endorse or promote products derived from this software without" > n
    "///     specific prior written permission." > n
    "///" > n
    "/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\"" > n
    "/// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE" > n
    "/// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE" > n
    "/// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE" > n
    "/// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR" > n
    "/// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF" > n
    "/// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS" > n 
    "/// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN" > n
    "/// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)" > n
    "/// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE" > n
    "/// POSSIBILITY OF SUCH DAMAGE." > n
    "///" > n ))

(defconst doxymacs-C++-function-comment-template
  '((let ((next-func (doxymacs-find-next-func)))
      (if next-func
          (list
           'l
           "/// " '> 'n
           "/// @brief " 'p '> 'n
           "///" '> 'n
           (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
           (unless (string-match
                    (regexp-quote (cdr (assoc 'return next-func)))
                    doxymacs-void-types)
             '(l "///" > n "/// " (doxymacs-doxygen-command-char)
                 "return " (p "Returns: ") > n))
           "///" '>)
        (progn
          (error "Can't find next function declaraton.")
          nil))))
  "Default C++-style template for function documentation.")

(defconst doxymacs-C++-blank-multiline-comment-template
  '("/// " p > n "/// " p > n "///")
  "Default C++-style template for a blank multiline doxygen comment.")

;; Java/C style comments
(defconst doxymacs-JavaDoc-file-comment-template
  '(
    "/** " > n
    "* @file "
    (if (buffer-file-name)
        (file-name-nondirectory (buffer-file-name))" ") 
    " -*- c -*-" > n
    "*" > n
    "* @brief none" > n
    "* " > n
    "* Time-stamp: <2012-04-14>" > n
    "* " > n
    "* Copyright (c) 2011-2012, zhengyu li <lizhengy419 at gmail dot com>" > n
    "* All rights reserved." > n
    "*" > n
    "* Redistribution and use in source and binary forms, with or without" > n
    "* modification, are permitted provided that the following conditions are met:" > n
    "*" > n
    "*   * Redistributions of source code must retain the above copyright notice," > n
    "*     this list of conditions and the following disclaimer." > n
    "*   * Redistributions in binary form must reproduce the above copyright" > n
    "*     notice, this list of conditions and the following disclaimer in the" > n
    "*     documentation and/or other materials provided with the distribution." > n
    "*   * Neither the name of Redis nor the names of its contributors may be used" > n
    "*     to endorse or promote products derived from this software without" > n
    "*     specific prior written permission." > n
    "*" > n
    "* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\"" > n
    "* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE" > n
    "* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE" > n
    "* ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE" > n
    "* LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR" > n
    "* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF" > n
    "* SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS" > n 
    "* INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN" > n
    "* CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)" > n
    "* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE" > n
    "* POSSIBILITY OF SUCH DAMAGE." > n
    "*/" > n ))

(defconst doxymacs-JavaDoc-function-comment-template
  '((let ((next-func (doxymacs-find-next-func)))
      (if next-func
          (list
           'l
           "/** " '> 'n
           "* @brief " 'p '> 'n
           (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
           (unless (string-match
                    (regexp-quote (cdr (assoc 'return next-func)))
                    doxymacs-void-types)
             '(l "*" 'p '> 'n "* " (doxymacs-doxygen-command-char)
                 "return " (p "Returns: ") 'p '> 'n))
           "*/" '>)
        (progn
          (error "Can't find next function declaraton.")
          nil))))
  "Default Java-style template for function documentation.")

(defconst doxymacs-JavaDoc-blank-multiline-comment-template
  '("/*" p > n "* " p > n " */")
  "Default Java-style template for a blank multiline doxygen comment.")

(defconst doxymacs-JavaDoc-blank-singleline-comment-template
  '("/* " > p " */")
  "Default Java-style template for a blank single line doxygen comment.")

(add-hook 'c-mode-hook
          '(lambda ()
             (doxymacs-mode 1)
             (doxymacs-font-lock)
             (setq doxymacs-doxygen-style "JavaDoc")))

(add-hook 'c++-mode-hook
          '(lambda ()
             (doxymacs-mode 1)
             (doxymacs-font-lock)
             (setq doxymacs-doxygen-style "C++")))

(add-hook 'java-mode-hook
          '(lambda ()
             (doxymacs-mode 1)
             (doxymacs-font-lock)
             (setq doxymacs-doxygen-style "JavaDoc")))

;;; doxymacs-setting.el ends here
