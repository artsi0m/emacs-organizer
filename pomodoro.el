;; Use C locale for time. Needed for org-pomodoro on windows.A
(setq system-time-locale "C")

(use-package org-pomodoro
  :custom
  (org-pomodoro-keep-killed-pomodoro-time 't)
  (org-pomodoro-length 80)
  (org-pomodoro-short-break-length 15)
  (org-pomodoro-long-break-length 35)
  :ensure t)

(use-package org-pomodoro-third-time
  :vc (:url "git@github.com:telotortium/org-pomodoro-third-time.git")
  :init  (org-pomodoro-third-time-mode)
  :ensure t)

