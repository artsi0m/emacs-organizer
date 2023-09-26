(defun expand-file-names-in-dir (dir)
	 "Return list of absolute filenames in directory ommiting dotfiles"
	 (directory-files dir t directory-files-no-dot-files-regexp))
