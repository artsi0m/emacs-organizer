(defun expand-file-names-in-dir (directory)
  "Return list of absolute filenames of files in directory ommitting dotfiles"
  (let ((default-directory directory))
    (mapcar #'expand-file-name
	    (directory-files directory t directory-files-no-dot-files-regexp))))
