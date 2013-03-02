;; -*- Emacs-Lisp -*-
;;; LzySetup.el ---
;; Time-stamp: <2013-03-03 05:04:30 Sunday by lzy>

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
;;   (require 'LzySetup)

;;; Code:


(provide 'LzySetup)


;; required features
(require 'basic-tools)                       ;; basic tools
(require 'init-lazy-set-key)                 ;; global key-binding library used by the following libs
(require 'init-showtip)                      ;; show tooltip near the cursor not the mouse
(require 'init-eperiodic)                    ;; periodic table of chemical element
(require 'init-top)                          ;; emacs mode for shell command `top'
(require 'init-babel)                        ;; a web translations interface
(require 'init-unbound)                      ;; get unbounded keys information quickly
(require 'init-apropos)                      ;; all apropos related setting
(require 'init-calendar)                     ;; calendar setting
(require 'init-ascii)                        ;; show ascii table
(require 'init-what-domain)                  ;; search country code
(require 'init-weibo)                        ;; sina weibo
(require 'init-windows)                      ;; resize windows/save windows configuraion
(require 'init-alarm)                        ;; alarm based on notify-send
(require 'init-fullscreen)                   ;; full screen setting
(require 'init-ispell)                       ;; ispell setting
(require 'init-sdcv)                         ;; stardict console client
(require 'init-fanyi)                        ;; youdao tanslation
(require 'init-cursor)                       ;; cursor changes with state
(require 'init-tramp)                        ;; transparent remote access
(require 'init-abbrev)                       ;; save abbreviation
(require 'init-go2chg)                       ;; go to last change place
(require 'init-wget)                         ;; wget setting
(require 'init-shell-command-and-history)    ;; shell command and history
(require 'init-xray)                         ;; show inner structure of emacs object
(require 'init-mode-line)                    ;; mode-line setting
(require 'init-iman)                         ;; extend man information
(require 'init-info+)                        ;; emacs less mode
(require 'init-less)                         ;; extend less information
(require 'init-killring)                     ;; kill ring browse and search
(require 'init-uniquify)                     ;; uniquify file name
(require 'init-linum)                        ;; linum extension setting
(require 'init-smooth-scrolling)             ;; provide smooth scroll features
(require 'init-multis)                       ;; multi shell and term
(require 'init-tabbar)                       ;; tabbar for multi-tab
(require 'init-fringe-related)               ;; setting for fringe related
(require 'init-tmpbuf)                       ;; temporary buffer setting
(require 'init-pick-backup)                  ;; browsing versioned backup files
(require 'init-doc-view)                     ;; extension for doc view
(require 'init-chm-view)                     ;; chm view setting
(require 'init-undo-tree)                    ;; extended undo system setting
(require 'init-find)                         ;; finding related setting
(require 'init-speedbar)                     ;; speedbar setting
(require 'init-dired)                        ;; dired setting
(require 'init-icomplete)                    ;; icomplete mode
(require 'init-ido)                          ;; ido mode
(require 'init-anything)                     ;; anyting mode
(require 'init-hippie)                       ;; hippie expand setting
(require 'init-yasnippet)                    ;; yasnippet setting
(require 'init-autocomplete)                 ;; autocomplete mode setting
(require 'init-highlight-things)             ;; highlight something, like symbol etc.
(require 'init-rect-extension)               ;; rectangle setting
(require 'init-ediff)                        ;; ediff and ediff tree
(require 'init-emms)                         ;; emacs multi-media setting
(require 'init-w3m)                          ;; emacs browser setting
(require 'init-etags-extension)              ;; etags extension
(require 'init-org)                          ;; setting for org mode
(require 'init-dev-setting)                  ;; setting for programming environment
(require 'init-edit-setting)                 ;; edit setting for all buffer
(require 'init-template)                     ;; automatically insert templates
(require 'init-one-key)                      ;; key binding setting for one key menu
(require 'init-misc)                         ;; other setting
(require 'init-chart)                        ;; chart of emacs storage
(require 'init-git)                          ;; git-emacs
(require 'init-moccur)                       ;; setting for multi occurence
(require 'init-timestamp)                    ;; update file timestamp dynamically
(require 'init-gnus)                         ;; setting for gnus
(require 'init-erc)                          ;; erc setting
(require 'init-newsticker)                   ;; setting for newsticker
(require 'init-cua)                          ;; setting for cua mode
(require 'init-doubanfm)                     ;; douban fm setting
(require 'init-weather)                      ;; show weather in mode line
(require 'init-hack)                         ;; in-built functions hack

;;; LzySetup.el ends here
