;; TODO 
;; configure org-gcal to sync org-agenda tasks
;; with google-calendar which i use because of my uni schedule

;; calfw

(use-package calfw
  :commands (my-open-calendar)
  :config
  (require 'calfw-ical)
  (require 'calfw-org)
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
