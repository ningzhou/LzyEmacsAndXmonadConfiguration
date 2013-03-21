;; -*- Emacs-Lisp -*-
;;; LzySetup.el ---
;; Time-stamp: <2013-03-21 16:18:47 Thursday by lzy>

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
;;   (require 'LzySetup)

;;; Code:

;; required features
(require 'init-unbound)                      ;; get unbounded keys information quickly
(require 'init-cursor)                       ;; cursor changes with state
(require 'init-fullscreen)                   ;; full screen setting
(require 'init-windows)                      ;; resize windows/save windows configuraion
(require 'init-uniquify)                     ;; uniquify file name
(require 'init-tabbar)                       ;; tabbar for multi-tab
(require 'init-smooth-scrolling)             ;; provide smooth scroll features
(require 'init-linum)                        ;; linum extension setting
(require 'init-mode-line)                    ;; mode-line setting
(require 'init-tempbuf)                      ;; temporary buffer setting
(require 'init-view-mode)                    ;; settings for view mode
(require 'init-highlight-things)             ;; highlight something, like symbol etc.
(require 'init-fringe-related)               ;; setting for fringe related
(require 'init-timestamp)                    ;; update file timestamp dynamically
(require 'init-killring)                     ;; kill ring browse and search
(require 'init-alarm)                        ;; alarm based on notify-send
(require 'init-ascii)                        ;; show ascii table
(require 'init-calendar)                     ;; calendar setting
(require 'init-what-domain)                  ;; search country code
(require 'init-top)                          ;; top mode for emacs
(require 'init-eperiodic)                    ;; periodic table of chemical element
(require 'init-ispell)                       ;; ispell setting
(require 'init-sdcv)                         ;; stardict console client
(require 'init-youdao)                       ;; youdao tanslation
(require 'init-babel)                        ;; a web translations interface
(require 'init-abbrev)                       ;; save abbreviation
(require 'init-go2chg)                       ;; go to last change place
(require 'init-apropos)                      ;; all apropos related setting
(require 'init-iman)                         ;; extend man information
(require 'init-info+)                        ;; emacs less mode
(require 'init-less)                         ;; extend less information
(require 'init-undo-tree)                    ;; extended undo system setting
(require 'init-ffap)                         ;; ffap setting
(require 'init-find)                         ;; finding related setting
(require 'init-moccur)                       ;; setting for multi occurence
(require 'init-template)                     ;; automatically insert templates
(require 'init-shell-cmd-history)            ;; shell command and history
(require 'init-multis)                       ;; multi shell and term
(require 'init-icomplete)                    ;; icomplete mode
(require 'init-ido)                          ;; ido mode
(require 'init-yasnippet)                    ;; yasnippet setting
(require 'init-autocomplete)                 ;; autocomplete mode setting
(require 'init-anything)                     ;; anyting mode
(require 'init-cua)                          ;; setting for cua mode
(require 'init-weibo)                        ;; sina weibo
(require 'init-tramp)                        ;; transparent remote access
(require 'init-ediff)                        ;; ediff and ediff tree
(require 'init-wget)                         ;; wget setting
(require 'init-dired)                        ;; dired setting
(require 'init-emms)                         ;; emms setting
(require 'init-w3m)                          ;; w3m setting
(require 'init-org)                          ;; setting for org mode
(require 'init-erc)                          ;; erc setting
(require 'init-gnus)                         ;; setting for gnus
(require 'init-newsticker)                   ;; setting for newsticker
(require 'init-google-maps)                  ;; google maps setting
(require 'init-doubanfm)                     ;; douban fm setting
(require 'init-weather)                      ;; show weather in mode line
(require 'init-one-key)                      ;; key binding setting for one key menu
(require 'init-dev-setting)                  ;; setting for programming environment
(require 'init-misc)                         ;; misc setting

;;; provide features
(provide 'LzySetup)

;;; LzySetup.el ends here
