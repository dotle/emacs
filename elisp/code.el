  ;;***************************************************************
(require 'xcscope) ;;加载xcscope
(setq semantic-default-submodes '(
				  global-semanticdb-minor-mode
				  global-semantic-idle-scheduler-mode
				  global-semantic-idle-summary-mode
				  ;global-semantic-idle-completions-mode
				  ;global-semantic-decoration-mode
				  global-semantic-highlight-func-mode
				  ;global-semantic-stickyfunc-mode
				  global-semantic-mru-bookmark-mode
				  ))
(semantic-mode 1)
(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
;(global-semantic-show-parser-state-mode 1)
(require 'semantic/analyze/refs)
(setq semantic-c-obey-conditional-section-parsing-flag nil) 
;;;; TAGS Menu
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'my-semantic-hook)

;;;; Semantic DataBase存储位置
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/semanticdb"))
(require 'semantic/sb)

;******************************cedet
(defconst user-include-dirs
  (list ".." ))
(defconst win32-include-dirs
  (list	""
	))
(let ((include-dirs user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;end cedet

;******************************python program
;;*********************************cedet
;(add-to-list 'load-path   "../site-lisp/cedet-1.1/common")
;
;(load-file "../site-lisp/cedet-1.1/common/cedet.el")
;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-gaudy-code-helpers)      ; Enable prototype help and smart completion 
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)
;(global-ede-mode 1)                      ; Enable the Project management system
;(global-semantic-mru-bookmark-mode 1)
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;(enable-visual-studio-bookmarks)
;(require 'eassist nil 'noerror)
;
;
;(setq semanticdb-default-save-directory (concat MyHome "/semantic"));; 指定semantic临时文件的路径，避免到处都是临时文件
;
;(setq eassist-header-switches
;     '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
;       ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
;       ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
;       ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
;       ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
;       ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
;       ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
;       ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
;       ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
;       ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
;       ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
;       ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
;       ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
;       ("c" . ("h"))
;       ("m" . ("h"))
;       ("mm" . ("h"))))
;;;代码折叠
;;;(require 'semantic-tag-folding nil 'noerror)
;;;(global-semantic-tag-folding-mode 1)
;;;(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
;;;(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
;;;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
;;;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)
;;;(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode);;C-?定义为semantic-tag-folding-mode的切换键
;;;
(defvar mru-tag-stack '()
  "Tag stack, when jumping to new tag, current tag will be stored here,
and when jumping back, it will be removed.")

(defun yc/store-mru-tag (pt)
  "Store tag info into mru-tag-stack"
  (interactive "d")
  (let* ((tag (semantic-mrub-find-nearby-tag pt)))
    (if tag
        (let ((sbm (semantic-bookmark (semantic-tag-name tag)
                                      :tag tag)))
          (semantic-mrub-update sbm pt 'mark)
          (add-to-list 'mru-tag-stack sbm)
          )
      (error "No tag to go!")))
  )

(defun yc/goto-func (pt)
  "Store current postion and call (semantic-ia-fast-jump)"
  (interactive "d")
  (yc/store-mru-tag pt)
  (semantic-ia-fast-jump pt)
)

(defun yc/goto-func-any (pt)
  "Store current postion and call (semantic-ia-fast-jump)"
  (interactive "d")
  (yc/store-mru-tag pt)
  (semantic-complete-jump)
  )

(defun yc/symref (pt)
  (interactive "d")
  (yc/store-mru-tag pt)
  (semantic-symref))

(defun yc/return-func()
  "Return to previous tag."
  (interactive)
  (if (car mru-tag-stack)
      (semantic-mrub-switch-tags (pop mru-tag-stack))
    (error "TagStack is empty!")))
 
    
;;******************格式化代码
(defun formatCode ()
  (interactive )
  (shell-command-on-region (point-min) (point-max) 
                           "astyle --style=ansi -U -p -f"
                           (current-buffer) t 
                           (get-buffer-create "*Astyle Errors*") t))


;******************ECB
;(require 'ecb) ;;加载ecb
(setq stack-trace-on-error t)

 
;;;; 自动启动ecb，并且不显示每日提示
;;(setq ecb-auto-activate t
(setq  ecb-tip-of-the-day nil)
;;;; 各窗口间切换
;(global-set-key [M-left] 'windmove-left)
;(global-set-key [M-right] 'windmove-right)
;(global-set-key [M-up] 'windmove-up)
;(global-set-key [M-down] 'windmove-down) 
 


;;************************缩进风格
(defun my-build-tab-stop-list (width)   
  (let ((num-tab-stops (/ 80 width))     
  (counter 1)    
  (ls nil))     
  (while (<= counter num-tab-stops)      
  (setq ls (cons (* width counter) ls))       
  (setq counter (1+ counter)))     
  (set (make-local-variable 'tab-stop-list) 
  (nreverse ls)))) 
(defun my-c-mode-common-hook ()   
  ;;(c-set-style "google")  
  (setq tab-width 4) ;; change this to taste, this is what K&R uses 
  (my-build-tab-stop-list tab-width)   
  (setq c-basic-offset tab-width)  
  (setq indent-tabs-mode nil) ;; force only spaces for indentation   
  (local-set-key (kbd "C-'") 'ff-get-other-file)   
  (c-set-offset 'substatement-open 0)   
  ;;(arglist-intro . c-lineup-arglist-intro-after-paren)
  (c-set-offset 'arglist-intro 'c-lineup-arglist-intro-after-paren)  
  ) 
;; google sytle is defined in above function
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook) 
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook) 
;;(add-hook 'c-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) ;;设置C语言默认格式
;;(add-hook 'c++-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) ;;设置C++语言默认格式
(add-to-list 'auto-mode-alist (cons "\\.h$" #'c++-mode))
(add-to-list 'auto-mode-alist (cons "\\.pde$" #'c++-mode))
(add-to-list 'auto-mode-alist (cons "\\.ino$" #'c++-mode))




;;**************YASNIPPET
(require 'yasnippet-bundle)


;;*******************doxymacs
(require 'doxymacs) ;; 启动doxymacs
(add-hook 'c-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode
(add-hook 'c++-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode

;; 增加更丰富的高亮
(require 'generic-x)
;;==============================================================
;;gdb-UI配置
;;==============================================================
(setq gdb-many-windows t)




;; 加载clang  
;(require 'flymake-clang)
;(flymake-clang)

(require 'rs-dev)

(require 'taglist)


(defun flymake-create-temp-inplace (file-name prefix)
  "Return file name in temporary directory for checking FILE-NAME.
This is a replacement for `flymake-create-temp-inplace'. The
difference is that it gives a file name in
`temporary-file-directory' instead of the same directory as
FILE-NAME.

For the use of PREFIX see that function.

Note that not making the temporary file in another directory
\(like here) will not if the file you are checking depends on
relative paths to other files \(for the type of checks flymake
makes)."
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((name (concat
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" prefix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file name nil ext))
         )
    (flymake-log 3 "create-temp-intemp: file=%s temp=%s" file-name temp-name)
    temp-name))
;(setq flymake-create-temp-inplace  flymake-create-temp-intemp)    
(setq temporary-file-directory "d:/tmp/")

(require 'auto-complete-clang)    
;;(setq ac-clang-auto-save t)    
;; 设置不自动启动  
(setq ac-auto-start nil)    
;; 设置响应时间 0.5  
(setq ac-quick-help-delay 0.5)    
;;(ac-set-trigger-key "TAB")    
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)    
;; 提示快捷键为 M-/  
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)   
 ;(setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
 
 
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers ac-source-filename))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-filename))))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)

(setq ac-clang-flags my-c++-include-dir)
