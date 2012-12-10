;;; one-key-config.el --- Configuration for one-key.el

;; Filename: one-key-config.el
;; Description: Configuration for one-key.el
;; Author: Andy Stewart lazycat.manatee@gmail.com
;; Maintainer: Andy Stewart lazycat.manatee@gmail.com
;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.
;; Created: 2008-12-23 18:07:50
;; Version: 0.1
;; Last-Updated: 2008-12-23 18:07:50
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/one-key-config.el
;; Keywords: one-key
;; Compatibility: GNU Emacs 23.0.60.1
;;
;; Features that might be required by this library:
;;
;; `one-key'
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; This package is some example to use `one-key'.
;;

;;; Installation:
;;
;; Put one-key-config.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'one-key-config)
;;
;; No need more.

;;; Change log:
;;
;; 2008/12/23
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

(provide 'one-key-config)

;;; Require
(require 'one-key)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variable ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar my-home-directory "")
(defvar my-mldonkey-download-directory "")
(defvar my-default-download-directory "")
(defvar my-resource-backup-directory "")
(defvar my-book-directory "")
(defvar my-reading-directory "")
(defvar my-translate-png-directory "")
(defvar my-picture-directory "")
(defvar my-lyrics-directory "")
(defvar my-emacs-lisp-package-directory "")
(defvar my-notes-directory "")
(defvar my-emacs-backup-directory "")
(defvar my-screenshots-storage-directory "")
(defvar my-emlue-download-directory "")
(defvar my-elisp-directory "")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Root ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-root-alist nil
  "The `one-key' menu alist for one key root")

(setq one-key-menu-root-alist
      '((("e" . "EMMS") . one-key-menu-emms)
        (("d" . "Directories") . one-key-menu-directory)
        (("w" . "W3m search") . one-key-menu-w3m-search)
        (("t" . "Tools") . one-key-menu-tools)
        (("u" . "UI") . one-key-menu-ui)
        (("i" . "irc") . one-key-menu-irc-channel)
        (("h" . "Help Info") . one-key-menu-help)))

(defun one-key-menu-root ()
  "The `one-key' menu for root"
  (interactive)
  (one-key-menu "Roots" one-key-menu-root-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Tools ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-tools-alist nil
  "The `one-key' menu alist for tools.")

(setq one-key-menu-tools-alist
      '(
        (("g" . "Gtags") . one-key-menu-gtags)
        (("c" . "Cscope") . one-key-menu-cscope)
        (("s" . "Show Hide") . one-key-menu-hideshow)))

(defun one-key-menu-tools ()
  "The `one-key' menu for tools."
  (interactive)
  (one-key-menu "Tools" one-key-menu-tools-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-alist nil
  "The `one-key' menu alist for EMMS.")

(setq one-key-menu-emms-alist
      '(
        (("p" . "Emms play") . one-key-menu-emms-main)
        (("s" . "Emms playlist browser search") . one-key-menu-emms-browser-search)
        (("l" . "Emms playlist Browser lookup") . one-key-menu-emms-browser-lookup)))

(defun one-key-menu-emms ()
  "The `one-key' menu for EMMS."
  (interactive)
  (one-key-menu "EMMS" one-key-menu-emms-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS main menu ;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-main-alist nil
  "The `one-key' main menu alist for EMMS.")

(setq one-key-menu-emms-main-alist
      '(
        (("u" . "Play Now") . emms-play-now)
        (("h" . "Play emms history") . emms-history-load)
        (("d" . "Play Directory Tree") . emms-play-directory-tree)
        (("t" . "Add Directory Tree") . emms-add-directory-tree)
        (("f" . "Play File") . emms-play-file)
        (("g" . "Playlist Go") . emms-playlist-mode-go)
        (("i" . "Play Playlist") . emms-play-playlist)
        (("m" . "Play Matching") . emms-play-matching)
        (("c" . "Toggle Repeat Track") . emms-toggle-repeat-track)
        (("v" . "Jump To File") . emms-jump-to-file)
        (("w" . "Toggle Repeat Playlist") . emms-toggle-repeat-playlist)
        (("z" . "Show") . emms-show)
        (("l" . "Lyrics Toggle Show") . emms-lyrics-toggle-display-on-minibuffer)
        (("r" . "Lyrics Re download") . emms-lyrics-redownload-lyric)
        (("e" . "Lyrics Visit") . emms-lyrics-visit-lyric)
        (("s" . "Emms Streams") . emms-streams)
        (("b" . "Emms Browser") . emms-browser)
        (("p" . "Anything Playlist") . anything-emms-playlist)
        (("o" . "Anything Directory") . anything-emms-directory)
        (("a" . "Anything File") . anything-emms-file)
        ))

(defun one-key-menu-emms-main ()
  "The `one-key' main menu for EMMS."
  (interactive)
  (one-key-menu "EMMS main" one-key-menu-emms-main-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS Playlist Sort ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-playlist-sort-alist nil
  "The `one-key' menu alist for EMMS-PLAYLIST-SORT.")

(setq one-key-menu-emms-playlist-sort-alist
      '(
        (("h" . "Shuffle") . emms-shuffle)
        (("n" . "Name") . emms-playlist-sort-by-name)
        (("t" . "Title") . emms-playlist-sort-by-info-title)
        (("a" . "Artist") . emms-playlist-sort-by-info-artist)
        (("b" . "Album") . emms-playlist-sort-by-info-album)
        (("y" . "Year") . emms-playlist-sort-by-info-year)
        (("e" . "Note") . emms-playlist-sort-by-info-note)
        (("s" . "Score") . emms-playlist-sort-by-score)
        (("i" . "List") . emms-playlist-sort-by-list)
        (("o" . "Natural Order") . emms-playlist-sort-by-natural-order)
        (("l" . "Last Played") . emms-playlist-sort-by-last-played)
        (("c" . "Play Count") . emms-playlist-sort-by-play-count)
        ))

(defun one-key-menu-emms-playlist-sort ()
  "The `one-key' menu for EMMS-PLAYLIST-SORT."
  (interactive)
  (one-key-menu "EMMS-PLAYLIST-SORT" one-key-menu-emms-playlist-sort-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS Browser Search ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-browser-search-alist nil
  "The `one-key' menu alist for EMMS-BROWSER-SEARCH.")

(setq one-key-menu-emms-browser-search-alist
      '(
        (("a" . "Search Artist") . emms-browser-search-by-artist)
        (("b" . "Search Album") . emms-browser-search-by-album)
        (("c" . "Search Composer") . emms-browser-search-by-composer)
        (("n" . "Search Name") . emms-browser-search-by-names)
        (("p" . "Search Performer") . emms-browser-search-by-performer)
        (("t" . "Search Title") . emms-browser-search-by-title)
        ))

(defun one-key-menu-emms-browser-search ()
  "The `one-key' menu for EMMS-BROWSER-SEARCH."
  (interactive)
  (one-key-menu "EMMS-BROWSER-SEARCH" one-key-menu-emms-browser-search-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS Browser Lookup ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-browser-lookup-alist nil
  "The `one-key' menu alist for EMMS-BROWSER-LOOKUP.")

(setq one-key-menu-emms-browser-lookup-alist
      '(
        (("b" . "Lookup Album Pitchfork") . EMMS-browser-lookup-album-on-pitchfork)
        (("p" . "Lookup Performer Pitchfork") . emms-browser-lookup-performer-on-pitchfork)
        (("c" . "Lookup Composer Pitchfork") . emms-browser-lookup-composer-on-pitchfork)
        (("a" . "Lookup Artist Pitchfork") . emms-browser-lookup-artist-on-pitchfork)
        (("B" . "Lookup Album Wikipedia") . emms-browser-lookup-album-on-wikipedia)
        (("P" . "Lookup Performer Wikipedia") . emms-browser-lookup-performer-on-wikipedia)
        (("C" . "Lookup Composer Wikipedia") . emms-browser-lookup-composer-on-wikipedia)
        (("A" . "Lookup Artist Wikipeda") . emms-browser-lookup-artist-on-wikipedia)
        ))

(defun one-key-menu-emms-browser-lookup ()
  "The `one-key' menu for EMMS-BROWSER-LOOKUP."
  (interactive)
  (one-key-menu "EMMS-BROWSER-LOOKUP" one-key-menu-emms-browser-lookup-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Gtags ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-gtags-alist nil
  "The `one-key' menu alist for GTAGS.")

(setq one-key-menu-gtags-alist
      '(
        (("," . "Find Tag Define") . xgtags-find-tag-from-here)
        (("." . "Find Tag Reference (No Prompt)") . xgtags-find-rtag-no-prompt)
        ((">" . "Find Tag Reference") . xgtags-find-rtag)
        (("t" . "Search Tag Define") . xgtags-find-tag)
        (("s" . "Find Symbol") . xgtags-find-symbol)
        (("p" . "Find Pattern") . xgtags-find-pattern)
        (("/" . "Pop Stack") . xgtags-pop-stack)
        (("b" . "Switch Current Window") . xgtags-switch-to-buffer)
        (("o" . "Switch Other Window") . xgtags-switch-to-buffer-other-window)
        (("x" . "Parse File") . xgtags-parse-file)
        (("f" . "Find File") . xgtags-find-file)
        (("g" . "Find With Grep") . xgtags-find-with-grep)
        (("i" . "Find With Idutils") . xgtags-find-with-idutils)
        (("m" . "Make Complete List") . xgtags-make-complete-alist)
        (("q" . "Query Replace Regexp") . xgtags-query-replace-regexp)
        (("v" . "Visit Root Directory") . xgtags-visit-rootdir)
        (("r" . "Return Window") . xgtags-select-tag-return-window)))

(defun one-key-menu-gtags ()
  "The `one-key' menu for GTAGS."
  (interactive)
  (one-key-menu "GTAGS" one-key-menu-gtags-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hideshow ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-hideshow-alist nil
  "The `one-key' menu alist for HIDESHOW.")

(setq one-key-menu-hideshow-alist
      '(
        (("e" . "Show Block") . hs-show-block)
        (("h" . "Hide Block") . hs-hide-block)
        (("c" . "Toggle Hiding") . hs-toggle-hiding)
        (("E" . "Show All") . hs-show-all)
        (("H" . "Hide All") . hs-hide-all)
        (("i" . "Hide #ifdef Block") . hide-ifdef-block)
        (("s" . "Show #ifdef Block") . show-ifdef-block)
        (("I" . "Hide #ifdef Block") . hide-ifdefs)
        (("S" . "Show #ifdef Block") . show-ifdefs)))

(defun one-key-menu-hideshow ()
  "The `one-key' menu for HIDESHOW."
  (interactive)
  (one-key-menu "HIDESHOW" one-key-menu-hideshow-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Festival ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-festival-alist nil
  "The `one-key' menu alist for FESTIVAL.")

(setq one-key-menu-festival-alist
      '(
        (("s" . "Stop") . festival-stop)
        (("a" . "Say") . festival-say)
        (("f" . "Read File") . festival-read-file)
        (("b" . "Read Buffer") . festival-read-buffer)
        (("r" . "Read Region") . festival-read-region)
        (("w" . "Read Word") . festival-read-word)))

(defun one-key-menu-festival ()
  "The `one-key' menu for FESTIVAL."
  (interactive)
  (one-key-menu "FESTIVAL" one-key-menu-festival-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; UI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-ui-alist nil
  "The `one-key' menu alist for UI.")

(setq one-key-menu-ui-alist
      '(
        (("t" . "Tool-Bar") . tool-bar-mode)
        (("m" . "Menu-Bar") . menu-bar-mode)
        (("c" . "Scroll-Bar") . scroll-bar-mode)))

(defun one-key-menu-ui ()
  "The `one-key' menu for UI."
  (interactive)
  (one-key-menu "UI" one-key-menu-ui-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Open Directory ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-directory-alist nil
  "The `one-key' menu alist for DIRECTORY.")

(setq one-key-menu-directory-alist
      '(
        (("h" . "Home") . (lambda () (interactive) (dired-x-find-file my-home-directory)))
        (("e" . "Emacs Backup") . (lambda () (interactive) (dired-x-find-file my-emacs-backup-directory)))
        (("d" . "Download") . (lambda () (interactive) (dired-x-find-file my-default-download-directory)))
        (("b" . "Book") . (lambda () (interactive) (dired-x-find-file my-book-directory)))
        (("i" . "Image") . (lambda () (interactive) (dired-x-find-file my-picture-directory)))
        (("p" . "Emacs Package") . (lambda () (interactive) (dired-x-find-file my-emacs-lisp-package-directory)))
        (("k" . "Mldonkey") . (lambda () (interactive) (dired-x-find-file my-mldonkey-download-directory)))
        (("m" . "Music") . (lambda () (interactive) (dired-x-find-file emms-source-file-default-directory)))
        (("s" . "Screenshots") . (lambda () (interactive) (dired-x-find-file my-screenshots-storage-directory)))
        (("r" . "Resource Backup") . (lambda () (interactive) (dired-x-find-file my-resource-backup-directory)))
        (("n" . "Notes") . (lambda () (interactive) (dired-x-find-file my-notes-directory)))
        (("x" . "Reading") . (lambda () (interactive) (dired-x-find-file my-reading-directory)))
        (("l" . "Lyrics") . (lambda () (interactive) (dired-x-find-file my-lyrics-directory)))
        (("u" . "Emule") . (lambda () (interactive) (dired-x-find-file my-emlue-download-directory)))
        (("z" . "Elisp") . (lambda () (interactive) (dired-x-find-file my-elisp-directory)))
        ))

(defun one-key-menu-directory ()
  "The `one-key' menu for DIRECTORY."
  (interactive)
  (one-key-menu "DIRECTORY" one-key-menu-directory-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Cscope ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-cscope-alist nil
  "The `one-key' menu alist for CSCOPE.")

(setq one-key-menu-cscope-alist
      '(
        (("s" . "This Symbol") . cscope-find-this-symbol)
        (("d" . "Definition Prompt") . cscope-find-global-definition)
        (("g" . "Definition No Prompt") . cscope-find-global-definition-no-prompting)
        (("f" . "This File") . cscope-find-this-file)
        (("i" . "Including This File") . cscope-find-files-including-file)
        (("c" . "Calling This Function") . cscope-find-functions-calling-this-function)
        (("e" . "This Function Called") . cscope-find-called-functions)
        (("p" . "Pattern") . cscope-find-egrep-pattern)
        (("t" . "This String") . cscope-find-this-text-string)))

(defun one-key-menu-cscope ()
  "The `one-key' menu for CSCOPE."
  (interactive)
  (one-key-menu "CSCOPE" one-key-menu-cscope-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; W3m Search ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-w3m-search-alist nil
  "The `one-key' menu alist for W3M-SEARCH.")

(setq one-key-menu-w3m-search-alist
      '(
        (("L" . "Google Lucky") . w3m-search-google-lucky)
        (("s" . "Google Web CN") . w3m-search-google-web-cn)
        (("e" . "Google Web EN") . w3m-search-google-web-en)
        (("t" . "Google News Sci/Tech CN") . w3m-search-google-news-cn-Sci/Tech)
        (("T" . "Google News Sci/Tech EN") . w3m-search-google-news-en-Sci/Tech)
        (("b" . "Google Blog CN") . w3m-search-google-blog-cn)
        (("B" . "Google Blog EN") . w3m-search-google-blog-en)
        (("f" . "Google File") . w3m-search-google-file)
        (("i" . "Google Image") . w3m-search-google-image)
        (("c" . "Google Code") . w3m-search-google-code)
        (("g" . "Google Group") . w3m-search-google-group)
        (("k" . "Google Desktop") . w3m-search-google-desktop)
        (("o" . "Gmail") . w3m-auto-logon-gmail)
        (("w" . "Emacs Wiki") . w3m-search-emacswiki)
        (("r" . "Emacs Wiki Random") . w3m-search-emacswiki-random)
        (("h" . "Haskell Wiki") . w3m-search-haskell-wiki)
        (("u" . "Haskell Hoogle") . w3m-search-haskell-hoogle)
        (("m" . "BaiDu MP3") . w3m-search-baidu-mp3)
        (("d" . "Dict CN") . w3m-search-dict-cn)
        (("l" . "Lispdoc Basic") . w3m-search-lispdoc-basic)
        (("L" . "Lispdoc Full") . w3m-search-lispdoc-full)
        ((";" . "Slang") . w3m-search-slang)
        (("a" . "Answer") . w3m-search-answers)
        (("p" . "Wikipedia CN") . w3m-search-wikipedia-cn)
        (("P" . "Wikipedia EN") . w3m-search-wikipedia-en)
        (("n" . "RFC Number") . w3m-search-rfc-number)
        (("y" . "Insert Default Input") . w3m-search-advance-insert-search-object)
        ))

(defun one-key-menu-w3m-search ()
  "The `one-key' menu for W3M-SEARCH."
  (interactive)
  (one-key-menu "W3M-SEARCH" one-key-menu-w3m-search-alist t nil nil
                '(lambda ()
                   (interactive)
                   (unless (eq major-mode 'w3m-mode)
                     (w3m)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Etags ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-etags-alist nil
  "The `one-key' menu alist for ETAGS.")

(setq one-key-menu-etags-alist
      '(
        (("G" . "Generate Tag Table") . generate-tag-table-of-emacs)
        (("w" . "Find Tag Window") . find-tag-window)
        (("W" . "Find Tag Window Small") . release-small-tag-window)
        (("," . "Find Tag+") . find-tag+)
        (("." . "Find Tag") . find-tag)
        (("p" . "Pop Tag Mark") . pop-tag-mark)
        (("r" . "Find Tag Regexp") . find-tag-regexp)
        (("s" . "Tags Search") . tags-search)
        (("Q" . "Tags Query Replace") . tags-query-replace)
        ))

(defun one-key-menu-etags ()
  "The `one-key' menu for ETAGS."
  (interactive)
  (one-key-menu "ETAGS" one-key-menu-etags-alist t t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Thing-Edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-thing-edit-alist nil
  "The `one-key' menu alist for THING-EDIT.")

(setq one-key-menu-thing-edit-alist
      '(
        ;; Copy.
        (("w" . "Copy Word") . thing-copy-word)
        (("s" . "Copy Symbol") . thing-copy-symbol)
        (("m" . "Copy Email") . thing-copy-email)
        (("f" . "Copy Filename") . thing-copy-filename)
        (("u" . "Copy URL") . thing-copy-url)
        (("x" . "Copy Sexp") . thing-copy-sexp)
        (("g" . "Copy Page") . thing-copy-page)
        (("t" . "Copy Sentence") . thing-copy-sentence)
        (("o" . "Copy Whitespace") . thing-copy-whitespace)
        (("i" . "Copy List") . thing-copy-list)
        (("c" . "Copy Comment") . thing-copy-comment)
        (("h" . "Copy Function") . thing-copy-defun)
        (("p" . "Copy Parentheses") . thing-copy-parentheses)
        (("l" . "Copy Line") . thing-copy-line)
        (("a" . "Copy To Line Begin") . thing-copy-to-line-beginning)
        (("e" . "Copy To Line End") . thing-copy-to-line-end)
        ;; Copy.
        (("W" . "Paste Word") . thing-paste-word)
        (("S" . "Paste Symbol") . thing-paste-symbol)
        (("M" . "Paste Email") . thing-paste-email)
        (("F" . "Paste Filename") . thing-paste-filename)
        (("U" . "Paste URL") . thing-paste-url)
        (("X" . "Paste Sexp") . thing-paste-sexp)
        (("G" . "Paste Page") . thing-paste-page)
        (("T" . "Paste Sentence") . thing-paste-sentence)
        (("O" . "Paste Whitespace") . thing-paste-whitespace)
        (("I" . "Paste List") . thing-paste-list)
        (("C" . "Paste Comment") . thing-paste-comment)
        (("H" . "Paste Function") . thing-paste-defun)
        (("P" . "Paste Parentheses") . thing-paste-parentheses)
        (("L" . "Paste Line") . thing-paste-line)
        (("A" . "Paste To Line Begin") . thing-paste-to-line-beginning)
        (("E" . "Paste To Line End") . thing-paste-to-line-end)
        ))

(defun one-key-menu-thing-edit ()
  "The `one-key' menu for THING-EDIT."
  (interactive)
  (one-key-menu "THING-EDIT" one-key-menu-thing-edit-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Paredit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-paredit-alist nil
  "The `one-key' menu alist for PAREDIT.")

(setq one-key-menu-paredit-alist
      '(
        ;; Wrap.
        (("h" . "Wrap Left Object") . paredit-backward-slurp-sexp)
        (("l" . "Wrap Right Object") . paredit-forward-slurp-sexp)
        ;; Free.
        (("," . "Free Left Object") . paredit-backward-barf-sexp)
        (("." . "Free Right Object") . paredit-forward-barf-sexp)
        ;; Remove.
        (("<" . "Remove Paren And Left Object") . paredit-splice-sexp-killing-backward)
        ((">" . "Remove Paren And Right Object") . paredit-splice-sexp-killing-forward)
        ;; Join or Split.
        (("j" . "Join Sexps") . paredit-join-sexps)
        (("k" . "Split Sexps") . paredit-split-sexp)
        (("n" . "Join next list") . paredit-join-with-next-list)
        (("p" . "Join previous list") . paredit-join-with-previous-list)
        (("N" . "Add next list") . paredit-add-to-next-list)
        (("P" . "Add previous list") . paredit-add-to-previous-list)
        ;; Move.
        (("u" . "Move list forward") . paredit-move-list-forward)
        (("i" . "Move list backward") . paredit-move-list-backward)
        ))

(defun one-key-menu-paredit ()
  "The `one-key' menu for PAREDIT."
  (interactive)
  (one-key-menu "PAREDIT" one-key-menu-paredit-alist t t nil nil t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Irc-Channel ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-irc-channel-alist nil
  "The `one-key' menu alist for IRC-CHANNEL.")

(setq one-key-menu-irc-channel-alist
      '(
        (("l" . "login irc") . (lambda () (interactive (irc-login))))
        (("e" . "#emacs") . (lambda () (interactive) (switch-to-buffer "#emacs")))
        (("c" . "#emacs-cn") . (lambda () (interactive) (switch-to-buffer "#emacs-cn")))
        (("h" . "#haskell") . (lambda () (interactive) (switch-to-buffer "#haskell")))
        (("x" . "#xmonad") . (lambda () (interactive) (switch-to-buffer "#xmonad")))
        (("l" . "#lisp") . (lambda () (interactive) (switch-to-buffer "#lisp")))
        (("d" . "#debian") . (lambda () (interactive) (switch-to-buffer "#debian")))
        (("z" . "#zsh") . (lambda () (interactive) (switch-to-buffer "#zsh")))
        ))

(defun one-key-menu-irc-channel ()
  "The `one-key' menu for IRC-CHANNEL."
  (interactive)
  (one-key-menu "IRC-CHANNEL" one-key-menu-irc-channel-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Help ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-help-alist nil
  "The `one-key' menu alist for help.")

(setq one-key-menu-help-alist
      '(
        ;; Apropos.
        (("z" . "Apropos") . apropos)
        (("{" . "Apropos Library") . apropos-library)
        (("\"" . "Apropos Value") . apropos-value)
        (("C" . "Apropos Command") . apropos-command)
        (("F" . "Apropos Function") . apropos-function)
        (("V" . "Apropos Variable") . apropos-variable)
        (("O" . "Apropos Option") . apropos-option)
        (("a" . "Apropos Command") . apropos-command)
        (("d" . "Apropos Documentation") . apropos-documentation)
        ;; Describe.
        (("/" . "Describe Input Method") . describe-input-method)
        (("f" . "Describe Function") . describe-function)
        (("g" . "Describe Gnu Project") . describe-gnu-project)
        (("h" . "Describe Hash") . describe-hash)
        (("b" . "Describe Bindings") . describe-bindings)
        (("c" . "Describe Command") . describe-command)
        (("m" . "Describe Mode") . describe-mode)
        (("k" . "Describe Key") . describe-key)
        (("K" . "Describe Key Briefly") . describe-key-briefly)
        (("o" . "Describe Option") . describe-option)
        (("p" . "Describe Char") . describe-char)
        (("s" . "Describe Syntax") . describe-syntax)
        (("u" . "Describe Unbound Keys") . describe-unbound-keys)
        (("v" . "Describe Variable") . describe-variable)
        (("L" . "Describe Language Environment") . describe-language-environment)
        (("w" . "Describe No Warranty") . describe-no-warranty)
        (("M-f" . "Describe Face") . describe-face)
        (("M-c" . "Describe Copying") . describe-copying)
        (("M-f" . "Describe File") . describe-file)
        (("M-k" . "Describe Keymap") . describe-keymap)
        (("M-t" . "Describe Option Of Type") . describe-option-of-type)
        ;; Info.
        (("M-i" . "Info") . info)
        (("M-o" . "Info Other Window") . info-other-window)
        (("M-s" . "Info Lookup Symbol") . info-lookup-symbol)
        (("M-k" . "Info Goto Emacs Key Command Node") . Info-goto-emacs-key-command-node)
        (("M-m" . "Info Emacs Manual") . info-emacs-manual)
        ;; Xray.
        (("M-B" . "Xray Help Buffer") . xray-help-buffer)
        (("M-S" . "Xray Help Symbol") . xray-help-symbol)
        (("M-W" . "Xray Help Window") . xray-help-window)
        (("M-H" . "Xray Help Hooks") . xray-help-hooks)
        (("M-M" . "Xray Help Marker") . xray-help-marker)
        (("M-O" . "Xray Help Overlay") . xray-help-overlay)
        (("M-P" . "Xray Help Position") . xray-help-position)
        (("M-E" . "Xray Help Screen") . xray-help-screen)
        (("M-Z" . "Xray Help Frame") . xray-help-frame)
        (("M-X" . "Xray Help Features") . xray-help-features)
        (("M-C" . "Xray Help Faces") . xray-help-faces)
        ;; View.
        (("C-d" . "View Emacs Debugging") . view-emacs-debugging)
        (("C-e" . "View External Packages") . view-external-packages)
        (("C-f" . "View Emacs FAQ") . view-emacs-FAQ)
        (("C-n" . "View Emacs News") . view-emacs-news)
        (("C-p" . "View Emacps Problems") . view-emacs-problems)
        (("C-t" . "View Emacs Todo") . view-emacs-todo)
        (("C-r" . "View Order Manuals") . view-order-manuals)
        (("C-E" . "View Echo Area Messages") . view-echo-area-messages)
        (("C-l" . "View Lossage") . view-lossage)
        (("C-n" . "View Emacs News") . view-emacs-news)
        ;; Misc.
        (("C-P" . "Finder By Keyword") . finder-by-keyword)
        (("C-u" . "Display Local Help") . display-local-help)
        (("C-a" . "About Emacs") . about-emacs)
        (("C-h" . "Help For Help") . help-for-help)
        (("C-H" . "Help With Tutorial") . help-with-tutorial)
        (("C-z" . "Sys Apropos") . sys-apropos)
        (("C-w" . "Where Is") . where-is)
        (("x" . "Find Function On Key") . find-function-on-key)
        ))

(defun one-key-menu-help ()
  "The `one-key' menu for help."
  (interactive)
  (one-key-menu "help" one-key-menu-help-alist t nil nil nil t))

;;; one-key-config.el ends here
