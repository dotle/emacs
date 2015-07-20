(setq  my-python-shell-interpreter 
       "C:\\Python33\\python.exe")
(setq  my-python-shell-interpreter-args 
       "-i C:\\Python33\\Scripts\\ipython3-script.py") 
;(setq pdb-path 'python  
;       gud-pdb-command-name (symbol-name pdb-path))

;******************end**********************
(setq my-c++-include-dir-base
	       "
	    C:/MinGW_gcc440_1/mingw44/include
	    c:/MinGW_gcc440_1/mingw44/lib/gcc/mingw32/4.4.0/include
            c:/MinGW_gcc440_1/mingw44/lib/gcc/mingw32/4.4.0/include/c++
            c:/MinGW_gcc440_1/mingw44/lib/gcc/mingw32/4.4.0/include/c++/mingw32
            d:/Qt/4.8.5_mingw/include
	    d:/Qt/4.8.5_mingw/include/QtCore
	    d:/Qt/4.8.5_mingw/include/QtNetwork
            d:/Qt/4.8.5_mingw/include/QtGui
            d:/Qt/4.8.5_mingw/include/QtXml
            d:/Qt/4.8.5_mingw/include/QtXmlPatterns
            d:/Qt/4.8.5_mingw/include/QtSql
            d:/Qt/4.8.5_mingw/include
            d:/Qt/4.8.5_mingw/include/ActiveQt
            d:/Qt/4.8.5_mingw/mkspecs/default
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
