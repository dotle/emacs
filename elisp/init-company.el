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
;(setq company-show-numbers t)
(add-hook company-hook-list 'company-mode))
;(setq company-clang-arguments '(
;				"-IC:\\mingw44\\include"
;				"-Ic:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include"
;				"-Ic:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++"
;				"-Ic:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++\\mingw32"
;				"-Ic:\\Qt\\4.8.5\\include"
;				"-Ic:\\Qt\\4.8.5\\include\\QtCore"
;				"-Ic:\\Qt\\4.8.5\\include\\QtNetwork"
;				"-Ic:\\Qt\\4.8.5\\include\\QtGui"
;				"-Ic:\\Qt\\4.8.5\\include\\QtXml"
;				"-Ic:\\Qt\\4.8.5\\include\\QtXmlPatterns"
;				"-Ic:\\Qt\\4.8.5\\include\\QtSql"
;				"-Ic:\\Qt\\4.8.5\\include"
;				"-Ic:\\Qt\\4.8.5\\include\\ActiveQt"
;				"-Ic:\\Qt\\4.8.5\\mkspecs\\default"
;				"-I."
;				"-I./GeneratedFiles"
;))
;(setq company-clang-arguments ac-clang-flags)
(setq company-clang-arguments my-c++-include-dir)
(global-set-key "\M-[" 'company-clang)
(global-set-key "\M-," 'company-complete-common)
