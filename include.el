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
	    C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include
            C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++
            C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++\\mingw32
            C:\\Qt\\4.8.7_vs2010\\include
	    C:\\Qt\\4.8.7_vs2010\\include\\QtCore
	    C:\\Qt\\4.8.7_vs2010\\include\\QtNetwork
            C:\\Qt\\4.8.7_vs2010\\include\\QtGui
            C:\\Qt\\4.8.7_vs2010\\include\\QtXml
            C:\\Qt\\4.8.7_vs2010\\include\\QtXmlPatterns
            C:\\Qt\\4.8.7_vs2010\\include\\QtSql
            C:\\Qt\\4.8.7_vs2010\\include
            C:\\Qt\\4.8.7_vs2010\\include\\ActiveQt
            C:\\Qt\\4.8.7_vs2010\\mkspecs\\default
            .
            ./GeneratedFiles
            "															                                 
))) 
