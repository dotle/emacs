(defun setup-program-keybindings()
  ;;;; Common program-keybindings
  (interactive)
;  (global-set-key "\C-cR" 'yc/symref)
;  (global-set-key "\C-cb" 'semantic-mrub-switch-tags)
;  (global-set-key "\C-c\C-j" 'yc/goto-func-any)
  (global-set-key "\C-cj" 'evil-jump-to-tag)
  (global-set-key "\C-ci" 'pop-tag-mark)
  (global-set-key [f12] 'yc/goto-func)
  (global-set-key "\C-c\C-j" 'yc/goto-func)
  (global-set-key "\C-c\C-m" 'yc/goto-func)
  (global-set-key "\C-c\C-k" 'yc/return-func)
  (global-set-key "\C-c\C-i" 'yc/return-func)
  (global-set-key [M-f12] 'yc/return-func)    
  (global-set-key "\C-cp" 'semantic-ia-show-summary)
  (global-set-key "\C-cl" 'semantic-ia-show-doc)
;  (global-set-key "\C-c\C-f" 'formatCode)
;  (global-set-key "\C-ckr" 'desktop-read)
;  (global-set-key "\C-cks" 'desktop-save)
  (global-set-key "\C-cf" 'moccur-grep-find)
;  (local-set-key [M-S-f12] 'yc/return-func)
;  (local-set-key (kbd "C-x SPC") 'yc/store-mru-tag)
;  (global-set-key "\M-e" 'ecb-goto-window-edit-last) ;;�л����༭����
;  (global-set-key "\M-m" 'ecb-goto-window-methods) ;;�л�����������
;  (global-set-key "\M-s" 'ecb-goto-window-sources) ;;�л�����������
)
(setup-program-keybindings)
(global-set-key "\C-c\C-g" 'gtags)

;;;; ECB�����ڼ��л�
;(global-set-key [M-left] 'windmove-left)
;(global-set-key [M-right] 'windmove-right)
;(global-set-key [M-up] 'windmove-up)
;(global-set-key [M-down] 'windmove-down) 

;(global-set-key "\M-[" 'windmove-left)
;(global-set-key "\M-]" 'windmove-right)
;(global-set-key (kbd "C-{") 'windmove-up)
;(global-set-key (kbd "C-}") 'windmove-down) 

 
;(global-set-key [f12] 'ecb-activate) ;;����F12��Ϊ����ecb
;(global-set-key [C-f12] 'ecb-deactivate) ;;����Ctrl+F12Ϊֹͣecb
(global-set-key "\C-h\C-y" 'delete-other-windows) ;;����F11Ϊɾ����������
;(global-set-key [(meta return)] 'semantic-ia-complete-symbol-menu) ;;����Alt+EnterΪ�Զ���ȫ�˵�

(global-set-key [(control return)] 'auto-complete) 
;(global-set-key "\M-," 'complete-symbol)



(global-set-key "\C-czc" 'calendar)  ;CALENDAR
(global-set-key "\C-cx" 'global-linum-mode)


;*****************bookmark
(global-set-key "\C-czb" 'list-bookmarks)  

(global-set-key (kbd "C-x C-b") 'ibuffer)


;;*************tags
(global-set-key (kbd "\C-ct") 'visit-tags-table)    ; visit tags table
(global-set-key "\C-xj" '(lambda () (interactive) (rs/find-tag t)))
;(global-set-key "\M-]" 'rs/find-tag)
(global-set-key (kbd "M-o") 'pop-tag-mark)
;(global-set-key (kbd "M-,") 'sucha-release-small-tag-window)
(global-set-key (kbd "C-c C-r") 'uncomment-region) 

(defun sucha-release-small-tag-window ()
"Kill other window also pop tag mark."
(interactive)
(delete-other-windows)
(ignore-errors
(pop-tag-mark)))



(defun gtags ()
  (interactive )
  (shell-command "gtag") )
  

(defun qmake ()
  (interactive )
  (shell-command "qmake -makefile") )

  (global-set-key (kbd "\C-czg") 'gtags)


(defun q-project()
  (interactive )
  (shell-command "qmake -project") )

;;c-f5 ˢ��
(defun refresh-file ()  
  (interactive)  
  (revert-buffer t (not (buffer-modified-p)) t))  

(global-set-key [(control f5)] 'refresh-file)  



;;-----------------redo
;(require 'redo)
;(global-set-key [f10] 'redo)
;(global-set-key [C-f10] 'undo)


;;C-z ���ñ��
;(global-set-key "\C-h;" 'set-mark-command)
(global-set-key "\C-h;" 'kill-buffer)
;;�رյ�ǰ����,alt+4
;(global-set-key (kbd "M-4") 'delete-window)
;;(global-set-key (kbd "M-4") 'kill-this-buffer)
;;�ر���������,alt+1
;(global-set-key (kbd "M-1") 'delete-other-windows)
;;ˮƽ�ָ��,alt+2
;(global-set-key (kbd "M-2") 'split-window-vertically)
;;��ֱ�ָ��,alt+3
;(global-set-key (kbd "M-3") 'split-window-horizontally)
;;�л����������ڣ�alt+0
;(global-set-key (kbd "M-0") 'other-window)
(global-set-key "\C-h\C-o" 'other-window)
(global-set-key "\C-h\C-i" 'evil-mode)
;;��ʾ��������������
;(global-set-key (kbd "M-5") 'display-buffer-name)

;; 
;;����home��ָ��buffer��ͷ��end��ָ��buffer��β
(global-set-key [home] 'beginning-of-buffer) ;
(global-set-key [end] 'end-of-buffer)


;;����[C-f9]Ϊ����dired����
(global-set-key "\C-ce" 'dired)

;;F6��ʾ/���ع����� �������
(global-set-key  "\C-cw" 'tool-bar-mode)

;***************************orgmode
;(define-key global-map "\C-czz" 'org-remember)
;(define-key global-map "\C-czr" 'org-reload)
(define-key global-map "\C-czs" 'shell-command)
;(define-key global-map "\C-czf" 'flymake-mode)
(define-key global-map "\C-czt" 'taglist)
;(define-key global-map "\C-cs" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-c\C-v" 'other-window)
 (global-set-key "\C-cze" 'formatCode)
(global-set-key "\C-h\C-j" 'ibuffer)
(global-set-key "\C-hj" 'ido-switch-buffer)
;(global-set-key "\C-c\C-o" 'find-file-at-point)
;(define-key  global-map (kbd "C-c M-a")   'flymake-goto-next-error-disp)
;(define-key global-map (kbd "C-c M-f")   'flymake-goto-prev-error-disp)
;(define-key global-map (kbd "C-c C-z") 	'flymake-display-current-warning/error)

(global-set-key "\C-cc" 'compile)
(global-set-key "\C-h\C-l" 'compile)
(global-set-key "\C-cg" 'gdb)



;��Ӷϵ� 							gud-break C-x C-a C-b �� C-x <SPC> 
;ɾ���ϵ�			 					gud-remove C-x C-a C-d 
;����/�������� 					gud-go �� 
;����ִ�У����Ӻ��� 		gud-next C-x C-a C-n 
;����ִ�У����뺯�� 		gud-step C-x C-a C-s 
;������ǰ���� 					gud-finish C-x C-a C-f 
;���е����������� 		gud-until C-x C-a C-u 
;�������г��� 					gud-cont C-x C-a C-r 



(add-hook 'gdb-mode-hook (lambda ()
                            (global-set-key (kbd "<f5>") 'gud-go) 
                            (global-set-key (kbd "C-x C-a C-g") 'gud-go)
			    (global-set-key (kbd "<f6>") 'gud-cont) ;C-x C-a C-r 
					(global-set-key (kbd "C-x C-a C-r") 'gud-run) ;C-x C-a C-r //
					;(global-set-key (kbd "<f7>") 'compile)
			    (global-set-key (kbd "<f9>") 'gud-break) ;C-x C-a C-b
			    (global-set-key (kbd "<C-f9>") 'gud-remove) ;C-x C-a C-d 
			    (global-set-key (kbd "<S-f9>") 'gud-print) ;C-x C-a C-p //
			    (global-set-key (kbd "C-x C-a C-q") 'gud-print) ;C-x C-a C-p //
			    (global-set-key (kbd "<f10>") 'gud-next) ;C-x C-a C-n //
			    (global-set-key (kbd "C-x C-a C-c") 'gud-next) ;C-x C-a C-n //
			    (global-set-key (kbd "<f11>") 'gud-step) ;C-x C-a C-s
			    (global-set-key (kbd "C-x C-a C-v") 'gud-step) ;C-x C-a C-s
			    (global-set-key (kbd "<S-f10>") 'gud-jump) ;C-x C-a C-j//
			    (global-set-key (kbd "C-x C-a C-z") 'gud-jump) ;C-x C-a C-j//
			    (global-set-key (kbd "<C-f11>") 'gud-finish);C-x C-a C-f
			    (global-set-key (kbd "<f8>") 'gud-watch);C-x C-a C-w /C-c C-w 
			    (global-set-key (kbd "<C-f6>") 'gud-until);C-x C-a C-u//
			    (global-set-key (kbd "<C-f7>") 'gud-tooltip-mode)
			    (global-set-key (kbd "C-x C-a C-e") 'gdb-many-windows)
			    (global-set-key (kbd "<C-f8>") 'gdb-many-windows)
					;(global-set-key (kbd "C-x C-a C-a") 'gdb-many-windows)
			    ))

