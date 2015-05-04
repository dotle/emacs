;******************************cedet
(defconst user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst win32-include-dirs
  (list "C:/MinGW44/include"
        "C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include"
        "C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++"
        "C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++\\mingw32"
        "C:\\Qt\\4.8.5\\include"
	"C:\\Qt\\4.8.5\\include\\QtCore"
	"C:\\Qt\\4.8.5\\include\\QtNetwork"
	"C:\\Qt\\4.8.5\\include\\QtGui"
	"C:\\Qt\\4.8.5\\include\\QtXml"
	"C:\\Qt\\4.8.5\\include\\QtXmlPatterns"
	"C:\\Qt\\4.8.5\\include\\QtSql"
	"C:\\Qt\\4.8.5\\include"
	"C:\\Qt\\4.8.5\\include\\ActiveQt"
	"C:\\Qt\\4.8.5\\mkspecs\\default"
        "D:\\Program Files\\Microsoft Visual Studio 9.0\\VC\\atlmfc\\include"
	"D:\\Program Files\\Microsoft Visual Studio 9.0\\VC\\atlmfc\\src\\atl"
	"D:\\Program Files\\Microsoft Visual Studio 9.0\\VC\\atlmfc\\src\\atl"
	"D:\\Program Files\\Microsoft Visual Studio 9.0\\VC\\crt\\src"
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
  
(setq pdb-path 'c:\\Python33\\Lib\\pdb.py 
       gud-pdb-command-name (symbol-name pdb-path))

;******************end**********************
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
	      (split-string
	       "
        C:\\mingw44\\include
	    C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include
            C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++
            C:\\mingw44\\lib\\gcc\\mingw32\\4.4.0\\include\\c++\\mingw32
            C:\\Qt\\4.8.5\\include
	    C:\\Qt\\4.8.5\\include\\QtCore
	    C:\\Qt\\4.8.5\\include\\QtNetwork
            C:\\Qt\\4.8.5\\include\\QtGui
            C:\\Qt\\4.8.5\\include\\QtXml
            C:\\Qt\\4.8.5\\include\\QtXmlPatterns
            C:\\Qt\\4.8.5\\include\\QtSql
            C:\\Qt\\4.8.5\\include
            C:\\Qt\\4.8.5\\include\\ActiveQt
            C:\\Qt\\4.8.5\\mkspecs\\default
            .
            ./GeneratedFiles
            "															                                 
            ))) 
