;; -*- Emacs-Lisp -*-
;;; LzyTheme.el ---
;; Time-stamp: <2013-04-16 15:48:21 Tuesday by lzy>

;; Copyright (C) 2013 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@gmail.com>
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
;;   (require 'LzyTheme)

;;; Code:

(eval-when-compile
  (require 'color-theme))

(defun my-color-theme ()
  "Color theme by zhengyu li, created 2013-03-29."
  (interactive)
  (color-theme-install
   '(my-color-theme
     ((background-color . "black")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "Springgreen")
      (foreground-color . "white")
      (mouse-color . "black"))
     ((curchg-default-cursor-color . "Springgreen")
      (curchg-input-method-cursor-color . "Orange")
      (hl-line-face :background "grey5")
      (hl-sexp-background-color . "#002011"))
     (ac-candidate-face ((t (:background "grey80" :foreground "black"))))
     (ac-completion-face ((t (:foreground "white"))))
     (ac-selection-face ((t (:background "blue" :foreground "grey90"))))
     (ac-yasnippet-candidate-face ((t (:background "yellow" :foreground "black"))))
     (ac-yasnippet-selection-face ((t (:background "DarkRed" :foreground "white"))))
     (apropos-function-button ((t (:foreground "Steelblue1"))))
     (apropos-keybinding ((t (:underline t))))
     (apropos-misc-button ((t (:foreground "SkyBlue"))))
     (apropos-property ((t (:foreground "green"))))
     (apropos-symbol ((t (:bold t :foreground "red" :weight bold))))
     (apropos-variable-button ((t (:foreground "orange"))))
     (buffer-menu-buffer ((t (:bold t :weight bold))))
     (button ((t (:underline t :foreground "red"))))
     (cal-china-x-general-holiday-face ((t (:background "green"))))
     (cal-china-x-important-holiday-face ((t (:background "red"))))
     (calendar-today ((t (:underline t))))
     (change-log-acknowledgment ((t (:foreground "Firebrick"))))
     (change-log-conditionals ((t (:foreground "sienna"))))
     (change-log-date ((t (:foreground "VioletRed4"))))
     (change-log-email ((t (:foreground "sienna"))))
     (change-log-file ((t (:foreground "Blue1"))))
     (change-log-function ((t (:foreground "sienna"))))
     (change-log-list ((t (:foreground "Purple"))))
     (change-log-name ((t (:foreground "dark cyan"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "medium blue"))))
     (compilation-column-number ((t (:foreground "VioletRed4"))))
     (compilation-error ((t (:bold t :weight bold :foreground "Red1"))))
     (compilation-info ((t (:bold t :weight bold :foreground "ForestGreen"))))
     (compilation-line-number ((t (:foreground "Purple"))))
     (compilation-mode-line-exit ((t (:bold t :foreground "ForestGreen" :weight bold))))
     (compilation-mode-line-fail ((t (:bold t :foreground "Red1" :weight bold))))
     (compilation-mode-line-run ((t (:bold t :foreground "DarkOrange" :weight bold))))
     (compilation-warning ((t (:bold t :weight bold :foreground "DarkOrange"))))
     (completions-annotations ((t (:italic t :slant italic))))
     (completions-common-part ((t (:foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "black" :background "white" :stipple nil :height 110))))
     (completions-first-difference ((t (:bold t :weight bold))))
     (cscope-file-face ((t (:foreground "DeepSkyBlue"))))
     (cscope-function-face ((t (:foreground "magenta"))))
     (cscope-line-face ((t (:foreground "grey80"))))
     (cscope-line-number-face ((t (:foreground "red"))))
     (cscope-mouse-face ((t (:background "blue" :foreground "white"))))
     (custom-button ((t (:background "DarkRed" :foreground "white" :box (:line-width 1 :style released-button)))))
     (custom-button-mouse ((t (:background "DarkRed" :foreground "yellow" :box (:line-width 1 :style released-button)))))
     (custom-button-pressed ((t (:background "DarkRed" :foreground "white" :box (:line-width 1 :style pressed-button)))))
     (custom-button-pressed-unraised ((t (:foreground "violet" :underline t))))
     (custom-button-unraised ((t (:underline t))))
     (custom-changed ((t (:background "blue1" :foreground "white"))))
     (custom-comment ((t (:background "grey10" :foreground "green"))))
     (custom-comment-tag ((t (:foreground "gray80"))))
     (custom-documentation ((t (nil))))
     (custom-face-tag ((t (:foreground "gold" :underline t))))
     (custom-group-tag ((t (:foreground "gold" :underline t :height 1.2))))
     (custom-group-tag-1 ((t (:foreground "pink" :height 1.2))))
     (custom-invalid ((t (:background "red1" :foreground "yellow1"))))
     (custom-link ((t (:foreground "cyan1" :underline t))))
     (custom-modified ((t (:background "blue1" :foreground "white"))))
     (custom-rogue ((t (:background "black" :foreground "pink"))))
     (custom-saved ((t (:underline t))))
     (custom-set ((t (:background "white" :foreground "blue1"))))
     (custom-state ((t (:foreground "lime green"))))
     (custom-themed ((t (:background "blue1" :foreground "white"))))
     (custom-variable-button ((t (:underline t))))
     (custom-variable-tag ((t (:foreground "gold" :underline t))))
     (custom-visibility ((t (:foreground "cyan1" :underline t :height 0.8))))
     (diary ((t (:foreground "red1"))))
     (dired-directory ((t (:foreground "#00a8ff" :height 1.05))))
     (dired-flagged ((t (:foreground "red" :height 1.05))))
     (dired-header ((t (:foreground "red2" :height 1.05))))
     (dired-ignored ((t (:foreground "white" :height 1.05))))
     (dired-mark ((t (:foreground "DeepPink"))))
     (dired-marked ((t (:foreground "yellow" :height 1.05))))
     (dired-perm-write ((t (:foreground "red" :height 1.05))))
     (dired-symlink ((t (:foreground "grey60" :height 1.05))))
     (dired-warning ((t (:foreground "gold" :height 1.05))))
     (dired-filetype-common ((t (:foreground "Peru" :height 1.05))))
     (dired-filetype-compress ((t (:foreground "DeepPink" :height 1.05))))
     (dired-filetype-document ((t (:foreground "gold" :height 1.05))))
     (dired-filetype-execute ((t (:foreground "red" :height 1.05))))
     (dired-filetype-image ((t (:foreground "MediumPurple" :height 1.05))))
     (dired-filetype-lnk ((t (:foreground "yellow" :height 1.05))))
     (dired-filetype-music ((t (:foreground "orange" :height 1.05))))
     (dired-filetype-omit ((t (:foreground "grey50" :height 1.05))))
     (dired-filetype-plain ((t (:foreground "springgreen" :height 1.05))))
     (dired-filetype-source ((t (:foreground "green" :height 1.05))))
     (dired-filetype-video ((t (:foreground "DeepPink" :height 1.05))))
     (dired-filetype-xml ((t (:foreground "Chocolate" :height 1.05))))
     (dropdown-list-face ((t (:background "lightyellow" :foreground "black"))))
     (dropdown-list-selection-face ((t (:background "DarkRed" :foreground "white"))))
     (ediff-current-diff-A ((t (:background "blue1" :foreground "white"))))
     (ediff-current-diff-Ancestor ((t (:background "VioletRed" :foreground "Black"))))
     (ediff-current-diff-B ((t (:background "SpringGreen1" :foreground "black"))))
     (ediff-current-diff-C ((t (:background "Pink" :foreground "Navy"))))
     (ediff-even-diff-A ((t (:background "light grey" :foreground "Black"))))
     (ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "Black"))))
     (ediff-even-diff-B ((t (:background "Grey" :foreground "Black"))))
     (ediff-even-diff-C ((t (:background "Grey" :foreground "Black"))))
     (ediff-fine-diff-A ((t (:background "blue1" :foreground "white"))))
     (ediff-fine-diff-Ancestor ((t (:background "Green" :foreground "white"))))
     (ediff-fine-diff-B ((t (:background "SpringGreen1" :foreground "black"))))
     (ediff-fine-diff-C ((t (:background "Pink" :foreground "Navy"))))
     (ediff-odd-diff-A ((t (:background "Grey" :foreground "black"))))
     (ediff-odd-diff-Ancestor ((t (:background "gray40" :foreground "cyan3"))))
     (ediff-odd-diff-B ((t (:background "Grey" :foreground "Black"))))
     (ediff-odd-diff-C ((t (:background "Grey" :foreground "black"))))
     (ediff-trees-deleted-original-face ((t (:background "Pink"))))
     (eldoc-highlight-function-argument ((t (:foreground "Red"))))
     (emms-browser-album-face ((t (:foreground "Deep Pink" :height 1.1))))
     (emms-browser-artist-face ((t (:foreground "Springgreen" :height 1.2))))
     (emms-browser-composer-face ((t (:foreground "#aaaaff" :height 1.3))))
     (emms-browser-performer-face ((t (:foreground "#aaaaff" :height 1.3))))
     (emms-browser-track-face ((t (:foreground "orchid2" :height 1.0))))
     (emms-browser-year/genre-face ((t (:foreground "#aaaaff" :height 1.5))))
     (emms-metaplaylist-mode-current-face ((t (:foreground "red2"))))
     (emms-metaplaylist-mode-face ((t (:foreground "red3"))))
     (emms-playlist-selected-face ((t (:foreground "DeepPink1"))))
     (emms-playlist-mark-face ((t (:foreground "red2"))))
     (emms-playlist-track-face ((t (:foreground "green2"))))
     (emms-stream-name-face ((t (:bold t :weight bold))))
     (emms-stream-url-face ((t (:foreground "LightSteelBlue"))))
     (error ((t (:bold t :foreground "Red1" :weight bold))))
     (escape-glyph ((t (:foreground "cyan"))))
     (ffap ((t (:background "DarkRed" :foreground "White"))))
     (file-name-shadow ((t (:foreground "grey70"))))
     (font-lock-builtin-face ((t (:foreground "green"))))
     (font-lock-comment-delimiter-face ((t (:slant italic :foreground "red" :height 1.05))))
     (font-lock-comment-face ((t (:slant italic :foreground "red" :height 1.05))))
     (font-lock-constant-face ((t (:foreground "pink"))))
     (font-lock-doc-face ((t (:foreground "orange"))))
     (font-lock-function-name-face ((t (:foreground "red" :weight normal :height 1.25))))
     (font-lock-keyword-face ((t (:foreground "green"))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "yellow" :height 1.05))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
     (font-lock-string-face ((t (:foreground "orange"))))
     (font-lock-type-face ((t (:foreground "#0080ff" :weight semi-bold))))
     (font-lock-variable-name-face ((t (:foreground "cyan"))))
     (font-lock-warning-face ((t (:bold t :foreground "yellow3" :weight bold))))
     (fringe ((t (:background "grey2"))))
     (glyphless-char ((t (:height 0.6))))
     (header-line ((t (:foreground "red"))))
     (help-argument-name ((t (:italic t :slant italic))))
     (hideshowvis-hidable-face ((t (:foreground "red2" :box 1))))
     (highlight ((t (:background "DarkRed" :foreground "White"))))
     (highlight-cl ((t (:foreground "cyan"))))
     (highlight-cl-and-other ((t (:foreground "cyan"))))
     (highlight-cl-macro ((t (:underline nil))))
     (highlight-symbol-face ((t (:foreground "yellow" :height 1.1))))
     (hl-paren-face ((t (nil))))
     (hl-sexp-face ((t (nil))))
     (hlt-property-highlight ((t (:background "Wheat"))))
     (holiday ((t (:background "pink"))))
     (hs-face ((t (:background "red4" :foreground "grey95" :box (:line-width 1 :color "red4" :style released-button)))))
     (hs-fringe-face ((t (:background "red4" :foreground "grey95" :box (:line-width 1 :color "red4" :style released-button)))))
     (icompletep-choices ((t (:foreground "yellow"))))
     (icompletep-determined ((t (:foreground "SeaGreen"))))
     (icompletep-keys ((t (:foreground "Red"))))
     (icompletep-nb-candidates ((t (:foreground "SpringGreen"))))
     (ido-first-match ((t (:foreground "DeepPink"))))
     (ido-incomplete-regexp ((t (:foreground "red"))))
     (ido-indicator ((t (:foreground "SteelBlue1"))))
     (ido-only-match ((t (:foreground "ForestGreen"))))
     (ido-subdir ((t (:foreground "SteelBlue1"))))
     (ido-virtual ((t (:foreground "RoyalBlue1"))))
     (ido-subdir ((t (:foreground "SteelBlue1"))))
     (ifdef-highlight-face1 ((t (:background "paleturquoise4"))))
     (ifdef-highlight-face2 ((t (:background "paleGreen3"))))
     (ifdef-highlight-face3 ((t (:background "yellow4"))))
     (ifdef-highlight-face4 ((t (:background "pink4"))))
     (info-command-ref-item ((t (:background "DimGray" :foreground "#7474FFFF7474"))))
     (info-file ((t (:background "Black" :foreground "Blue"))))
     (info-function-ref-item ((t (:background "DimGray" :foreground "#4D4DDDDDDDDD"))))
     (info-header-node ((t (:italic t :foreground "white" :slant italic :weight normal))))
     (info-header-xref ((t (:foreground "cyan1" :underline t))))
     (info-macro-ref-item ((t (:background "DimGray" :foreground "Yellow"))))
     (info-menu ((t (:foreground "DarkRed"))))
     (info-menu-header ((t (:foreground "khaki3"))))
     (info-menu-star ((t (:foreground "red1"))))
     (info-node ((t (:italic t :foreground "white" :slant italic :weight normal))))
     (info-quoted-name ((t (:foreground "Purple"))))
     (info-reference-item ((t (:background "DimGray"))))
     (info-single-quote ((t (:foreground "Green" :weight normal :height 1.05))))
     (info-special-form-ref-item ((t (:background "DimGray" :foreground "Yellow"))))
     (info-string ((t (:foreground "Grey50"))))
     (info-syntax-class-item ((t (:background "DimGray" :foreground "#FFFF9B9BFFFF"))))
     (info-title-1 ((t (:foreground "Gold" :weight normal :height 1.3310000000000004))))
     (info-title-2 ((t (:foreground "red" :weight normal :height 1.2100000000000002))))
     (info-title-3 ((t (:foreground "DodgerBlue" :weight normal :height 1.1))))
     (info-title-4 ((t (:foreground "Green" :weight normal))))
     (info-user-option-ref-item ((t (:background "DimGray" :foreground "Red"))))
     (info-variable-ref-item ((t (:background "DimGray" :foreground "Orange"))))
     (info-xref ((t (:foreground "cyan1" :underline t))))
     (info-xref-visited ((t (:foreground "violet" :underline t))))
     (isearch ((t (:background "yellow2" :foreground "black"))))
     (isearch-fail ((t (:background "grey90" :foreground "red2"))))
     (iswitchb-current-match ((t (:foreground "SteelBlue1" :height 1.1))))
     (iswitchb-invalid-regexp ((t (:foreground "red2"))))
     (iswitchb-single-match ((t (:foreground "SpringGreen1" :height 1.1))))
     (iswitchb-virtual-matches ((t (:foreground "DeepPink1"))))
     (italic ((t (:italic t :slant italic))))
     (lazy-highlight ((t (:background "#441122"))))
     (link ((t (:foreground "RoyalBlue3" :underline t))))
     (link-visited ((t (:underline t :foreground "magenta4"))))
     (linum ((t (:foreground "grey90" :weight light))))
     (match ((t (:background "yellow1"))))
     (minibuffer-prompt ((t (:foreground "SteelBlue1"))))
     (mm-uu-extract ((t (:background "light yellow" :foreground "dark green"))))
     (moccur-current-line-face ((t (:background "grey10"))))
     (moccur-edit-done-face ((t (:background "red4" :foreground "grey90"))))
     (moccur-edit-face ((t (:background "grey10"))))
     (moccur-edit-file-face ((t (:background "Steelblue1" :foreground "black"))))
     (moccur-edit-reject-face ((t (:foreground "hot pink"))))
     (moccur-face ((t (:background "yellow2" :foreground "black"))))
     (mode-line ((t (:background "DarkRed" :foreground "white" :height 0.92 :box (:line-width -1 :style released-button)))))
     (mode-line-buffer-id ((t (:bold t :weight bold))))
     (mode-line-emphasis ((t (:bold t :weight bold))))
     (mode-line-highlight ((t (:box (:line-width -1 :color "DarkRed" :style released-button)))))
     (mode-line-inactive ((t (:background "grey30" :foreground "white" :height 0.91 :box (:line-width -1 :color "grey30" :style released-button)))))
     (mouse ((t (nil))))
     (next-error ((t (:background "grey20" :foreground "red"))))
     (nobreak-space ((t (:foreground "brown" :underline t))))
     (one-key-keystroke ((t (:foreground "DarkRed"))))
     (one-key-prompt ((t (:foreground "khaki3"))))
     (one-key-title ((t (:foreground "Gold"))))
     (org-agenda-calendar-event ((t (:foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "white" :stipple nil :height 113))))
     (org-agenda-calendar-sexp ((t (:foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "white" :stipple nil :height 113))))
     (org-agenda-clocking ((t (:italic t))))
     (org-agenda-column-dateline ((t (:weight normal :slant normal :underline nil :strike-through nil :background "grey30" :height 113))))
     (org-agenda-current-time ((t (:italic t :foreground "yellow" :height 115 :weight bold))))
     (org-agenda-date ((t (:foreground "DeepSkyblue1" :weight normal :height 125))))
     (org-agenda-date-today ((t (:italic nil :bold t :foreground "red1" :slant normal :weight normal :height 145))))
     (org-agenda-date-weekend ((t (:bold nil :foreground "SpringGreen1" :weight normal :height 125))))
     (org-agenda-diary ((t (:stipple nil :foreground "Orange1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown"))))
     (org-agenda-dimmed-todo-face ((t (:foreground "Springgreen1"))))
     (org-agenda-done ((t (:foreground "gold"))))
     (org-agenda-filter-category ((t (:background "DarkRed" :foreground "grey90" :box (:line-width -1 :style released-button) :height 92))))
     (org-agenda-filter-tags ((t (:background "DarkRed" :foreground "grey90" :box (:line-width -1 :style released-button) :height 92))))
     (org-agenda-restriction-lock ((t (:background "skyblue4"))))
     (org-agenda-structure ((t (:foreground "DeepPink1" :weight normal :height 150))))
     (org-archived ((t (:foreground "grey70"))))
     (org-block ((t (:foreground "grey70"))))
     (org-block-background ((t (nil))))
     (org-block-begin-line ((t (:foreground "green"))))
     (org-block-end-line ((t (:foreground "green"))))
     (org-checkbox ((t (:bold t :foreground "Springgreen4" :weight bold))))
     (org-checkbox-statistics-done ((t (:foreground "PaleGreen" :weight normal :height 130))))
     (org-checkbox-statistics-todo ((t (:foreground "Springgreen" :weight normal :height 120))))
     (org-clock-overlay ((t (:background "SkyBlue4"))))
     (org-code ((t (:foreground "cyan1"))))
     (org-column ((t (:background "grey30" :strike-through nil :underline nil :slant normal :weight normal :height 113))))
     (org-column-title ((t (:background "grey30" :underline t :weight normal))))
     (org-date ((t (:foreground "RoyalBlue1" :underline t :weight normal))))
     (org-document-info ((t (:foreground "pale turquoise"))))
     (org-document-info-keyword ((t (:foreground "grey70"))))
     (org-document-title ((t (:foreground "pale turquoise" :weight normal :height 144))))
     (org-done ((t (:foreground "Green2" :weight normal :height 130))))
     (org-drawer ((t (:foreground "LightSkyBlue"))))
     (org-ellipsis ((t (:foreground "LightGoldenrod" :underline t))))
     (org-footnote ((t (:foreground "Cyan" :underline t))))
     (org-formula ((t (:foreground "chocolate1"))))
     (org-headline-done ((t (:foreground "LightSalmon"))))
     (org-hide ((t (:foreground "black"))))
     (org-indent ((t (nil))))
     (org-latex-and-export-specials ((t (:foreground "burlywood"))))
     (org-level-1 ((t (:foreground "red2" :weight normal :height 130))))
     (org-level-2 ((t (:foreground "DeepPink" :weight normal :height 125))))
     (org-level-3 ((t (:foreground "RoyalBlue1" :weight normal :height 120))))
     (org-level-4 ((t (:foreground "red" :height 1.15))))
     (org-level-5 ((t (:foreground "SpringGreen1" :height 110))))
     (org-level-6 ((t (:foreground "cyan"))))
     (org-level-7 ((t (:foreground "yellow"))))
     (org-level-8 ((t (:foreground "Deep Pink"))))
     (org-link ((t (:foreground "cyan1" :underline t))))
     (org-meta-line ((t (:foreground "red2"))))
     (org-mode-line-clock ((t (:family "Monospace" :background "DarkRed" :foreground "grey90" :box (:line-width -1 :style released-button) :height 0.8464))))
     (org-mode-line-clock-overrun ((t (:family "Monospace" :background "red" :foreground "grey90" :box (:line-width -1 :style released-button) :height 0.8464))))
     (org-property-value ((t (nil))))
     (org-quote ((t (:foreground "grey70"))))
     (org-scheduled ((t (:foreground "PaleGreen"))))
     (org-scheduled-previously ((t (:foreground "chocolate1"))))
     (org-scheduled-today ((t (:foreground "PaleGreen"))))
     (org-sexp-date ((t (:foreground "Cyan"))))
     (org-special-keyword ((t (:foreground "#00ffff" :weight normal))))
     (org-table ((t (:foreground "LightSkyBlue"))))
     (org-tag ((t (:weight normal))))
     (org-target ((t (:underline t))))
     (org-time-grid ((t (:foreground "LightGoldenrod"))))
     (org-todo ((t (:foreground "yellow" :weight normal :height 130))))
     (org-upcoming-deadline ((t (:foreground "chocolate1"))))
     (org-verbatim ((t (:foreground "grey70"))))
     (org-verse ((t (:foreground "grey70"))))
     (org-warning ((t (:foreground "red" :weight normal))))
     (paren-face-match ((t (:background "grey40" :foreground "blue" :weight bold))))
     (paren-face-mismatch ((t (:background "red2" :foreground "black" :height 1.2))))
     (paren-face-no-match ((t (:background "red2" :foreground "black" :height 1.2))))
     (popup-scroll-bar-background-face ((t (nil))))
     (popup-scroll-bar-foreground-face ((t (nil))))
     (query-replace ((t (:foreground "lightskyblue1" :background "magenta3"))))
     (region ((t (:background "#004855" :foreground "white"))))
     (region-invert ((t (nil))))
     (search-buffers-face ((t (:bold t :background "SkyBlue" :foreground "Black" :weight bold))))
     (search-buffers-header-face ((t (:bold t :background "gray20" :foreground "azure3" :weight bold))))
     (secondary-selection ((t (:background "grey20"))))
     (show-paren-match ((t (:background "black" :foreground "yellow"))))
     (show-paren-mismatch ((t (:background "red2" :foreground "black" :height 1.2))))
     (success ((t (:bold t :foreground "ForestGreen" :weight bold))))
     (tabbar-default ((t (:height 0.97 :background "black"))))
     (tabbar-highlight ((t (nil))))
     (tabbar-button ((t (:background "black" :foreground "green" :box (:line-width -1 :color "green" :style released-button)))))
     (tabbar-button-highlight ((t (:background "black" :foreground "green" :box (:line-width -1 :color "green" :style released-button)))))
     (tabbar-selected ((t (:background "grey30" :foreground "DeepSkyBlue" :height 0.97))))
     (tabbar-separator ((t (:background "black" :height 0.97))))
     (tabbar-unselected ((t (:background "grey20" :foreground "grey60" :height 0.97))))
     (trailing-whitespace ((t (:background "grey50"))))
     (undo-tree-visualizer-active-branch-face ((t (:foreground "white"))))
     (undo-tree-visualizer-current-face ((t (:bold t :foreground "red" :weight bold))))
     (undo-tree-visualizer-default-face ((t (:foreground "gray"))))
     (undo-tree-visualizer-register-face ((t (:foreground "yellow"))))
     (undo-tree-visualizer-unmodified-face ((t (:foreground "cyan"))))
     (w3m-anchor ((t (:foreground "DeepSkyblue1" :underline t :height 1.1))))
     (w3m-arrived-anchor ((t (:foreground "red4" :underline t))))
     (w3m-bold ((t (:foreground "red3" :weight normal :height 1.15))))
     (w3m-current-anchor ((t (:box (:line-width -1 :color "Grey30") :underline t))))
     (w3m-form ((t (:foreground "khaki2" :underline "brown"))))
     (w3m-form-button ((t (:background "white" :foreground "black" :box (:line-width 1 :color "grey80" :style released-button) :height 1.1))))
     (w3m-form-button-mouse ((t (:background "Black" :foreground "Red" :box (:line-width -1 :color "Grey30" :style released-button)))))
     (w3m-form-button-pressed ((t (:background "Black" :foreground "DarkRed" :box (:line-width -1 :color "Grey60" :style pressed-button)))))
     (w3m-header-line-location-content ((t (:background "black" :foreground "Deep Pink" :weight normal :height 1.1))))
     (w3m-header-line-location-title ((t (:background "black" :foreground "yellow" :weight normal :height 1.1))))
     (w3m-history-current-url ((t (:background "black" :foreground "yellow" :height 1.1))))
     (w3m-image ((t (:background "Black" :foreground "DarkRed"))))
     (w3m-image-anchor ((t (:background "Black"))))
     (w3m-insert ((t (:foreground "orchid"))))
     (w3m-italic ((t (:italic t :slant italic))))
     (w3m-link-numbering ((t (:background "Black" :foreground "yellow"))))
     (w3m-strike-through ((t (:strike-through t))))
     (w3m-tab-background ((t (:background "black" :foreground "black" :height 0.97))))
     (w3m-tab-mouse ((t (:background "grey30" :foreground "DeepSkyBlue" :height 0.97))))
     (w3m-tab-selected ((t (:background "grey30" :foreground "DeepSkyBlue" :height 0.97))))
     (w3m-tab-selected-background ((t (:background "black" :foreground "black" :height 0.97))))
     (w3m-tab-selected-retrieving ((t (:background "grey30" :foreground "DeepSkyBlue" :height 0.97))))
     (w3m-tab-unselected ((t (:background "grey20" :foreground "grey80" :height 0.97))))
     (w3m-tab-unselected-retrieving ((t (:background "grey20" :foreground "grey80" :height 0.97))))
     (w3m-tab-unselected-unseen ((t (:background "grey20" :foreground "grey80" :height 0.97))))
     (w3m-underline ((t (:underline t))))
     (warning ((t (:bold t :foreground "DarkOrange" :weight bold))))
     (which-func ((t (:foreground "white"))))
     (widget-button ((t (:bold t :weight bold))))
     (widget-button-pressed ((t (:foreground "red1"))))
     (widget-documentation ((t (:foreground "dark green"))))
     (widget-field ((t (:background "gray85"))))
     (widget-inactive ((t (:foreground "grey50"))))
     (widget-single-line-field ((t (:background "gray85"))))
     (window-number-face ((t (:foreground "yellow" :height 1.05))))
     (yas--field-debug-face ((t (nil))))
     (yas-field-highlight-face ((t (:background "grey20" :foreground "DeepSkyBlue"))))
     (zjl-hl-elisp-function-call-face ((t (:foreground "DeepPink"))))
     (zjl-hl-elisp-number-face ((t (:foreground "orange"))))
     (zjl-hl-elisp-setq-face ((t (:foreground "red"))))
     (zjl-hl-font-lock-arithmetic-face ((t (:foreground "gold"))))
     (zjl-hl-font-lock-assignment-face ((t (:foreground "grey70"))))
     (zjl-hl-font-lock-bracket-face ((t (:foreground "grey70"))))
     (zjl-hl-font-lock-compare-face ((t (:foreground "red2"))))
     (zjl-hl-font-lock-dot-face ((t (:foreground "red"))))
     (zjl-hl-font-lock-logic-face ((t (:foreground "orchid3"))))
     (zjl-hl-font-lock-parenthesis-face ((t (:foreground "grey80"))))
     (zjl-hl-font-lock-semicolon-face ((t (:foreground "cyan"))))
     (zjl-hl-font-lock-square-bracket-face ((t (:foreground "red2" :weight bold))))
     (zjl-hl-function-call-face ((t (:foreground "DeepPink" :weight semi-bold))))
     (zjl-hl-local-variable-reference-face ((t (:foreground "yellow3"))))
     (zjl-hl-member-point-face ((t (:foreground "red"))))
     (zjl-hl-member-reference-face ((t (:foreground "yellow"))))
     (zjl-hl-number-face ((t (:foreground "grey90"))))
     (zjl-hl-operators-face ((t (:foreground "gold"))))
     (zjl-hl-parameters-reference-face ((t (:foreground "DeepPink")))))))

(add-to-list 'color-themes '(my-color-theme  "Emacs beautiful" "zhengyu li"))

(my-color-theme)

;;; provide features
(provide 'LzyTheme)

;;; LzyTheme.el ends here
