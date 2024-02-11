(defun my-expand-file-names-in-dir (dir)
	 "Return list of absolute filenames in directory ommiting dotfiles"
	 (directory-files dir t directory-files-no-dot-files-regexp))

(defun my-elfeed-file-names-in-howm ()
  "Return list of absolute filenames of org-elfeed files in howm"
  (delete-dups
   (mapcar #'car (howm-grep "\:elfeed\:"
		      (howm-files-in-directory howm-directory)))))

(defun my-org-drill-file-names-in-howm ()
  "Return list of absolute filenames of org-drill files in howm"
  (delete-dups
   (mapcar #'car (howm-grep "\:drill\:"
			    (howm-files-in-directory howm-directory)))))

(defun my-org-agenda-file-names-in-howm ()
  "Return list of absoulute filenames of files with :agenda: tag in howm"
  (delete-dups
   (mapcar #'car (howm-grep "\:agenda\:"
			    (howm-files-in-directory howm-directory)))))


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

(defun my-org-drill-create ()
    (interactive)
  (let ((filename   (format "~/howm/org.drill.cards/%s.org"
				    (format-time-string "%F-%H%M%S"))))
	  (make-empty-file filename)
	  (switch-to-buffer filename)
	  (set-visited-file-name filename)
	  (org-mode)
	  (howm-mode)
	  (org-insert-heading)))
