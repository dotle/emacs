;**
;* @file   .emacs
;* @author liurs <>
;* @date   Tue Dec 04 21:17:50 2012
;* 
;* @brief  
;* 
;* 

;;;;∂¡»°Ω≈±æ
(let ((default-directory "d:\\emacs-24.4\\site-lisp"))
(normal-top-level-add-to-load-path '("."))
(normal-top-level-add-subdirs-to-load-path))

(load-file "d:/emacs-24.4/elisp/base.el")
(load-file "d:/emacs-24.4/site-lisp/addon.el")
(load-file "d:/emacs-24.4/elisp/code.el")
(load-file "d:/emacs-24.4/elisp/kbd.el")
(load-file "d:/Emacs-24.4/include.el")

;;********************gnuserv OR server*******************
;(require 'gnuserv)
;(gnuserv-start)
;(server-start)

