(defun my-expand-file-names-in-dir (dir)
	 "Return list of absolute filenames in directory ommiting dotfiles"
	 (directory-files dir t directory-files-no-dot-files-regexp))



(defun my-howm-subsubdir-exclude (dir)
  (if (string-match-p my-howm-subsubdir-regexp dir)
      (unless
	  (string-match-p my-howm-excluded-subdirs-regexp dir) dir)
    nil))


;; (defun my-howm-subsubdirs ()
;;     (seq-filter #'my-howm-subsubdir-exclude
;; 	    (seq-filter #'file-directory-p
;; 	    (directory-files-recursively
;; 	     howm-directory directory-files-no-dot-files-regexp t))))

(defun my-howm-subsubdirs ()
  (thread-last
    (directory-files-recursively
     howm-directory directory-files-no-dot-files-regexp t)
    (seq-filter #'file-directory-p)
    (seq-filter #'my-howm-subsubdir-exclude)))

