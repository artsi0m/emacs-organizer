(define-advice elfeed (:before (&rest _args))
  (setq rmh-elfeed-org-files (my-elfeed-file-names-in-howm)))


(define-advice elfeed-update (:before (&rest _args))
  (setq rmh-elfeed-org-files (my-elfeed-file-names-in-howm)))

(define-advice org-timeblock-redraw-buffers (:before (&rest _args))
  (setq org-agenda-files (my-org-agenda-file-names-in-howm)))

(define-advice org-agenda (:before (&rest _args))
  (setq org-agenda-files (my-org-agenda-file-names-in-howm)))
   
