

(global-set-key (kbd "C-.") 'find-tag-other-window)
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "C-,") 'sucha-release-small-tag-window)

(defun find-tag-other-window-direct  ()
    (interactive)
    (find-tag-other-window)
    <RET>
 )
(defun rs/find-tag (&optional show-only)
	"Show tag in other window with no prompt in minibuf."
	(interactive)
	(let ((default (funcall (or find-tag-default-function
	(get major-mode 'find-tag-default-function)
	'find-tag-default))))
	(if show-only
	(progn (find-tag-other-window default)
	;(shrink-window (- (window-height) 12)) ;; 限制为 12 行
	(recenter 1)
	(other-window 1)
	)
	(find-tag default))))

(provide 'rs-dev)
