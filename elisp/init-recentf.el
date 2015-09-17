(recentf-mode 1)
(setq recentf-max-saved-items 1000)
;      recentf-exclude '("/tmp/" "/ssh:"))


;(provide 'init-recentf)
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
	 (tocpl (mapcar (function 
			 (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
	 (prompt (append '("File name: ") tocpl))
	 (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl))))) 

(global-set-key [(control x)(control r)] 'recentf-open-files-compl)
