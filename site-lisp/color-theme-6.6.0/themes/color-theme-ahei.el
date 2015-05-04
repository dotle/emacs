;;; color-theme-ahei.el --- Color Theme by ahei 
 
;; Copyright (C) 2009 ahei 
 
;; Author: ahei <ahei0802@126.com> 
;; Keywords: color theme ahei 
;; Time-stamp: <2010-04-05 15:56:28 Monday by ahei> 
 
;; This file is free software; you can redistribute it and/or modify 
;; it under the terms of the GNU General Public License as published by 
;; the Free Software Foundation; either version 3, or (at your option) 
;; any later version. 
 
;; This file is distributed in the hope that it will be useful, 
;; but WITHOUT ANY WARRANTY; without even the implied warranty of 
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
;; GNU General Public License for more details. 
 
;; You should have received a copy of the GNU General Public License 
;; along with GNU Emacs; see the file COPYING.  If not, write to 
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, 
;; Boston, MA 02110-1301, USA. 
 
;;; Commentary: 
;; 
;; Color Theme by ahei 
 
;;; Installation: 
;; 
;; Copy dired-lis.el to your load-path and add following statement 
;; to your .emacs: 
;; 
;; (require 'color-theme-ahei) 
;; 
;; then M-x color-theme-ahei to use this color theme. 
 
;;; History: 
;; 
;; 2009-11-20 
;;      * initial version 1.0. 
 
;;; Code: 
 
(defface ahei-hl-line-face 
  '((((type tty)) :underline t) 
    (t :background "AntiqueWhite4" :underline t :inverse-video nil)) 
  "ahei's `hl-line-face'.") 
 
(setq hl-line-face 'ahei-hl-line-face) 
 
(if window-system 
    (progn 
      (setq hl-line-face-delta #X30FF) 
       
      (defun color-theme-adjust-hl-line-face() 
        "Auto adjust `hl-line-face' by background color." 
        (interactive) 
        (let* ((color (x-color-values (face-attribute 'default :background)))) 
          (if (null color) 
              (error (format "Not support on system %s" system-type)) 
            (let ((my-color 
                   (mapcar 
                    (lambda (x) 
                      (let ((y (/ #XFFFF 4)) 
                            (delta hl-line-face-delta)) 
                        (cond 
                         ((< x (* y 1)) 
                          (+ x delta)) 
                         ((< x (* y 2)) 
                          (+ x delta)) 
                         ((< x (* y 3)) 
                          (- x delta)) 
                         (t 
                          (- x delta))))) 
                    color))) 
              (set-face-attribute 
               hl-line-face 
               nil 
               :background 
               (concat "#" (mapconcat (lambda (c) (format "%04X" c)) my-color "")))))))) 
  (defun color-theme-adjust-hl-line-face())) 
 
(eval-when-compile (require 'color-theme-autoloads)) 
(defun color-theme-ahei () 
  "Color theme by ahei, created 2009-11-20." 
  (interactive) 
  (color-theme-install 
   '(color-theme-ahei 
     ((background-color . "black") 
      (background-mode . dark) 
      (border-color . "black") 
      (cursor-color . "green") 
      (foreground-color . "white") 
      (mouse-color . "#000000")) 
     ((Man-overstrike-face . yellow-face) 
      (Man-reverse-face . red-face) 
      (Man-underline-face . underline-green-face) 
      (align-highlight-change-face . highlight) 
      (align-highlight-nochange-face . secondary-selection) 
      (apropos-keybinding-face . cyan-face) 
      (apropos-label-face . underline-green-face) 
      (apropos-match-face . red-face) 
      (apropos-property-face . font-yellow-face) 
      (apropos-symbol-face . magenta-face) 
      (ascii-ascii-face . ascii-ascii-face) 
      (ascii-non-ascii-face . ascii-non-ascii-face) 
      (blank-map-face . blank-map-face) 
      (blank-space-face . blank-space-face) 
      (blank-tab-face . blank-tab-face) 
      (browse-kill-ring-separator-face . font-lock-comment-delimiter-face) 
      (cperl-here-face . font-lock-string-face) 
      (cperl-invalid-face . underline) 
      (cperl-pod-face . font-lock-comment-face) 
      (cperl-pod-head-face . font-lock-variable-name-face) 
      (cua-global-mark-cursor-color . "cyan") 
      (cua-normal-cursor-color . "green") 
      (cua-overwrite-cursor-color . "yellow") 
      (cua-read-only-cursor-color . "darkgreen") 
      (hl-line-face . ahei-hl-line-face) 
      (ispell-highlight-face . isearch) 
      (list-matching-lines-buffer-name-face . underline) 
      (list-matching-lines-face . match) 
      (moccur-maximum-displayed-with-color . 500) 
      (paren-match-face . paren-face-match) 
      (paren-mismatch-face . paren-face-mismatch) 
      (paren-no-match-face . paren-face-no-match) 
      (php-default-face . default) 
      (snippet-bound-face . bold) 
      (snippet-field-face . highlight) 
      (tags-tag-face . default) 
      (term-default-bg-color . "black") 
      (term-default-fg-color . "white") 
      (view-highlight-face . highlight) 
      (widget-mouse-face . highlight)) 
     (default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Fixedsys Excelsior 2.00")))) 
     (ac-candidate-face ((t (:background "lightgray" :foreground "black")))) 
     (ac-completion-face ((t (:background "darkblue" :foreground "white")))) 
     (ac-etags-candidate-face ((t (:background "gainsboro" :foreground "deep sky blue")))) 
     (ac-etags-selection-face ((t (:background "deep sky blue" :foreground "white")))) 
     (ac-gtags-candidate-face ((t (:background "lightgray" :foreground "navy")))) 
     (ac-gtags-selection-face ((t (:background "navy" :foreground "white")))) 
     (ac-selection-face ((t (:background "blue" :foreground "white")))) 
     (ac-verilog-candidate-face ((t (:background "snow3" :foreground "black")))) 
     (ac-verilog-selection-face ((t (:background "SlateBlue3" :foreground "black")))) 
     (ac-yasnippet-candidate-face ((t (:background "sandybrown" :foreground "black")))) 
     (ac-yasnippet-selection-face ((t (:background "coral3" :foreground "white")))) 
     (anything-bookmarks-su-face ((t (:foreground "red")))) 
     (anything-dir-heading ((t (:background "Pink" :foreground "Blue")))) 
     (anything-dir-priv ((t (:background "LightGray" :foreground "DarkRed")))) 
     (anything-file-name ((t (:foreground "Blue")))) 
     (anything-gentoo-match-face ((t (:foreground "red")))) 
     (anything-header ((t (:foreground "grey90" :background "grey20" :box (:line-width -1 :style released-button))))) 
     (anything-isearch-match ((t (:background "Yellow")))) 
     (anything-overlay-line-face ((t (:background "IndianRed4" :underline t)))) 
     (anything-visible-mark ((t (:background "green1" :foreground "black")))) 
     (anything-w3m-bookmarks-face ((t (:foreground "cyan1" :underline t)))) 
     (ascii-ascii-face ((t (:background "SkyBlue4")))) 
     (ascii-non-ascii-face ((t (:background "darkolivegreen")))) 
     (beautiful-blue-face ((t (:foreground "cornflower blue")))) 
     (beautiful-blue-red-face ((t (:background "cornflower blue" :foreground "red")))) 
     (bg:erc-color-face0 ((t (:background "White")))) 
     (bg:erc-color-face1 ((t (:background "black")))) 
     (bg:erc-color-face10 ((t (:background "lightblue1")))) 
     (bg:erc-color-face11 ((t (:background "cyan")))) 
     (bg:erc-color-face12 ((t (:background "blue")))) 
     (bg:erc-color-face13 ((t (:background "deeppink")))) 
     (bg:erc-color-face14 ((t (:background "gray50")))) 
     (bg:erc-color-face15 ((t (:background "gray90")))) 
     (bg:erc-color-face2 ((t (:background "blue4")))) 
     (bg:erc-color-face3 ((t (:background "green4")))) 
     (bg:erc-color-face4 ((t (:background "red")))) 
     (bg:erc-color-face5 ((t (:background "brown")))) 
     (bg:erc-color-face6 ((t (:background "purple")))) 
     (bg:erc-color-face7 ((t (:background  "orange")))) 
     (bg:erc-color-face8 ((t (:background "yellow")))) 
     (bg:erc-color-face9 ((t (:background "green")))) 
     (blank-map-face ((t (:bold t :background "Linen" :foreground "Aquamarine3" :weight bold)))) 
     (blank-space-face ((t (:background "LightYellow" :foreground "Aquamarine3")))) 
     (blank-tab-face ((t (:background "Beige" :foreground "Aquamarine3")))) 
     (bold ((t (:bold t :weight bold)))) 
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold)))) 
     (bookmark-menu-heading ((t (:foreground "green")))) 
     (border ((t (nil)))) 
     (buffer-menu-buffer ((t (:bold t :weight bold)))) 
     (button ((t (:underline t)))) 
     (c-includes-already-face ((t (:foreground "purple")))) 
     (c-includes-close-face ((t (:foreground "dark red")))) 
     (c-includes-open-face ((t (:foreground "red")))) 
     (c-includes-unknown-face ((t (:bold t :foreground "red" :weight bold)))) 
     (change-log-acknowledgement ((t (:foreground "red")))) 
     (change-log-conditionals ((t (:foreground "yellow" :background "black")))) 
     (change-log-date ((t (:foreground "magenta")))) 
     (change-log-email ((t (:foreground "yellow" :background "black")))) 
     (change-log-file ((t (:foreground "darkorchid2" :background "wheat")))) 
     (change-log-function ((t (:foreground "yellow" :background "black")))) 
     (change-log-list ((t (:foreground "cyan" :background "black")))) 
     (change-log-name ((t (:foreground "chartreuse" :background "darkslateblue")))) 
     (comint-highlight-input ((t (:bold t :weight bold)))) 
     (comint-highlight-prompt ((t (:foreground "cyan1")))) 
     (compilation-column-number ((t (:foreground "green")))) 
     (compilation-error ((t (:foreground "white" :background "red")))) 
     (compilation-info ((t (:foreground "green")))) 
     (compilation-line-number ((t (:foreground "yellow" :background "black")))) 
     (compilation-warning ((t (:bold t :foreground "Orange" :weight bold)))) 
     (completions-common-part ((t (:foreground "yellow")))) 
     (completions-first-difference ((t (:foreground "red")))) 
     (cperl-array-face ((t (:bold t :background "navy" :foreground "yellow" :weight bold)))) 
     (cperl-hash-face ((t (:italic t :bold t :background "navy" :foreground "Red" :slant italic :weight bold)))) 
     (cperl-nonoverridable-face ((t (:foreground "orchid1")))) 
     (cua-global-mark ((t (:background "yellow1" :foreground "black")))) 
     (cua-rectangle ((t (:background "maroon" :foreground "white")))) 
     (cua-rectangle-noselect ((t (:background "dimgray" :foreground "white")))) 
     (cursor ((t (:background "green")))) 
     (custom-button ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style released-button))))) 
     (custom-button-mouse ((t (:background "grey90" :foreground "black" :box (:line-width 2 :style released-button))))) 
     (custom-button-pressed ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button))))) 
     (custom-button-pressed-unraised ((t (:underline t :foreground "violet")))) 
     (custom-button-unraised ((t (:underline t)))) 
     (custom-changed ((t (:background "blue1" :foreground "white")))) 
     (custom-comment ((t (:background "dim gray")))) 
     (custom-comment-tag ((t (:foreground "gray80")))) 
     (custom-documentation ((t (nil)))) 
     (custom-face-tag ((t (:bold t :weight bold :foreground "light blue")))) 
     (custom-group-tag ((t (:bold t :family "Sans Serif" :foreground "light blue" :weight bold :height 1.2)))) 
     (custom-group-tag-1 ((t (:bold t :family "Sans Serif" :foreground "pink" :weight bold :height 1.2)))) 
     (custom-invalid ((t (:background "red1" :foreground "yellow1")))) 
     (custom-link ((t (:underline t :foreground "cyan1")))) 
     (custom-modified ((t (:background "blue1" :foreground "white")))) 
     (custom-rogue ((t (:background "black" :foreground "pink")))) 
     (custom-saved ((t (:underline t)))) 
     (custom-set ((t (:background "white" :foreground "blue1")))) 
     (custom-state ((t (:foreground "lime green")))) 
     (custom-themed ((t (:background "blue1" :foreground "white")))) 
     (custom-variable-button ((t (:bold t :underline t :weight bold)))) 
     (custom-variable-tag ((t (:bold t :foreground "light blue" :weight bold)))) 
     (custom-visibility ((t (:underline t :foreground "cyan1" :height 0.8)))) 
     (diff-added ((t (:foreground "aquamarine")))) 
     (diff-changed ((t (:foreground "deep pink")))) 
     (diff-context ((t (:foreground "cornflower blue")))) 
     (diff-file-header ((t (:foreground "magenta")))) 
     (diff-function ((t (:foreground "green")))) 
     (diff-header ((t (:foreground "green")))) 
     (diff-hunk-header ((t (:foreground "OliveDrab1")))) 
     (diff-index ((t (:foreground "cyan")))) 
     (diff-indicator-added ((t (:background "white" :foreground "red")))) 
     (diff-indicator-changed ((t (:foreground "deep pink")))) 
     (diff-indicator-removed ((t (:background "red" :foreground "yellow")))) 
     (diff-nonexistent ((t (:foreground "magenta")))) 
     (diff-refine-change ((t (:foreground "dark orchid")))) 
     (diff-removed ((t (:foreground "red")))) 
     (dired-directory ((t (:foreground "darkorchid2" :background "wheat")))) 
     (dired-flagged ((t (:foreground "white" :background "red")))) 
     (dired-header ((t (:foreground "green")))) 
     (dired-ignored ((t (:foreground "grey70")))) 
     (dired-lis-mode-line-face ((t (:background "darkmagenta" :foreground "white")))) 
     (dired-mark ((t (:foreground "chartreuse" :background "darkslateblue")))) 
     (dired-marked ((t (:foreground "white" :background "red")))) 
     (dired-perm-write ((t (:foreground "chocolate1")))) 
     (dired-symlink ((t (:foreground "cyan" :background "black")))) 
     (dired-warning ((t (:foreground "white" :background "red")))) 
     (diredp-compressed-file-suffix ((t (:foreground "Yellow")))) 
     (diredp-date-time ((t (:foreground "goldenrod1")))) 
     (diredp-deletion ((t (:background "Red" :foreground "Yellow")))) 
     (diredp-deletion-file-name ((t (:foreground "Red")))) 
     (diredp-dir-heading ((t (:background "Pink" :foreground "DarkOrchid1")))) 
     (diredp-dir-priv ((t (:background "LightGray" :foreground "DarkRed")))) 
     (diredp-display-msg ((t (:foreground "cornflower blue")))) 
     (diredp-exec-priv ((t (:background "LightSteelBlue")))) 
     (diredp-executable-tag ((t (:foreground "Red")))) 
     (diredp-file-name ((t (:foreground "Blue")))) 
     (diredp-file-suffix ((t (:foreground "DarkMagenta")))) 
     (diredp-flag-mark ((t (:background "Blueviolet" :foreground "Yellow")))) 
     (diredp-flag-mark-line ((t (:background "Skyblue")))) 
     (diredp-ignored-file-name ((t (:foreground "#00006DE06DE0")))) 
     (diredp-link-priv ((t (:foreground "DarkOrange")))) 
     (diredp-no-priv ((t (:background "LightGray")))) 
     (diredp-other-priv ((t (:background "PaleGoldenrod")))) 
     (diredp-rare-priv ((t (:background "SpringGreen" :foreground "Magenta")))) 
     (diredp-read-priv ((t (:background "MediumAquamarine")))) 
     (diredp-symlink ((t (:foreground "DarkOrange")))) 
     (diredp-write-priv ((t (:background "Orchid")))) 
     (doremi-last-face ((t (:stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "bitstream" :family "Bitstream Vera Sans Mono")))) 
     (dropdown-list-face ((t (:family "Fixedsys Excelsior 2.00" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :background "lightyellow" :foreground "black" :height 128)))) 
     (dropdown-list-selection-face ((t (:foreground "black" :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "Fixedsys Excelsior 2.00" :background "purple" :height 128)))) 
     (ebrowse-default ((t (nil)))) 
     (ebrowse-file-name ((t (:italic t :slant italic)))) 
     (ebrowse-member-attribute ((t (:foreground "red1")))) 
     (ebrowse-member-class ((t (:foreground "purple")))) 
     (ebrowse-progress ((t (:background "blue1")))) 
     (ebrowse-root-class ((t (:bold t :foreground "blue1" :weight bold)))) 
     (ebrowse-tree-mark ((t (:foreground "red1")))) 
     (ediff-current-diff-A ((t (:background "DarkSeaGreen3" :foreground "blue violet")))) 
     (ediff-current-diff-Ancestor ((t (:background "VioletRed" :foreground "Black")))) 
     (ediff-current-diff-B ((t (:background "DodgerBlue1" :foreground "gray11")))) 
     (ediff-current-diff-C ((t (:background "Pink" :foreground "Navy")))) 
     (ediff-even-diff-A ((t (:background "light grey" :foreground "Black")))) 
     (ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "White")))) 
     (ediff-even-diff-B ((t (:background "Grey" :foreground "White")))) 
     (ediff-even-diff-C ((t (:background "light grey" :foreground "Black")))) 
     (ediff-fine-diff-A ((t (:background "gold1" :foreground "red")))) 
     (ediff-fine-diff-Ancestor ((t (:background "Green" :foreground "Black")))) 
     (ediff-fine-diff-B ((t (:background "chocolate2" :foreground "dark slate blue")))) 
     (ediff-fine-diff-C ((t (:background "Turquoise" :foreground "Black")))) 
     (ediff-odd-diff-A ((t (:background "Grey" :foreground "White")))) 
   (ediff-odd-diff-Ancestor ((t (:background "gray40" :foreground "cyan3")))) 
     (ediff-odd-diff-B ((t (:background "light grey" :foreground "Black")))) 
     (ediff-odd-diff-C ((t (:background "Grey" :foreground "White")))) 
     (eieio-custom-slot-tag-face ((t (:foreground "light blue")))) 
     (eldoc-highlight-function-argument ((t (:foreground "green" :weight normal)))) 
     (erb-comment-delim-face ((t (:bold t :background "snow3" :foreground "darkgreen" :weight bold)))) 
     (erb-comment-face ((t (:bold t :background "snow2" :foreground "darkgreen" :weight bold)))) 
     (erb-delim-face ((t (:background "snow3")))) 
     (erb-exec-delim-face ((t (:bold t :background "snow3" :weight bold)))) 
     (erb-exec-face ((t (:background "snow2")))) 
     (erb-face ((t (:background "snow2")))) 
     (erb-out-delim-face ((t (:bold t :background "snow3" :foreground "darkred" :weight bold)))) 
     (erb-out-face ((t (:background "snow2")))) 
     (erc-action-face ((t (:bold t :weight bold)))) 
     (erc-bold-face ((t (:bold t :weight bold)))) 
     (erc-command-indicator-face ((t (:bold t :weight bold)))) 
     (erc-default-face ((t (nil)))) 
     (erc-direct-msg-face ((t (:foreground "IndianRed")))) 
     (erc-error-face ((t (:foreground "red")))) 
     (erc-header-line ((t (:background "grey90" :foreground "grey20")))) 
     (erc-input-face ((t (:foreground "brown")))) 
     (erc-inverse-face ((t (:background "Black" :foreground "White")))) 
     (erc-my-nick-face ((t (:bold t :foreground "brown" :weight bold)))) 
     (erc-nick-default-face ((t (:bold t :weight bold)))) 
     (erc-nick-msg-face ((t (:bold t :foreground "IndianRed" :weight bold)))) 
     (erc-notice-face ((t (:bold t :foreground "SlateBlue" :weight bold)))) 
     (erc-prompt-face ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold)))) 
     (erc-underline-face ((t (:underline t)))) 
     (escape-glyph ((t (:foreground "cyan")))) 
     (ffap ((t (:foreground "red" :background "blue")))) 
     (fg:erc-color-face0 ((t (:foreground "White")))) 
     (fg:erc-color-face1 ((t (:foreground "black")))) 
     (fg:erc-color-face10 ((t (:foreground "lightblue1")))) 
     (fg:erc-color-face11 ((t (:foreground "cyan")))) 
     (fg:erc-color-face12 ((t (:foreground "blue")))) 
     (fg:erc-color-face13 ((t (:foreground "deeppink")))) 
     (fg:erc-color-face14 ((t (:foreground "gray50")))) 
     (fg:erc-color-face15 ((t (:foreground "gray90")))) 
     (fg:erc-color-face2 ((t (:foreground "blue4")))) 
     (fg:erc-color-face3 ((t (:foreground "green4")))) 
     (fg:erc-color-face4 ((t (:foreground "red")))) 
     (fg:erc-color-face5 ((t (:foreground "brown")))) 
     (fg:erc-color-face6 ((t (:foreground "purple")))) 
     (fg:erc-color-face7 ((t (:foreground "orange")))) 
     (fg:erc-color-face8 ((t (:foreground "yellow")))) 
     (fg:erc-color-face9 ((t (:foreground "green")))) 
     (file-name-shadow ((t (:foreground "grey70")))) 
     (fixed-pitch ((t (:family "Monospace")))) 
     (flymake-errline ((t (:background "Firebrick4")))) 
     (flymake-warnline ((t (:background "DarkBlue")))) 
     (flyspell-duplicate ((t (:bold t :foreground "Gold3" :underline t :weight bold)))) 
     (flyspell-incorrect ((t (:bold t :foreground "OrangeRed" :underline t :weight bold)))) 
     (font-lock-builtin-face ((t (:foreground "LightSteelBlue")))) 
     (font-lock-comment-delimiter-face ((t (:foreground "chocolate1")))) 
     (font-lock-comment-face ((t (:foreground "red")))) 
     (font-lock-constant-face ((t (:background "darkslateblue" :foreground "chartreuse")))) 
     (font-lock-doc-face ((t (:foreground "maroon1")))) 
     (font-lock-function-name-face ((t (:background "wheat" :foreground "darkorchid2")))) 
     (font-lock-keyword-face ((t (:background "black" :foreground "cyan")))) 
     (font-lock-negation-char-face ((t (nil)))) 
     (font-lock-preprocessor-face ((t (:foreground "LightSteelBlue")))) 
     (font-lock-regexp-grouping-backslash ((t (:foreground "red")))) 
     (font-lock-regexp-grouping-construct ((t (:foreground "yellow")))) 
     (font-lock-string-face ((t (:foreground "magenta")))) 
     (font-lock-type-face ((t (:foreground "green")))) 
     (font-lock-variable-name-face ((t (:background "black" :foreground "yellow")))) 
     (font-lock-warning-face ((t (:background "red" :foreground "white")))) 
     (fringe ((t (:background "grey10")))) 
     (header-line ((t (:box (:line-width -1 :style released-button) :background "grey20" :foreground "grey90" :box nil)))) 
     (help-argument-name ((t (:italic t :slant italic :foreground "green")))) 
     (highlight ((t (:background "blue" :foreground "red")))) 
     (hl-line ((t (:foreground "red" :background "blue")))) 
     (hl-paren-face ((t (nil)))) 
     (icicle-Completions-instruction-1 ((t (:foreground "#AC4AAC4A0000")))) 
     (icicle-Completions-instruction-2 ((t (:foreground "#0000D53CD53C")))) 
     (icicle-candidate-part ((t (:background "#451700143197")))) 
     (icicle-common-match-highlight-Completions ((t (:foreground "#2017A71F2017")))) 
     (icicle-complete-input ((t (:foreground "#B19E6A64B19E")))) 
     (icicle-completion ((t (:foreground "#0000D53CD53C")))) 
     (icicle-current-candidate-highlight ((t (:background "#69D40A460000")))) 
     (icicle-extra-candidate ((t (:background "#4517305D0000")))) 
     (icicle-historical-candidate ((t (:foreground "#DBD599DF0000")))) 
     (icicle-input-completion-fail ((t (:background "#22225F5F2222")))) 
     (icicle-input-completion-fail-lax ((t (:background "#00005E3B5A8D")))) 
     (icicle-match-highlight-Completions ((t (:foreground "#1F1FA21CA21C")))) 
     (icicle-match-highlight-minibuffer ((t (:underline t)))) 
     (icicle-mode-line-help ((t (:foreground "#AC4AAC4A0000")))) 
     (icicle-multi-command-completion ((t (:background "#8B3500007533" :foreground "#0000D53CD53C")))) 
     (icicle-mustmatch-completion ((t (:box (:line-width 2 :color "Blue"))))) 
     (icicle-proxy-candidate ((t (:background "#316B22970000")))) 
     (icicle-saved-candidate ((t (:background "gray20")))) 
     (icicle-search-context-level-1 ((t (:background "#FA6CC847FFFF")))) 
     (icicle-search-context-level-2 ((t (:background "#C847FFFFE423")))) 
     (icicle-search-context-level-3 ((t (:background "#C847D8FEFFFF")))) 
     (icicle-search-context-level-4 ((t (:background "#EF46FFFFC847")))) 
     (icicle-search-context-level-5 ((t (:background "#FCFCE1E1FFFF")))) 
     (icicle-search-context-level-6 ((t (:background "#E1E1FFFFF0F0")))) 
     (icicle-search-context-level-7 ((t (:background "#E1E1EAEAFFFF")))) 
     (icicle-search-context-level-8 ((t (:background "#F6F5FFFFE1E1")))) 
     (icicle-search-current-input ((t (:background "#7F0D00007F0D" :foreground "White")))) 
     (icicle-search-main-regexp-current ((t (:background "#00004AA652F1")))) 
     (icicle-search-main-regexp-others ((t (:background "#348608690000")))) 
     (icicle-special-candidate ((t (:background "#176900004E0A")))) 
     (icicle-whitespace-highlight ((t (:background "#000093F402A2")))) 
     (icompletep-choices ((t (:foreground "yellow")))) 
     (icompletep-determined ((t (:foreground "green")))) 
     (icompletep-keys ((t (:foreground "Red")))) 
     (icompletep-nb-candidates ((t (:foreground "green")))) 
     (ido-first-match ((t (:foreground "yellow" :weight normal)))) 
     (ido-incomplete-regexp ((t (:foreground "white" :background "red")))) 
     (ido-indicator ((t (:background "red1" :foreground "yellow1" :width condensed)))) 
     (ido-only-match ((t (:foreground "green" :weight normal)))) 
     (ido-subdir ((t (:foreground "red1")))) 
     (ifdef-highlight-face1 ((t (:background "paleturquoise4")))) 
     (ifdef-highlight-face2 ((t (:background "paleGreen3")))) 
     (ifdef-highlight-face3 ((t (:background "yellow4")))) 
     (ifdef-highlight-face4 ((t (:background "pink4")))) 
     (info-command-ref-item ((t (:background "LightGray" :foreground "Blue")))) 
     (info-file ((t (:background "LightGray" :foreground "Blue")))) 
     (info-function-ref-item ((t (:background "LightGray" :foreground "deeppink1")))) 
     (info-header-node ((t (:foreground "red")))) 
     (info-header-xref ((t (:foreground "cyan1" :underline t)))) 
     (info-macro-ref-item ((t (:background "LightGray" :foreground "DarkMagenta")))) 
     (info-menu ((t (:foreground "Blue")))) 
     (info-menu-header ((t (:foreground "coral2" :weight normal)))) 
     (info-menu-star ((t (:background "yellow" :foreground "red")))) 
     (info-node ((t (:italic t :bold t :foreground "white" :slant italic :weight bold)))) 
     (info-quoted-name ((t (:foreground "cornflower blue")))) 
     (info-reference-item ((t (:background "white" :foreground "cornflower blue")))) 
     (info-single-quote ((t (:background "red" :foreground "white")))) 
     (info-special-form-ref-item ((t (:background "LightGray" :foreground "DarkMagenta")))) 
     (info-string ((t (:foreground "magenta")))) 
     (info-syntax-class-item ((t (:background "LightGray" :foreground "DarkGreen")))) 
     (info-title-1 ((t (:foreground "yellow")))) 
     (info-title-2 ((t (:foreground "lightblue")))) 
     (info-title-3 ((t (:foreground "violetred1")))) 
     (info-title-4 ((t (:foreground "green")))) 
     (info-user-option-ref-item ((t (:background "LightGray" :foreground "Red")))) 
     (info-variable-ref-item ((t (:background "LightGray" :foreground "FireBrick")))) 
     (info-xref ((t (:underline t :foreground "cyan1")))) 
     (info-xref-visited ((t (:foreground "violet" :underline t)))) 
     (isearch ((t (:background "blue" :foreground "red")))) 
     (isearch-fail ((t (:background "red")))) 
     (italic ((t (:italic t :slant italic)))) 
     (js2-error-face ((t (:foreground "red")))) 
     (js2-external-variable-face ((t (:foreground "orange")))) 
     (js2-function-param-face ((t (:foreground "SeaGreen")))) 
     (js2-instance-member-face ((t (:foreground "DarkOrchid")))) 
     (js2-jsdoc-html-tag-delimiter-face ((t (:foreground "green")))) 
     (js2-jsdoc-html-tag-name-face ((t (:foreground "yellow")))) 
     (js2-jsdoc-tag-face ((t (:foreground "SlateGray")))) 
     (js2-jsdoc-type-face ((t (:foreground "SteelBlue")))) 
     (js2-jsdoc-value-face ((t (:foreground "PeachPuff3")))) 
     (js2-magic-paren-face ((t (:underline t)))) 
     (js2-private-function-call-face ((t (:foreground "goldenrod")))) 
     (js2-private-member-face ((t (:foreground "PeachPuff3")))) 
     (js2-warning-face ((t (:underline "orange")))) 
     (lazy-highlight ((t (:background "white" :foreground "black")))) 
     (light-blue-face ((t (:foreground "cornflower blue")))) 
     (link ((t (:foreground "cyan1" :underline t)))) 
     (link-visited ((t (:underline t :foreground "violet")))) 
     (linkd-command ((t (:foreground "red" :underline t)))) 
     (linkd-generic-link ((t (:foreground "blue")))) 
     (linkd-generic-link-name ((t (:foreground "blue")))) 
     (linkd-icon ((t (:underline nil)))) 
     (linkd-star ((t (:foreground "#ffffff")))) 
     (linkd-star-name ((t (:background "Pink" :foreground "blue")))) 
     (linkd-tag ((t (:foreground "#ffffff")))) 
     (linkd-tag-name ((t (:foreground "blue" :underline t)))) 
     (linkd-wiki ((t (:foreground "FireBrick" :underline t)))) 
     (linum ((t (:foreground "cyan")))) 
     (log-view-file ((t (:bold t :weight bold)))) 
     (log-view-message ((t (:bold t :weight bold)))) 
     (makefile-makepp-perl ((t (:background "DarkBlue")))) 
     (makefile-shell ((t (nil)))) 
     (makefile-space ((t (:background "hotpink")))) 
     (makefile-targets ((t (:foreground "darkorchid2" :background "wheat")))) 
     (match ((t (:background "RoyalBlue3" :foreground "cyan")))) 
     (menu ((t (nil)))) 
     (message-cited-text ((t (:foreground "LightPink1")))) 
     (message-header-cc ((t (:bold t :foreground "chartreuse1" :weight bold)))) 
     (message-header-name ((t (:foreground "green")))) 
     (message-header-newsgroups ((t (:italic t :bold t :foreground "yellow" :slant italic :weight bold)))) 
     (message-header-other ((t (:foreground "VioletRed1")))) 
     (message-header-subject ((t (:foreground "OliveDrab1")))) 
     (message-header-to ((t (:bold t :foreground "DarkOliveGreen1" :weight bold)))) 
     (message-header-xheader ((t (:foreground "DeepSkyBlue1")))) 
     (message-mml ((t (:foreground "MediumSpringGreen")))) 
     (message-separator ((t (:foreground "LightSkyBlue1")))) 
     (minibuffer-prompt ((t (:foreground "cyan")))) 
     (moccur-current-line-face ((t (:background "blue" :foreground "red" :underline t)))) 
     (moccur-face ((t (:background "white" :foreground "red" :weight normal)))) 
     (mode-line ((t (:background "lightgreen" :foreground "black" :box (:line-width -1 :style released-button))))) 
     (mode-line-buffer-id ((t (:background "HotPink3" :foreground "yellow")))) 
     (mode-line-emphasis ((t (:bold t :weight bold)))) 
     (mode-line-highlight ((t (:box (:line-width 2 :color "grey40" :style released-button))))) 
     (mode-line-inactive ((t (:background "white" :foreground "black" :box (:line-width -1 :color "grey40" :style nil) :weight light)))) 
     (mode-line-lines-face ((t (:background "dark slate blue" :foreground "yellow")))) 
     (mouse ((t (nil)))) 
     (black-red-face ((t (:background "red" :foreground "black")))) 
     (blue-face ((t (:foreground "blue")))) 
     (cyan-face ((t (:foreground "cyan")))) 
     (darkblue-face ((t (:foreground "blue")))) 
     (darkcyan-face ((t (:foreground "cyan")))) 
     (darkgreen-face ((t (:foreground "green")))) 
     (darkmagenta-face ((t (:foreground "magenta")))) 
     (darkred-face ((t (:foreground "red")))) 
     (darkyellow-face ((t (:foreground "yellow")))) 
     (green-face ((t (:foreground "green")))) 
     (green-red-face ((t (:background "red" :foreground "green")))) 
     (hl-line-face ((t (:background "#30FF30FF30FF" :inverse-video nil :underline t)))) 
     (lightblue-face ((t (:foreground "cornflower blue")))) 
     (magenta-face ((t (:foreground "magenta")))) 
     (red-blue-face ((t (:background "blue" :foreground "red")))) 
     (red-face ((t (:foreground "red")))) 
     (red-yellow-face ((t (:background "yellow" :foreground "red")))) 
     (underline-face ((t (:underline t)))) 
     (underline-green-face ((t (:foreground "green" :underline t)))) 
     (white-face ((t (:foreground "white")))) 
     (white-red-face ((t (:background "red" :foreground "white")))) 
     (yellow-blue-face ((t (:background "blue" :foreground "yellow")))) 
     (yellow-face ((t (:foreground "yellow")))) 
     (yellow-forestgreen-face ((t (:background "forest green" :foreground "yellow")))) 
     (yellow-red-face ((t (:background "red" :foreground "yellow")))) 
     (next-error ((t (:background "#4CAA4CAA4CAA")))) 
     (nobreak-space ((t (:foreground "cyan" :underline t)))) 
     (paren-face-match ((t (:background "magenta" :foreground "yellow")))) 
     (paren-face-mismatch ((t (:background "red" :foreground "white")))) 
     (paren-face-no-match ((t (:background "yellow" :foreground "black")))) 
     (pulse-highlight-face ((t (:background "#AAAA33")))) 
     (pulse-highlight-start-face ((t (:background "#AAAA33")))) 
     (query-replace ((t (:foreground "red" :background "blue")))) 
     (region ((t (:background "#4CAA4CAA4CAA")))) 
     (scroll-bar ((t (:background "#efebe7" :foreground "#101010")))) 
     (search-buffers-face ((t (:bold t :background "SkyBlue" :foreground "Black" :weight bold)))) 
     (search-buffers-header-face ((t (:bold t :background "gray20" :foreground "azure3" :weight bold)))) 
     (secondary-selection ((t (:background "SkyBlue4")))) 
     (semantic-highlight-edits-face ((t (:background "gray20")))) 
     (semantic-highlight-func-current-tag-face ((t (:background "gray20")))) 
     (semantic-unmatched-syntax-face ((t (:underline "red")))) 
     (senator-intangible-face ((t (:foreground "gray75")))) 
     (senator-momentary-highlight-face ((t (:background "gray30")))) 
     (senator-read-only-face ((t (:background "#664444")))) 
     (sgml-namespace ((t (:foreground "LightSteelBlue")))) 
     (sh-escaped-newline ((t (:foreground "magenta")))) 
     (sh-heredoc ((t (:foreground "deeppink")))) 
     (sh-quoted-exec ((t (:foreground "salmon")))) 
     (shadow ((t (:foreground "grey70")))) 
     (show-paren-match ((t (:background "magenta" :foreground "yellow")))) 
     (show-paren-mismatch ((t (:background "red" :foreground "white")))) 
     (show-tabs-space ((t (:background "yellow1")))) 
     (show-tabs-tab ((t (:background "red1")))) 
     (speedbar-button-face ((t (:foreground "green3")))) 
     (speedbar-directory-face ((t (:foreground "light blue")))) 
     (speedbar-file-face ((t (:foreground "cyan")))) 
     (speedbar-highlight-face ((t (:background "sea green")))) 
     (speedbar-selected-face ((t (:foreground "red" :underline t)))) 
     (speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray")))) 
     (speedbar-tag-face ((t (:foreground "yellow")))) 
     (svn-status-directory-face ((t (:foreground "lightskyblue1")))) 
     (svn-status-filename-face ((t (:foreground "yellow")))) 
     (svn-status-locked-face ((t (:bold t :foreground "Red" :weight bold)))) 
     (svn-status-marked-face ((t (:foreground "palegreen2")))) 
     (svn-status-marked-popup-face ((t (:foreground "palegreen2")))) 
     (svn-status-switched-face ((t (:foreground "Aquamarine")))) 
     (svn-status-update-available-face ((t (:foreground "yellow")))) 
     (template-message-face ((t (:bold t :weight bold)))) 
     (tool-bar ((t (:background "#efebe7" :foreground "#101010" :box (:line-width 1 :style released-button))))) 
     (tooltip ((t (:family "Sans Serif" :background "lightyellow" :foreground "black")))) 
     (trailing-whitespace ((t (:background "red1")))) 
     (underline ((t (:underline t)))) 
     (variable-pitch ((t (:family "Sans Serif")))) 
     (vertical-border ((t (nil)))) 
     (view-mode-mode-line-face ((t (:background "red" :foreground "white")))) 
     (w3m-anchor ((t (:foreground "cyan")))) 
     (w3m-arrived-anchor ((t (:foreground "magenta")))) 
     (w3m-bold ((t (:bold t :weight bold)))) 
     (w3m-current-anchor ((t (:bold t :underline t :weight bold)))) 
     (w3m-form-button ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style released-button))))) 
     (w3m-form-button-mouse ((t (:background "DarkSeaGreen1" :foreground "black" :box (:line-width 2 :style released-button))))) 
     (w3m-form-button-pressed ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button))))) 
     (w3m-header-line-location-content ((t (:background "Gray20" :foreground "LightGoldenrod")))) 
     (w3m-header-line-location-title ((t (:background "Gray20" :foreground "Cyan")))) 
     (w3m-history-current-url ((t (:background "SkyBlue4" :foreground "LightSkyBlue")))) 
     (w3m-image ((t (:foreground "PaleGreen")))) 
     (w3m-image-anchor ((t (:background "dark green")))) 
     (w3m-insert ((t (:foreground "orchid")))) 
     (w3m-italic ((t (:italic t :slant italic)))) 
     (w3m-strike-through ((t (:strike-through t)))) 
     (w3m-tab-background ((t (:background "LightSteelBlue" :foreground "black")))) 
     (w3m-tab-mouse ((t (:background "Gray75" :foreground "white" :box (:line-width -1 :style released-button))))) 
     (w3m-tab-selected ((t (:background "Gray90" :foreground "black" :box (:line-width -1 :style released-button))))) 
     (w3m-tab-selected-background ((t (:background "LightSteelBlue" :foreground "black")))) 
     (w3m-tab-selected-retrieving ((t (:background "Gray90" :foreground "red" :box (:line-width -1 :style released-button))))) 
     (w3m-tab-unselected ((t (:background "Gray70" :foreground "Gray20" :box (:line-width -1 :style released-button))))) 
     (w3m-tab-unselected-retrieving ((t (:background "Gray70" :foreground "OrangeRed" :box (:line-width -1 :style released-button))))) 
     (w3m-tab-unselected-unseen ((t (:background "Gray70" :foreground "Gray20" :box (:line-width -1 :style released-button))))) 
     (w3m-underline ((t (:underline t)))) 
     (which-func ((t (:background "dark magenta" :foreground "yellow2")))) 
     (widget-button ((t (:bold t :weight bold)))) 
     (widget-button-pressed ((t (:foreground "red1")))) 
     (widget-documentation ((t (:foreground "lime green")))) 
     (widget-field ((t (:background "dim gray")))) 
     (widget-inactive ((t (:foreground "grey70")))) 
     (widget-single-line-field ((t (:background "dim gray")))) 
     (woman-addition ((t (:foreground "yellow")))) 
     (woman-bold ((t (:bold t :foreground "red" :weight bold)))) 
     (woman-italic ((t (:italic t :foreground "green" :underline t :slant italic)))) 
     (woman-unknown ((t (:foreground "blue")))) 
     (wuxch-dired-avi-face ((t (:foreground "yellow" :background "black")))) 
     (wuxch-dired-doc-face ((t (:foreground "white" :background "red")))) 
     (wuxch-dired-elisp-face ((t (:foreground "cyan" :background "black")))) 
     (wuxch-dired-exe-face ((t (:foreground "darkorchid2" :background "wheat")))) 
     (xref-error-face ((t (:foreground "red")))) 
     (xref-keyword-face ((t (:foreground "blue")))) 
     (xref-list-default-face ((t (nil)))) 
     (xref-list-pilot-face ((t (:foreground "navy")))) 
     (xref-list-symbol-face ((t (:foreground "Sienna")))) 
     (yas/field-debug-face ((t (nil)))) 
     (yas/field-highlight-face ((t (:background "DimGrey")))))) 
  (if window-system 
      (color-theme-adjust-hl-line-face))) 
 
(eval-after-load "color-theme" 
  `(add-to-list 'color-themes '(color-theme-ahei "color-theme-ahei" "ahei"))) 
 
(provide 'color-theme-ahei) 
 
;;; color-theme-ahei.el ends here 



