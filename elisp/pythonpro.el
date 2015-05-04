
(require 'python)

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode)
                           interpreter-mode-alist))
(add-hook 'python-mode-hook
           (lambda () (setq forward-sexp-function nil)))



(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
;; never swich to shell when interpreting
(custom-set-variables
'(py-shell-switch-buffers-on-execute nil)) 

(setq python-indent-offset '4)
(setq
;python-shell-interpreter "ipython3"
;python-shell-interpreter-args ""
python-shell-prompt-regexp "In \\[[0-9]+\\]: "
python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
python-shell-completion-setup-code
  "from IPython.core.completerlib import module_completion"
python-shell-completion-module-string-code
  "';'.join(module_completion('''%s'''))\n"
python-shell-completion-string-code
  "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  


       
(defadvice pdb (before gud-query-cmdline activate)
   "Provide a better default command line when called interactively."
   (interactive
    (list (gud-query-cmdline pdb-path
                 (file-name-nondirectory buffer-file-name)))))

     
     
;;;;;;;;;;;;;;;;;python program according to the version and path
(setq  python-shell-interpreter "C:\\Python33\\python.exe")
(setq  python-shell-interpreter-args "-i C:\\Python33\\Scripts\\ipython3-script.py") 
  
(setq pdb-path 'c:\\Python33\\Lib\\pdb.py) 
(setq gud-pdb-command-name (symbol-name pdb-path))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

