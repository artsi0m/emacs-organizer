(use-package howm
  :init (when (not (eq system-type 'windows-nt))
          (setq howm-view-use-grep t))
  :custom
  (howm-search-other-dir t)
  :ensure t)

(defun howm-insert-prop-line (&optional mode)
  "Enable & save major mode to prop-line to use with howm in the file
  local variable"
  (interactive (list (intern
                      (completing-read "Choose major mode: "
                                       (mapcar #'cdr auto-mode-alist)
                                       nil t))))
  (funcall mode)
  (howm-mode)
  (add-file-local-variable-prop-line
   'mode (intern (string-trim-right (symbol-name mode) "-mode"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flashcards using org-drill ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-drill
      :pin melpa
      :ensure t)


(defun my-org-drill-file-names-in-howm ()
  "Return list of absolute filenames of org-drill files in howm"
  (delete-dups
   (mapcar #'car (howm-grep "\:drill\:"
			    (howm-files-in-directory howm-directory)))))


(defun my-org-drill-set-scope ()
  (interactive)
  (let ((scope-var
	 (completing-read "Choose scope for org-drill: " (list
		   "howm"
		   "file"
		   "tree"
		   "file-no-restriction"
		   "agenda"
		   "agenda-with-archives"
		  "directory"))))
    (if (equal scope-var "howm")
	(setq org-drill-scope (my-org-drill-file-names-in-howm))
      (setq org-drill-scope (intern scope-var)))))


(define-advice org-drill (:before (&rest _args))
  (my-org-drill-set-scope))

(define-advice org-drill-cram (:before (&rest _args))
  (my-org-drill-set-scope))

(defun org-drill-time-to-inactive-org-timestamp (time)
  "Convert TIME into org-mode timestamp."
  (format-time-string
   (concat "[" (cdr org-time-stamp-formats) "]")
   time))

