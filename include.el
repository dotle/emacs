;******************************cedet
(defconst user-include-dirs
  (list ".." ))
(defconst win32-include-dirs
  (list	""
	))
(let ((include-dirs user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;end cedet

;******************************python program
(setq                                                 
  python-shell-interpreter "C:\\Python33\\python.exe"
  python-shell-interpreter-args                      
  "-i C:\\Python33\\Scripts\\ipython3-script.py") 
  
;(setq pdb-path 'python  
;       gud-pdb-command-name (symbol-name pdb-path))

;******************end**********************
(setq ac-clang-flags 
      (mapcar (lambda (item)(concat "-I" item))
	      (split-string
	       "
        C:\\mingw44\\include
	    d:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include
            d:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++
            d:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++\\mingw32
            d:\\Qt\\4.8.5_mingw\\include
	    d:\\Qt\\4.8.5_mingw\\include\\QtCore
	    d:\\Qt\\4.8.5_mingw\\include\\QtNetwork
            d:\\Qt\\4.8.5_mingw\\include\\QtGui
            d:\\Qt\\4.8.5_mingw\\include\\QtXml
            d:\\Qt\\4.8.5_mingw\\include\\QtXmlPatterns
            d:\\Qt\\4.8.5_mingw\\include\\QtSql
            d:\\Qt\\4.8.5_mingw\\include
            d:\\Qt\\4.8.5_mingw\\include\\ActiveQt
            d:\\Qt\\4.8.5_mingw\\mkspecs\\default
            .
            ./GeneratedFiles
            "															                                 
))) 
