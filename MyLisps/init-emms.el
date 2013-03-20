;; -*- Emacs-Lisp -*-
;;; init-emms.el ---
;; Time-stamp: <2013-03-20 18:28:57 Wednesday by lzy>

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
;;   (require 'init-emms)

;;; Code:

(defun emms-setting ()
  "settings for emms"
  ;; required features
  (require 'emms-info)          
  (require 'emms-i18n)
  (require 'emms-setup)
  (require 'emms-cache)
  (require 'emms-volume)
  (require 'emms-lyrics)
  (require 'emms-streams)
  (require 'emms-history)
  (require 'emms-browser)
  (require 'emms-mode-line)
  (require 'emms-extension)
  (require 'emms-tag-editor)
  (require 'emms-info-libtag)
  (require 'emms-playing-time)
  (require 'emms-volume-amixer)
  (require 'emms-player-mplayer)
  (require 'emms-lyrics-download)
  (require 'emms-player-mpg321-remote)
  ;; variables definition
  (defface emms-playlist-mark-face '((t :foreground "red2")) "face for playlist marked")
  (defvar emms-en-font "Monospace:pixelsize=14" "default english font for emms mode")
  (defvar emms-playlist-last-track nil)
  (defvar emms-playlist-last-indent "\\")
  ;; functions definition
  (defun set-emms-playlist-font ()
    "font setting for emms playlist"
    (set-face-attribute 'emms-playlist-mark-face nil :font emms-en-font)
    (set-face-attribute 'emms-playlist-track-face nil :font emms-en-font)
    (set-face-attribute 'emms-playlist-selected-face nil :font emms-en-font))

  (defun my-emms-track-description-function (track)
    "return a description of the current track."
    (let* ((name (emms-track-name track))
           (type (emms-track-type track))
           (short-name (file-name-nondirectory name))
           (play-count (or (emms-track-get track 'play-count) 0))
           (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
           (empty "..."))
      (prog1
          (case (emms-track-type track)
            ((file url)
             (let* ((artist (or (emms-track-get track 'info-artist) empty))
                    (year (emms-track-get track 'info-year))
                    (playing-time (or (emms-track-get track 'info-playing-time) 0))
                    (min (/ playing-time 60))
                    (sec (% playing-time 60))
                    (album (or (emms-track-get track 'info-album) empty))
                    (tracknumber (emms-track-get track 'info-tracknumber))
                    (short-name (file-name-sans-extension
                                 (file-name-nondirectory name)))
                    (title (or (emms-track-get track 'info-title) short-name))
                    (ltrack emms-playlist-last-track)
                    (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
                                 empty))
                    (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
                                empty))
                    (same-album-p (and (not (string= lalbum empty))
                                       (string= album lalbum))))
               (format "%8s  %-03d  %-35s%-55s%-50s%-15s%s"
                       (emms-last-played-format-date last-played)
                       play-count
                       artist
                       (concat (if same-album-p ; indention by album
                                   (setq emms-playlist-last-indent
                                         (concat " " emms-playlist-last-indent))
                                 (setq emms-playlist-last-indent "\\")
                                 "")
                               (if (and tracknumber ; tracknumber
                                        (not (zerop (string-to-number tracknumber))))
                                   (format "%02d." (string-to-number tracknumber))
                                 "")
                               title)
                       (cond ((string= album empty) empty)
                             (t (concat "《" album "》")))
                       (or year empty)
                       (if (or (> min 0)  (> sec 0))
                           (format "%02d:%02d" min sec)
                         empty))))
            ((url)
             (concat (symbol-name type) ":" name))
            (t
             (format "%-3d%s" play-count (concat (symbol-name type) ":" name))))
        (setq emms-playlist-last-track track))))
  
  (defun emms-show-lyrics-on-minibuffer ()
    "show lyrics in minibuffer"
    (interactive)
    (progn
      (emms-lyrics-enable)
      (emms-lyrics-toggle-display-on-minibuffer)))
  ;; settings
  ;; basic settings
  (setq emms-directory "~/.emacs.d/Emms/")
  (setq emms-cache-file "~/.emacs.d/Emms/cache")
  (setq emms-score-file "~/.emacs.d/Emms/scores")
  (setq emms-history-file "~/.emacs.d/Emms/history")
  (setq emms-source-file-default-directory "~/Music/")
  (setq emms-stream-bookmarks-file "~/.emacs.d/Emms/streams")
  (setq emms-playlist-default-major-mode 'emms-playlist-mode) 
  (setq emms-repeat-playlist nil) 
  (setq emms-info-asynchronously nil)
  (setq emms-player-next-function 'emms-next)
  (setq emms-playlist-buffer-name "*Music playlist*")
  (setq emms-playlist-sort-function 'emms-playlist-sort-by-natural-order) 
  (setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
  (setq emms-mark-face-alist
        '((?* . emms-playlist-mark-face)
          (?\040 . emms-playlist-track-face)))
  (setq emms-info-functions '(emms-info-libtag)
        emms-info-mp3info-coding-system 'gbk
        emms-cache-file-coding-system 'utf-8)
  (setq emms-player-list '(emms-player-mplayer
                           emms-player-mpg321
                           emms-player-ogg123
                           emms-player-timidity))
  (setq emms-last-played-format-alist
        '(((emms-last-played-seconds-today) . "%H:%M")     ;today
          (604800                           . "W%w %H:%M") ;this weekend
          ((emms-last-played-seconds-month) . "%d")        ;this month
          ((emms-last-played-seconds-year)  . "%m-%d")     ;this year
          (t                                . "")))
  (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
  ;; lyrics settings
  (setq emms-lyrics-directory "~/.emacs.d/Emms/Lyrics")
  (setq emms-lyrics-display-format "%s")       ;display formt of lyrics
  (setq emms-lyrics-scroll-timer-interval 1.0) ;delay of lyrics scroll time
  (setq emms-lyrics-display-on-minibuffer nil) ;don't display lyrics in minibuffer
  (setq emms-lyrics-display-on-modeline nil)   ;don't display lyrics in modeline
  (ad-activate 'emms-lyrics-find-lyric)        ;download lyrics automatically
  ;; browser settings
  (setq emms-browser-info-genre-format "%i● %n"
        emms-browser-info-artist-format "%i● %n"
        emms-browser-info-album-format "%i◎ %n"
        emms-browser-info-title-format "%i♪ %n")
  (emms-browser-make-filter "EVERYTHING" 'ignore)
  (emms-browser-set-filter (assoc "EVERYTHING" emms-browser-filters))
  (emms-browser-make-filter "ALL-FILES" (emms-browser-filter-only-type 'file))
  (emms-browser-make-filter "LAST-MONTH-PLAYED" (emms-browser-filter-only-recent 30))
  (emms-browser-make-filter "LAST-MONTH-NOT-PLAYED"
                            (lambda (track)
                              (not (funcall (emms-browser-filter-only-recent 30) track))))
  (put 'emms-browser-delete-files 'disabled nil)
  ;; emms playlist font setting
  (add-hook 'emms-playlist-mode-hook 'set-emms-playlist-font)
  (add-hook 'emms-browser-delete-files-hook 'de-kill-covers-and-parents)
  ;; init emms with devel mode
  (emms-devel)
  (emms-cache 1)
  (emms-lyrics-disable)
  (emms-mode-line-disable)
  ;; playlist description setting, should be set after emms-devel
  (setq emms-track-description-function 'my-emms-track-description-function)
  ;; basic key bindings
  (lazy-set-key
   '(("C-x C-s" . emms-playlist-save)             ;save current playlist
     ("C-k" . emms-playlist-mode-kill-track)      ;delete current track
     ("C-y" . emms-playlist-mode-yank)            ;paste
     ("C-w" . emms-playlist-mode-kill)            ;delete region
     ("C-/" . emms-playlist-mode-undo)            ;undo
     ("M-p" . emms-playlist-mode-previous)        ;the previous playlist
     ("M-n" . emms-playlist-mode-next)            ;the next playlist     
     ("C-j" . emms-playlist-mode-insert-newline)  ;new line
     ("M-y" . emms-playlist-mode-yank-pop)        ;pop up yank ring
     ("a" . emms-playlist-mode-add-contents)      ;add track to current playlist
     ("d" . emms-playlist-mode-kill-entire-track) ;remove this track from current playlist
     ("g" . emms-playlist-mode-center-current)    ;jump to track playing currently
     ("C" . emms-playlist-mode-clear)             ;clear the current playlist
     ("f" . emms-playlist-mode-play-smart)        ;play the current track
     ("0" . emms-playlist-mode-first)             ;the first line of playlist
     ("9" . emms-playlist-mode-last)              ;the last line of playlist
     ("q" . emms-playlist-mode-bury-buffer)       ;quit emms playlist
     ("D" . emms-delete-file-from-disk)           ;delete file from disk
     ("b" . emms-playlist-set-playlist-buffer)    ;set buffer of current playlist
     ("p" . emms-previous)                        ;the previous track
     ("n" . emms-next)                            ;the next track
     ("r" . emms-random)                          ;select next track randomly
     (">" . emms-seek-forward)                    ;track forward
     ("<" . emms-seek-backward)                   ;track back
     ("x" . emms-pause)                           ;pause/Continue
     ("X" . emms-pause)                           ;pause/Continue
     ("s" . emms-stop)                            ;stop
     ("z" . emms-show)                            ;show detail info of current track
     ("Z" . emms-show)                            ;show detail info of current track
     ("?" . describe-mode)                        ;help info
     ("G" . emms-jump-to-file)                    ;jump to media file of current track
     ("m" . emms-mark-track-and-move-next)        ;mark current track and move to next
     ("M" . emms-mark-all)                        ;mark all tracks
     ("u" . emms-mark-unmark-track-and-move-next) ;unmark current track
     ("U" . emms-mark-unmark-all)                 ;unmark all tracks
     ("," . emms-first-mark-track)                ;the first marked track
     ("." . emms-last-mark-track)                 ;the last marked track
     (";" . emms-tag-editor-edit-marked-tracks)   ;edit tracks marked
     ("P" . emms-prev-mark-track)                 ;previous marked track
     ("N" . emms-next-mark-track)                 ;next marked track
     ("l" . emms-show-lyrics-on-minibuffer)       ;display lyrics in minibuffer
     ("L" . emms-lyrics-disable)                  ;disable lyrics show in minibuffer
     )
   emms-playlist-mode-map)
  ;; emms tag editor key bindings
  (lazy-set-key
   '(("M-p" . emms-tag-editor-prev-same-field)  
     ("M-n" . emms-tag-editor-next-same-field)
     ("C-c a" . emms-tag-editor-set-all+)  
     ("C-c n" . emms-tag-editor-set-tracknumber)
     ("C-c i" . emms-tag-editor-set-tracknumber+))
   emms-tag-editor-mode-map)
  ;; emms browser key bindings
  (lazy-set-key
   '(("J" . emms-browser-next-non-track)      
     ("K" . emms-browser-prev-non-track)     
     ("f" . emms-browser-toggle-subitems) 
     ("s" . one-key-menu-emms-browser-search) 
     ("L" . one-key-menu-emms-browser-lookup))
   emms-browser-mode-map)
  ;; emss stream key bindings
  (lazy-set-key
   '(("a" . emms-stream-add-bookmark)
     ("d" . emms-stream-delete-bookmark)
     ("E" . emms-stream-edit-bookmark)
     ("q" . emms-stream-quit)         
     ("S" . emms-stream-save-bookmarks-file)
     ("t" . emms-stream-toggle-default-action)
     ("i" . emms-stream-info-bookmark) 
     ("f" . emms-stream-play))         
   emms-stream-mode-map)
  ;; global emms key bindings, these key bindings must be
  ;; set after emms mode be loaded
  (lazy-set-key
   '(("C-c o n" . emms-next)
     ("C-c o p" . emms-previous)
     ("C-c o r" . emms-random)
     ("C-c o s" . emms-stop))))

(eval-after-load "emms" '(emms-setting))

;;; provide features
(provide 'init-emms)

;;; init-emms.el ends here
