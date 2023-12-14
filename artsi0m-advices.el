(define-advice elfeed-update (:before (&rest _args))
  (setq rmh-elfeed-org-files (my-elfeed-file-names-in-howm)))

(define-advice org-timeblock-redraw-buffers (:before (&rest _args))
  (setq org-agenda-files (my-org-agenda-file-names-in-howm)))

(define-advice org-agenda (:before (&rest _args))
  (setq org-agenda-files (my-org-agenda-file-names-in-howm)))

(define-advice org-drill-cram (:before (&rest _args))
  ;; does not work yet
  (setq org-drill-cram-hours 72)
  (setq org-drill-scope (my-org-drill-file-names-in-howm)))

(define-advice org-drill (:before (&rest _args))
  ;; not tested yet
  (setq org-drill-cram-hours 72)
  (setq org-drill-scope (my-org-drill-file-names-in-howm)))
