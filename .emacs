;**
;* @file   .emacs
;* @author liurs <>
;* @date   Tue Dec 04 21:17:50 2012
;*
;* @brief
;*
;*

;;;;∂¡»°Ω≈±æ
(let ((default-directory "c:\\emacs\\site-lisp"))
(normal-top-level-add-to-load-path '("."))
(normal-top-level-add-subdirs-to-load-path))

(add-to-list 'custom-theme-load-path "c:/emacs/site-lisp/themes/")


(load-file "c:/Emacs/include.el")
(load-file "c:/emacs/elisp/base.el")
(load-file "c:/emacs/elisp/init-pair.el")
(load-file "c:/emacs/site-lisp/addon.el")
(load-file "c:/emacs/elisp/code.el")
(load-file "c:/emacs/elisp/kbd.el")
(load-file "c:/emacs/elisp/pythonpro.el")
(load-file "c:/Emacs/elisp/init-company.el")
(load-file "c:/emacs/elisp/init-web.el")
(load-file "c:/emacs/elisp/init-csharp.el")
(load-file "c:/emacs/elisp/init-ctype.el")
(load-file "c:/emacs/elisp/init-theme.el")
(load-file "c:/emacs/elisp/init-protobuf.el")
(load-file "c:/emacs/elisp/init-ido.el")
(load-file "c:/emacs/elisp/init-recentf.el")
(load-file "c:/emacs/elisp/init-evil-surround.el")
(load-file "c:/emacs/elisp/init-evil-leader.el")
;;********************gnuserv OR server*******************
;(require 'gnuserv)
;(gnuserv-start)
;(server-start)
