;; TODO 
;; configure org-gcal to sync with google-calendar which contains
;; bsuir schedule


;; calfw
(use-package calfw)

(use-package calfw-ical
  :config
  (defun my-open-calendar ()
    (interactive)
    (cfw:open-calendar-buffer
     :contents-sources
     (list
      (cfw:org-create-source)
      (cfw:ical-create-source
       "gcal"
       "https://calendar.google.com/calendar/ical/m6a3jqdi6imnv97h39v9r528k4%40group.calendar.google.com/public/basic.ics"
       "Purple")))))

(use-package calfw-org)
