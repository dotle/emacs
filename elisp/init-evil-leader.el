(require 'evil-leader)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(evil-mode)
(evil-leader/set-key
  "r" 'save-buffer
  "k" 'kill-buffer
  "o" 'other-window
  "f" 'moccur-grep-find
  "xg" 'gtags
  "do" 'delete-other-windows
  "dw" 'delete-window
  "lm" 'global-linum-mode
  "xz" 'calendar
  "lb" 'list-bookmarks
  "ur" 'uncomment-region
  "cr" 'comment-region
  "nf" 'refresh-file
  "cd" 'dired
  "sc" 'shell-command
  "SPC" 'delete-trailing-whitespace
  "S" 'eshell
  "xj" '(lambda () (interactive) (rs/find-tag t))

  "te" 'formatCode
  "m" 'compile
  "sd" 'semantic-ia-show-doc
  "ss" 'semantic-ia-show-summary
  "ib"  'ibuffer
  "is"  'ido-switch-buffer
  
  "p" 'evil-jump-item
  "if" 'ido-find-file


  "co" 'recentf-open-files-compl
)

(evil-leader/set-key-for-mode 'c-mode 

  "css" 'cscope-find-this-symbol
  "csd" 'cscope-find-global-definition
  "csg" 'cscope-find-global-definition
  "csG" 'cscope-find-global-definition-no-prompting
  "csc" 'cscope-find-functions-calling-this-function
  "csC" 'cscope-find-called-functions
  "cst" 'cscope-find-this-text-string
  "cse" 'cscope-find-egrep-pattern
  "csf" 'cscope-find-this-file
  "csi" 'cscope-find-files-including-file
  ;; --- (The '---' indicates that this line corresponds to a menu separator.)
  "csb" 'cscope-display-buffer
  "csB" 'cscope-display-buffer-toggle
  "csn" 'cscope-next-symbol
  "csN" 'cscope-next-file
  "csp" 'cscope-prev-symbol
  "csP" 'cscope-prev-file
  "csu" 'cscope-pop-mark
  ;; ---
  "csa" 'cscope-set-initial-directory
  "csA" 'cscope-unset-initial-directory
  ;; ---
  "csL" 'cscope-create-list-of-files-to-index
  "csI" 'cscope-index-files
  "csE" 'cscope-edit-list-of-files-to-index
  "csW" 'cscope-tell-user-about-directory
  "csS" 'cscope-tell-user-about-directory
  "csT" 'cscope-tell-user-about-directory
  "csD" 'cscope-dired-directory
)

(evil-leader/set-key-for-mode 'c++-mode 

  "css" 'cscope-find-this-symbol
  "csd" 'cscope-find-global-definition
  "csg" 'cscope-find-global-definition
  "csG" 'cscope-find-global-definition-no-prompting
  "csc" 'cscope-find-functions-calling-this-function
  "csC" 'cscope-find-called-functions
  "cst" 'cscope-find-this-text-string
  "cse" 'cscope-find-egrep-pattern
  "csf" 'cscope-find-this-file
  "csi" 'cscope-find-files-including-file
  ;; --- (The '---' indicates that this line corresponds to a menu separator.)
  "csb" 'cscope-display-buffer
  "csB" 'cscope-display-buffer-toggle
  "csn" 'cscope-next-symbol
  "csN" 'cscope-next-file
  "csp" 'cscope-prev-symbol
  "csP" 'cscope-prev-file
  "csu" 'cscope-pop-mark
  ;; ---
  "csa" 'cscope-set-initial-directory
  "csA" 'cscope-unset-initial-directory
  ;; ---
  "csL" 'cscope-create-list-of-files-to-index
  "csI" 'cscope-index-files
  "csE" 'cscope-edit-list-of-files-to-index
  "csW" 'cscope-tell-user-about-directory
  "csS" 'cscope-tell-user-about-directory
  "csT" 'cscope-tell-user-about-directory
  "csD" 'cscope-dired-directory
)


(evil-leader/set-key-for-mode 'python-mode
  "cc" 'python-shell-send-buffer
  "cp" 'pdb
)
