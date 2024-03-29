;; -*- Emacs-Lisp -*-
;;; douban-music.el ---
;; Time-stamp: <2013-03-20 10:40:55 Wednesday by lzy>

;; Copyright (C) 2012 Xiang Wang
;;
;; Author: Author: Xiang Wang <wxjeacen@gmail.com>
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
;;   (require 'douban-music)

;;; Code:

(require 'json)
(require 'assoc)
(require 'url-http)

(defgroup douban-music nil
  "douban music interface"
  :group 'entertainment
  :prefix "douban-music-")

(defvar local-music-store '()
  "Song information in local store.
This store is a containner which pulls data from remote server, and
feed data to music player")

(defvar channel-number (random 20))

(defcustom douban-music-server (concat "http://douban.fm/j/mine/playlist?type=n&channel="  
                                       (number-to-string channel-number))
  "douban server url address"
  :group 'douban-music)

(defvar current-song '()
  "The current Song that music player is opened")

(defun douban-music-fetch-songs-from-server ()
  (interactive)
  "Get next songs from douban server"
  (let ((url douban-music-server)
        (url-request-method "GET")
        (url-request-data nil)
        (url-request-extra-headers '(("Content-Length" . "0")))
        (url-mime-charset-string)
        (url-extensions-header)
        (url-show-status)
        json
        buffer)
    (setq buffer (url-retrieve-synchronously  url))
    (with-current-buffer buffer
      (goto-char (point-max))
      (setq json (cdr (assoc 'song
                             (json-read-from-string
                              (buffer-substring
                               (line-beginning-position)
                               (point-max))))))
      ( if (vectorp json)
          (copy-to-local-store json)
        (progn
          (error "Invalid data format"))))
    (kill-buffer buffer)))

(defun copy-to-local-store (data)
  ( if (vectorp data)
      (progn
        (if (vectorp local-music-store)
            (error "Should be list"))
        (dotimes (i (length data))
          ( let ((var (aref data i)))
            (setq local-music-store
                  (cons var local-music-store)))))
    (error "Invalid data format")))

(defun douban-music-pop-song-from-store ()
  "Pop up a muisc from local music store"
  (let ((song))
    ( if (eq nil local-music-store )
        (progn 
          (douban-music-fetch-songs-from-server)
          (setq channel-number (random 20))))
    (if (eq nil local-music-store)
        (error "Fail to fetch muiscs from douban music server"))
    (setq song (elt local-music-store 0))
    (setq local-music-store (cdr local-music-store))
    song))

(defun play-music-filter ( proc string)
  (if (string-match "finished" string)
      (progn
        (kill-douban-music-process)
        (douban-music-play-song))))

(defun douban-music-play-song ()
  (interactive)
  (let ((song )
        (is-play nil))
    (dolist (elt (process-list))
      (if (string-match "douban-music-proc<?[0-9]*>?" (process-name elt))
          (setq is-play t)))
    (if ( eq is-play nil)
        (progn
          (setq current-song (douban-music-pop-song-from-store))
          (setq song current-song)
          (set-process-filter
           (start-process "douban-music-proc" nil "mpg123" (aget song 'url))
           'play-music-filter))
      (message "Current Music is playing."))))

(defun douban-music-stop-play ()
  (interactive)
  (kill-douban-music-process))

(defun douban-music-play-next-song ()
  (interactive)
  (kill-douban-music-process)
  (douban-music-play-song))

(defun kill-douban-music-process ()
  " kill all sydio process, ie. process name matchs
  \"sydio-proc<?[0-9]*>?\""
  (dolist (elt (process-list))
    (if (string-match "douban-music-proc<?[0-9]*>?" (process-name elt))
        (delete-process elt))))

(defun douban-music-current-song-info ()
  (interactive)
  (princ current-song))

;;; provide features
(provide 'douban-music)

;;; douban-music.el ends here
