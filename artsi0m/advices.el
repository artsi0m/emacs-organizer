(define-advice org-timeblock-redraw-buffers (:before (&rest _args))
  (setq org-agenda-files (my-org-agenda-file-names-in-howm)))

