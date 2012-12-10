;; -*- Emacs-Lisp -*-
;;; init-emms.el ---
;; Time-stamp: <2012-12-07 16:47:24 Friday by lzy>

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
;;   (require 'init-emms)

;;; Code:


(provide 'init-emms)


;; require features
(require 'emms-info)               
(require 'emms-setup)                  
(require 'emms-i18n)           
(require 'emms-cache)               
(require 'emms-volume)            
(require 'emms-lyrics)                  
(require 'emms-streams)
(require 'emms-history)
(require 'emms-browser)
(require 'emms-mode-line)
(require 'one-key-config)
(require 'emms-extension)
(require 'emms-tag-editor)
(require 'emms-info-libtag)
(require 'emms-playing-time)
(require 'emms-volume-amixer)
(require 'emms-player-mplayer)
(require 'emms-lyrics-download)
(require 'emms-player-mpg321-remote)

(defface emms-playlist-mark-face
  '((t :foreground "red2"))
  "face for playlist marked")

(defun emms-show-lyrics-on-minibuffer ()
  "show lyrics in minibuffer"
  (interactive)
  (progn
    (emms-lyrics-enable)
    (emms-lyrics-toggle-display-on-minibuffer)))

(defun emms-setting ()
  "init settings for emms"

  ;;; settings for emms directory
  (setq emms-directory "~/.emacs.d/emms/")                   
  (setq emms-cache-file "~/.emacs.d/emms/cache")
  (setq emms-score-file "~/.emacs.d/emms/scores")
  (setq emms-history-file "~/.emacs.d/emms/history")
  (setq my-lyrics-directory "~/.emacs.d/emms/lyrics")
  (setq emms-source-file-default-directory "~/Music/")       
  (setq emms-stream-bookmarks-file "~/.emacs.d/emms/streams")

  ;;; emms play settings
  ;;emms major mode for playlist
  (setq emms-playlist-default-major-mode 'emms-playlist-mode) 
  ;;add track info initialization function
  (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
  ;; fix the bug of emms
  (setq emms-player-next-function 'emms-next)
  ;;play repeatly
  (setq emms-repeat-playlist nil) 
  ;;set sort methof of playlist: Artist -> Album -> Serial-num
  (setq emms-playlist-sort-function 'emms-playlist-sort-by-natural-order) 
  ;;set the order of media player selection
  (setq emms-player-list '(emms-player-mplayer
                           emms-player-mpg321
                           emms-player-ogg123
                           emms-player-timidity))
  (setq emms-mark-face-alist
        '((?* . emms-playlist-mark-face)
          (?\040 . emms-playlist-track-face)))
  
  ;;colse async mode of emms
  (setq emms-info-asynchronously nil)
  ;;title name of playlist buffer
  (setq emms-playlist-buffer-name "*Music playlist*")
  (setq emms-source-file-directory-tree-function
        'emms-source-file-directory-tree-find)
  (setq emms-show-format "%s")
  ;;coding system
  (setq emms-info-functions '(emms-info-libtag)
        emms-info-mp3info-coding-system 'gbk
        emms-cache-file-coding-system 'utf-8)
  ;;set time format
  (setq emms-last-played-format-alist
        '(((emms-last-played-seconds-today) . "%H:%M")     ;today
          (604800                           . "W%w %H:%M") ;this weekend
          ((emms-last-played-seconds-month) . "%d")        ;this month
          ((emms-last-played-seconds-year)  . "%m-%d")     ;this year
          (t                                . "")))
  
  ;;; lyric settings
  (ad-activate 'emms-lyrics-find-lyric)        ;download lyrics automatically
  (setq emms-lyrics-dir my-lyrics-directory)   ;emms lyric directory
  (setq emms-lyrics-display-format "%s")       ;display formt of lyrics
  (setq emms-lyrics-scroll-timer-interval 1.0) ;delay of lyrics scroll time
  (setq emms-lyrics-display-on-minibuffer nil) ;don't display lyrics in minibuffer
  (setq emms-lyrics-display-on-modeline nil)   ;don't display lyrics in modeline

  ;; Emms-browser
  (setq emms-browser-info-genre-format "%i● %n"
        emms-browser-info-artist-format "%i● %n"
        emms-browser-info-album-format "%i◎ %n"
        emms-browser-info-title-format "%i♪ %n")
  (emms-browser-make-filter               ;show everything
   "EVERYTHING" 'ignore)
  (emms-browser-set-filter                
   (assoc "EVERYTHING" emms-browser-filters))
  (emms-browser-make-filter              
   "ALL-FILES" (emms-browser-filter-only-type 'file))
  (emms-browser-make-filter              
   "LAST-MONTH-PLAYED" (emms-browser-filter-only-recent 30))
  (emms-browser-make-filter              
   "LAST-MONTH-NOT-PLAYED"
   (lambda (track)
     (not (funcall (emms-browser-filter-only-recent 30) track))))
  (put 'emms-browser-delete-files 'disabled nil) ;delete file without notification
  ;;delete current directory, if not have music file in directory when delete current track
  (add-hook 'emms-browser-delete-files-hook
            'de-kill-covers-and-parents)

  ;;types mplayer can support
  (emms-player-set emms-player-mplayer 'regex
                   "\\.ogg\\|\\.mp3\\|\\.wav\\|\\.mpg\\|\\.mpeg\\|\\.wmv\\|\\.wma\\|\\.mov\\|\\.avi\\|\\.divx\\|\\.ogm\\|\\.asf\\|\\.mkv\\|http://\\|mms://\\|\\.rm\\|\\.rmvb\\|\\.mp4\\|\\.flac\\|\\.vob\\|\\.m4a\\|\\.ape\\|\\.mpc")
  
  ;; emms development mode
  (emms-devel)
  ;;don't show lyrics in mode-line
  (emms-mode-line-disable)
  ;;set emms cache
  (emms-cache 1)
  ;;don't display lyrics in default
  (emms-lyrics-disable)

  ;; key binding
  (lazy-set-key
   '(
     ("C-x C-s" . emms-playlist-save)             ;save current playlist
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
     ("D" . emms-delete-file-from-disk)           ;delete file from disk
     ("C" . emms-playlist-mode-clear)             ;clear the current playlist
     ("f" . emms-playlist-mode-play-smart)        ;play the current track
     ("b" . emms-playlist-set-playlist-buffer)    ;set buffer of current playlist
     ("p" . emms-previous)                        ;the previous track
     ("n" . emms-next)                            ;the next track
     ("0" . emms-playlist-mode-first)             ;the first line of playlist
     ("9" . emms-playlist-mode-last)              ;the last line of playlist
     ("r" . emms-random)                          ;select next track randomly
     (">" . emms-seek-forward)                    ;track forward
     ("<" . emms-seek-backward)                   ;track back
     ("x" . emms-pause)                           ;pause/Continue
     ("X" . emms-pause)                           ;pause/Continue
     ("s" . emms-stop)                            ;stop
     ("z" . emms-show)                            ;show detail info of current track
     ("Z" . emms-show)                            ;show detail info of current track
     ("q" . emms-playlist-mode-bury-buffer)       ;quit emms playlist
     ("?" . describe-mode)                        ;help info
     ("g" . emms-playlist-mode-center-current)    ;jump to track playing currently
     ("G" . emms-jump-to-file)                    ;jump to media file of current track
     ("m" . emms-mark-track-and-move-next)        ;mark current track and move to next
     ("M" . emms-mark-all)                        ;mark all tracks
     ("u" . emms-mark-unmark-track-and-move-next) ;unmark current track
     ("U" . emms-mark-unmark-all)                 ;unmark all tracks
     (";" . emms-tag-editor-edit-marked-tracks)   ;edit tracks marked
     ("," . emms-first-mark-track)                ;the first marked track
     ("." . emms-last-mark-track)                 ;the last marked track
     ("P" . emms-prev-mark-track)                 ;previous marked track
     ("N" . emms-next-mark-track)                 ;next marked track
     ("S" . one-key-menu-emms-playlist-sort)      ;one-key for emms sorting
     ("l" . emms-show-lyrics-on-minibuffer)       ;display lyrics in minibuffer
     ("L" . emms-lyrics-disable)                  ;disable lyrics show in minibuffer
     )
   emms-playlist-mode-map)

  ;; Emms Tag Editor
  (lazy-set-key
   '(("M-p" . emms-tag-editor-prev-same-field)  
     ("M-n" . emms-tag-editor-next-same-field)
     ;;Set TAG to VALUE in all tracks. If transient-mark-mode
     ;;is turned on, you can apply the command to a selected
     ;;region.
     ("C-c a" . emms-tag-editor-set-all+)  
     ("C-c n" . emms-tag-editor-set-tracknumber)
     ("C-c i" . emms-tag-editor-set-tracknumber+))
   emms-tag-editor-mode-map)

  ;; EMMS Browser
  (lazy-set-key
   '(("J" . emms-browser-next-non-track)      
     ("K" . emms-browser-prev-non-track)     
     ("f" . emms-browser-toggle-subitems) 
     ("s" . one-key-menu-emms-browser-search) 
     ("L" . one-key-menu-emms-browser-lookup))
   emms-browser-mode-map)

  ;; EMMS Stream
  (lazy-set-key
   '(("a" . emms-stream-add-bookmark)          ;add
     ("d" . emms-stream-delete-bookmark)       ;delete
     ("E" . emms-stream-edit-bookmark)         ;edit
     ("q" . emms-stream-quit)                  ;quit
     ("S" . emms-stream-save-bookmarks-file)   ;save
     ("t" . emms-stream-toggle-default-action) ;switch
     ("i" . emms-stream-info-bookmark)         ;info
     ("f" . emms-stream-play))                 ;play
   emms-stream-mode-map)

  ;; Global EMMS key bindings
  (lazy-set-key
   '(("C-c o n" . emms-next)
     ("C-c o p" . emms-previous)
     ("C-c o r" . emms-random)
     ("C-c o s" . emms-stop)))

  (setq emms-track-description-function
        'lzy-emms-track-description-function)
  )

(eval-after-load "emms" '(emms-setting))

;;; init-emms.el ends here
