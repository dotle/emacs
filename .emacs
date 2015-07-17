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

(load-file "c:/Emacs/include.el")
(load-file "c:/emacs/elisp/base.el")
(load-file "c:/emacs/site-lisp/addon.el")
(load-file "c:/emacs/elisp/code.el")
(load-file "c:/emacs/elisp/kbd.el")
(load-file "c:/emacs/elisp/pythonpro.el")
(load-file "c:/Emacs/elisp/init-company.el")
;;********************gnuserv OR server*******************
;(require 'gnuserv)
;(gnuserv-start)
;(server-start)

