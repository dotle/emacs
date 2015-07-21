(require 'company)

(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil)
(setq company-minimum-prefix-length 2)
(dolist (company-hook-list(list
'emacs-lisp-mode-hook
'lisp-mode-hook
'lisp-interaction-mode-hook
'c-mode-common-hook
))
(setq company-show-numbers t)
(add-hook company-hook-list 'company-mode))
;(setq company-clang-arguments my-c++-include-dir-I)
;(global-set-key "\M-[" 'company-clang)
(global-set-key "\M-/" 'company-complete-common)
(setq company-dabbrev-ignore-case t)
;**********************************c - head complete******
(require 'company-c-headers)
(setq company-c-headers-path-system my-c++-include-dir)
;(global-set-key "\M-]" 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
