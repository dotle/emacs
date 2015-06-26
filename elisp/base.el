;;**************************һЩ��������
(setq frame-title-format "%b")      ;; �޸ı���������ʾbuffer������
(mouse-avoidance-mode 'animate)     ;; ��꿿�����ָ��ʱ�����ָ���Լ�����

(defvar MyHome "~/" )



(appt-activate 1)   ;APPOINT

;;****************************desktop
;(require 'session) ;;����session
;(add-hook 'after-init-hook 'session-initialize) ;; ����ʱ��ʼ��session


;(setq desktop-base-file-name "emacs-desktop")


;(desktop-load-default) ;;��ȡĬ��desktop����



;;*************backup ����
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
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; �б���ͨ����M-n�������ƶ�
(define-key ac-completing-map "\M-p" 'ac-previous)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
;(setq ac-dwim t)

(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t

;; ****************************һЩ������С����
(require 'ahei-misc)

;********************��ʾ�кţ�
;(setq column-number-mode t)
;(setq line-number-mode t)

;***************** ��ʾʱ��
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;********************** �ر���������
(setq inhibit-startup-message t)            



;;***********************���ô��kill ring
(setq kill-ring-max 150)
;;************************�к�
;(require 'linum)




;********************�رվ�����
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


;;***********************ѡ��ģʽ****************

(setq transient-mark-mode t)
;;************************�û�˽������
(setq user-full-name "liurs");;�û���
(setq user-mail-address "");;����

;;***********others
(setq suggest-key-bindings 1)
(setq x-select-enable-clipboard t) ;;֧��emacs���ⲿ�����ճ��


;;***************************************************��y-n ȡ�� yes-no
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

;; *******************************����`eval-after-load'�ӿ������ٶȵĿ�
;; ��eval-after-load���ⲻ��Ҫ��elisp���ļ���
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

;;******************************** color theme Emacs����,�ܶ�face�ļ�
(require 'color-theme) 
(color-theme-initialize) 
(color-theme-gnome2)


;; *****************************������ǰ��
(require 'hl-line-settings)
(require 'highlight-symbol-settings)
;**************;; ���ļ���buffer��ɫ�����html
(require 'htmlize)


;;*************************** ����Emacs��ʱ�����Emacs


(defun dos2unix ()
  "dos2unix on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

(defun unix2dos ()
  "unix2dos on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))
;;*************************************other
;;*************************************������ʾ�ɶ�����
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;********************************�Զ������ļ�ĩ����һ����
(setq require-final-newline t)


;;****************************���԰ѹ���ɷ�����һ��С����
(require 'bar-cursor)
(bar-cursor-mode 1)
;;*************************************����ʾTOOLBAR
(tool-bar-mode -1)

;; ����windos emacs find-grep ���NULL
;; Prevent issues with the Windows null device (NUL)
;; when using cygwin find with rgrep.
(if (equal system-type 'windows-nt)
    (progn
      (defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
        "Use cygwin's /dev/null as the null-device."
        (let ((null-device "/dev/null"))
          ad-do-it))
      (ad-activate 'grep-compute-defaults)))

;; ��Ӣ����������


;; ffap,�򿪵�ǰpoint���ļ� 
(require 'ffap-settings) 


;; Emacs��ǿ����������Isearch���� 
(require 'isearch-settings)  

;; ��ʾascii�� 
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


;; ��������Ϊ#filename#����ʱ�ļ�
(setq auto-save-default nil)
;; �Զ�����
;(setq auto-save-mode nil)
;;�Զ����ظ��ĵ��ļ�
(global-auto-revert-mode 1)


;;**************evil
(require 'evil)
(evil-mode 1) ;���ϵ�����������emacs����evil 


;(setq evil-default-state 'emacs)
;����Ǵ��ļ���Ĭ�Ͻ���emacsģʽ
;�һ�Ҫ��emacs��vimģʽ�����л���C-z��������ȥ��

(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
; C-o��������vim���ܣ�������ʱ����normalģʽ��Ȼ���Զ�������
; ���磬��Ҫ����һ�У�����ʹ��emacs�� M-<��Ҳ����ʹ��evil��C-o gg
; ����C-o�ǽ���vimģʽ gg��ȥ��һ�У�����֮���Զ���ԭemacsģʽ��
; "Fuck you!" ���ɾ��""����������أ�Emacs�Ļ���Ĭ���ı�����������ǿ
; ����evil����չ C-o di" �������ɸ㶨~
; ����C-o 3dd C-o dib C-o yy C-o p C-o f * �����~������������

; ����4��������ʹ��C-d��ΪESC����������Լ�����
;(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
;(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
;(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
;(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

; ��������ʱʹ��t��Ϊ����������ʼ���������� tay(���� "ayŶ) tap(����"ap��)~
(define-key evil-normal-state-map "t" 'evil-use-register)

; ע�⣬�����ʲôbug�Ļ������������Ҳ�����
; evil���߸��Ĵ��룬��֪����û����ӵ��������ȥ
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
