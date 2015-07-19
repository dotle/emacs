(setq  my-python-shell-interpreter 
       "C:\\Python33\\python.exe")
(setq  my-python-shell-interpreter-args 
       "-i C:\\Python33\\Scripts\\ipython3-script.py") 
;(setq pdb-path 'python  
;       gud-pdb-command-name (symbol-name pdb-path))

;******************end**********************
(setq my-c++-include-dir-base
	       "
	    C:/mingw44/include
	    c:/mingw44/lib/gcc/mingw32/4.4.0/include
            c:/mingw44/lib/gcc/mingw32/4.4.0/include/c++
            c:/mingw44/lib/gcc/mingw32/4.4.0/include/c++/mingw32
            c:/Qt/4.8.5/include
	    c:/Qt/4.8.5/include/QtCore
	    c:/Qt/4.8.5/include/QtNetwork
            c:/Qt/4.8.5/include/QtGui
            c:/Qt/4.8.5/include/QtXml
            c:/Qt/4.8.5/include/QtXmlPatterns
            c:/Qt/4.8.5/include/QtSql
            c:/Qt/4.8.5/include
            c:/Qt/4.8.5/include/ActiveQt
            c:/Qt/4.8.5/mkspecs/default
            .
            ./GeneratedFiles
            "															                                 
)

(setq my-c++-include-dir-I
      (mapcar (lambda (item)(concat "-I" item))
	      (split-string
	       my-c++-include-dir-base
)))

(setq my-c++-include-dir
      (mapcar (lambda (item)(concat "" item))
	      (split-string
	       my-c++-include-dir-base
)))

(setq my-c++-include-dir-for-head
	      (split-string my-c++-include-dir-base)
)
