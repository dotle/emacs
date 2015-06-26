;;**************************一些基础配置
(setq frame-title-format "%b")      ;; 修改标题栏，显示buffer的名字
(mouse-avoidance-mode 'animate)     ;; 光标靠近鼠标指针时让鼠标指针自己闪开

(defvar MyHome "~/" )



(appt-activate 1)   ;APPOINT

;;****************************desktop
;(require 'session) ;;加载session
;(add-hook 'after-init-hook 'session-initialize) ;; 启动时初始化session


;(setq desktop-base-file-name "emacs-desktop")


;(desktop-load-default) ;;读取默认desktop设置



;;*************backup 策略
;(setq version-control t)
;(setq kept-old-versions 2)
;(setq kept-new-versions 5)
;(setq delete-old-versions t)
(setq backup-directory-alist '(("."."~/emacscat/backup")))


;;****************autocomplete
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat MyHome "ac-dict"))
(ac-config-default)       
(setq ac-auto-start nil)  
(ac-set-trigger-key "<M-return>")
(setq ac-fuzzy-enable t)
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
;(setq ac-dwim t)

(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t

;; ****************************一些基本的小函数
(require 'ahei-misc)

;********************显示行号：
;(setq column-number-mode t)
;(setq line-number-mode t)

;***************** 显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;********************** 关闭启动画面
(setq inhibit-startup-message t)            



;;***********************设置大的kill ring
(setq kill-ring-max 150)
;;************************行号
;(require 'linum)




;********************关闭警告音
(setq visible-bell t)


 



;****************************calendar
(setq diary-file (concat MyHome "diary"))

(add-hook 'diary-hook 'appt-make-list)
  
  


;;*************************speedbar*********************
(require 'speedbar)
(setq speedbar-show-unknown-files t)   
(setq speedbar-tag-hierarchy-method '(speedbar-simple-group-tag-hierarchy) ) 
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(speedbar-add-supported-extension ".cs")   (add-to-list 'speedbar-fetch-etags-parse-list         '("\\.cs" . speedbar-parse-c-or-c++tag))
(speedbar-add-supported-extension ".js")
(speedbar-add-supported-extension ".java")

(global-set-key "\M-s" 'speedbar-get-focus)


;;***********************选择模式****************

(setq transient-mark-mode t)
;;************************用户私人配置
(setq user-full-name "liurs");;用户名
(setq user-mail-address "");;邮箱

;;***********others
(setq suggest-key-bindings 1)
(setq x-select-enable-clipboard t) ;;支持emacs和外部程序的粘贴


;;***************************************************用y-n 取代 yes-no
(fset 'yes-or-no-p 'y-or-n-p)


;;**************ibuffer
(require 'ibuffer)

;;************org mode**************************
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) 
;(setq org-hide-leading-stars t) 
;(setq org-cycle-include-plain-lists t)
;(setq truncate-lines nil)
;(setq org-directory (concat MyHome "gtd/"))
;(setq org-default-notes-file (concat MyHome "/.note"))
;(setq remember-data-file (concat MyHome "/.note"))

;(setq org-log-done t)
;(setq org-agenda-files (list (concat MyHome "gtd/work.org")
;                             (concat MyHome "gtd/home.org")
;			     (concat MyHome "gtd/journal.org")))
			     
(require 'org)			     
			     
			     
;*********************moccur
(require 'moccur-edit)




;;**************bookmark file**********************
(setq bookmark-default-file (concat MyHome "/.emacs.bmk")) 
;;org-remember-templates
;(setq remember-annotation-functions '(org-remember-annotation))
;(setq remember-handler-functions '(org-remember-handler))
;(add-hook 'remember-mode-hook 'org-remember-apply-template)
;(setq org-remember-templates '(("todo" ?t "* TODO %?\n  %x\n" "work.org" "task")
;			       ("idea" ?i "* %?\n %x\n" "work.org" "idea")
;			       ("home" ?h "* TODO %?\n %x\n" "home.org" "TodoList")
;			       ("journal" ?j "* %T %? :journal:%^G\n %x\n" "journal.org" "journal")
;			       ("Diary" ?d "* %^{Topic} :NOTE:%^G\n :PROPERTIES:\n :Created:%T\n :END:\n %?\n %x\n" "diary.org")
;			       ("Meeting" ?m "* %^{Topic} :MEETING:%^G\n :Date:%t\n :People:%^{people}\n :Addr:%^{Addr}\n %?\n %x\n" "journal.org" "journal")))

;; *******************************利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

;;******************************** color theme Emacs主题,很多face文件
(require 'color-theme) 
(color-theme-initialize) 
(color-theme-gnome2)


;; *****************************高亮当前行
(require 'hl-line-settings)
(require 'highlight-symbol-settings)
;**************;; 把文件或buffer彩色输出成html
(require 'htmlize)


;;*************************** 启动Emacs的时候最大化Emacs


(defun dos2unix ()
  "dos2unix on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

(defun unix2dos ()
  "unix2dos on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))
;;*************************************other
;;*************************************高亮显示成对括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;********************************自动的在文件末增加一新行
(setq require-final-newline t)


;;****************************可以把光标由方块变成一个小长条
(require 'bar-cursor)
(bar-cursor-mode 1)
;;*************************************不显示TOOLBAR
(tool-bar-mode -1)

;; 修正windos emacs find-grep 输出NULL
;; Prevent issues with the Windows null device (NUL)
;; when using cygwin find with rgrep.
(if (equal system-type 'windows-nt)
    (progn
      (defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
        "Use cygwin's /dev/null as the null-device."
        (let ((null-device "/dev/null"))
          ad-do-it))
      (ad-activate 'grep-compute-defaults)))

;; 中英文字体配置


;; ffap,打开当前point的文件 
(require 'ffap-settings) 


;; Emacs超强的增量搜索Isearch配置 
(require 'isearch-settings)  

;; 显示ascii表 
(require 'ascii)                   


;;************************
  (setq w32-pass-rwindow-to-system nil)  
  (setq w32-rwindow-modifier 'hyper)  
  (setq w32-pass-lwindow-to-system nil)  
  (setq w32-lwindow-modifier 'hyper) 

(require 'ido)
(ido-mode t)
(setq ido-last-directory-list nil)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; 不生成名为#filename#的临时文件
(setq auto-save-default nil)
;; 自动保存
;(setq auto-save-mode nil)
;;自动重载更改的文件
(global-auto-revert-mode 1)


;;**************evil
(require 'evil)
(evil-mode 1) ;以上的是设置启动emacs载入evil 


;(setq evil-default-state 'emacs)
;这个是打开文件后默认进入emacs模式
;我还要在emacs和vim模式里面切换：C-z，换来换去啊

(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
; C-o按键调用vim功能（就是临时进入normal模式，然后自动回来）
; 比如，你要到第一行，可以使用emacs的 M-<，也可以使用evil的C-o gg
; 其中C-o是进入vim模式 gg是去第一行，命令之后自动还原emacs模式！
; "Fuck you!" 如何删除""里面的内容呢？Emacs的话，默认文本对象能力不强
; 有了evil的拓展 C-o di" 轻轻松松搞定~
; 比如C-o 3dd C-o dib C-o yy C-o p C-o f * 舒服啊~发挥想象力吧

; 下面4行是设置使用C-d作为ESC按键，这个自己看吧
;(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
;(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
;(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
;(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

; 以下设置时使用t作为多剪贴板的起始按键，比如 tay(不是 "ay哦) tap(就是"ap啦)~
(define-key evil-normal-state-map "t" 'evil-use-register)

; 注意，如果有什么bug的话，把这个函数也添加了
; evil作者给的代码，不知道有没有添加到插件里面去
(defun evil-execute-in-normal-state ()
"Execute the next command in Normal state. C-o o works in insert-mode"
(interactive)
(evil-delay '(not (memq this-command
'(evil-execute-in-normal-state
evil-use-register
digit-argument
negative-argument
universal-argument
universal-argument-minus
universal-argument-more
universal-argument-other-key)))
`(progn
(if (evil-insert-state-p)
(let ((prev-state (cdr-safe (assoc 'normal evil-previous-state-alist))))
(evil-change-state prev-state)
(setq evil-previous-state 'normal))
(evil-change-to-previous-state))
(setq evil-move-cursor-back ',evil-move-cursor-back))
'post-command-hook)
(setq evil-move-cursor-back nil)
(evil-normal-state)
(evil-echo "Switched to Normal state for the next command ...")) 

;*********************  MarkDown  *******************
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;******************git**************************
(require 'git-emacs)

;******************
(require 'unicad)
