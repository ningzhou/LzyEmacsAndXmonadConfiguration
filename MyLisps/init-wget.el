;; -*- Emacs-Lisp -*-
;;; init-wget.el ---
;; Time-stamp: <2013-04-11 15:20:24 Thursday by lzy>

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
;;   (require 'init-wget)

;;; Code:

(eval-after-load "wget"
  '(progn
     (setq wget-download-directory
           '(("\\.\\([jP][pP][eE]?[gG]\\|[pP][nN][gG]\\|[gG][iI][fF]\\|[bB][mM][pP]\\)$" . "~/Pictures")
             ("\\.\\([mM][pP]3\\|[fF][lL][aA][cC]\\|[aA][pP][eE]\\|[wW][mM][aA]\\|[mM][pP]4\\)$" . "~/Music/Downloads/")
             ("\\.\\([rR][mM]?[vV][bB]\\|[v][V][oO][bB]\\|[aA][vV][iI]\\|[dD][vV][dD]\\)$" . "~/Videos/")
             ("\\.\\(el\\|sh\\|perl\\|py\\|[cC]\\|[cC][pP][pP]\\|[jJ][aA][vV][aA]\\|[hH][sS]\\|[tT][xX][tT]\\)$" . "~/Downloads/Source/")
             ("\\.\\([dD][oO][cC]\\|[pP][dD][fF]\\|[xX][mM][lL]\\|[xX][lL][sS]\\)$" . "~/Documents/")
             ("\\.\\(tar\\|gz\\|zip\\|bz2\\|rar\\|msi\\|exe\\|iso\\|torrent\\)$" . "~/Downloads/")
             ("." . "~/.emacs.d/W3M/DownloadPages/")))
     (setq wget-download-directory-filter
           'wget-download-dir-filter-regexp)))

(autoload 'wget "wget"
  "Wget interface to download URI asynchronously" t)
(autoload 'wget-web-page "wget"
  "Wget interface to download URI asynchronously" t)

;;; provide features
(provide 'init-wget)

;;; init-wget.el ends here
