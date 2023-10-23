(defun my-expand-file-names-in-dir (dir)
	 "Return list of absolute filenames in directory ommiting dotfiles"
	 (directory-files dir t directory-files-no-dot-files-regexp))

(defun my-howm-elfeed-file-names ()
	   "Return list of absolute filenames of org-elfeed files in howm"
	 (mapcar #'car (howm-grep "\:elfeed\:" (howm-files-in-directory howm-directory))))

 (defun my-org-drill-file-names-in-howm ()
	   "Return list of absolute filenames of org-drill files in howm"
	 (mapcar #'car (howm-grep "\:drill\:" (howm-files-in-directory howm-directory))))
