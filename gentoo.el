(require 'sudo-edit)
(require 'portage)

(use-package ctable :ensure nil :defer t
  :config
  (setq ctbl:default-rendering-param
        (make-ctbl:param
         :display-header      t
         :fixed-header        nil
         :bg-colors           nil
         :vline-colors        "DarkGray"
         :hline-colors        "DarkGray"
         :draw-vlines         'all
         :draw-hlines         '(1)
         :vertical-line       ?│
         :horizontal-line     ?─
         :left-top-corner     ?┌
         :right-top-corner    ?┐
         :left-bottom-corner  ?└
         :right-bottom-corner ?┘
         :top-junction        ?┬
         :bottom-junction     ?┴
         :left-junction       ?├
         :right-junction      ?┤
         :cross-junction      ?┼)))

(use-package portage-navi :ensure nil
  :custom
  (pona:package-equery-use-native-highlighting t)
  :bind (:map pona:package-detail-mode-map
              ("t" . portage-toggle-use-flag-at-point)))
(use-package portage
  :commands ( portage-depclean portage-deselect
              portage-emerge-mode
              portage-emerge-preserved-rebuild
              portage-emerge-pv portage-emerge-oneshot
              portage-sync portage-full-upgrade
              ;; With smart-live-rebuild:
              ;; portage-smart-live-rebuild
              portage-install portage-uninstall
              ;; With pona:
              ;; portage-package-details
              portage-refresh-cache
              portage-eselect-module-set portage-eselect-emacs-set
              eselect)
  :config (defalias 'eselect 'portage-trivial-eselect)
  :custom
  (portage-dedicated-use-flags-file-relative "package.use/99-adhoc")
  (portage-load-site-gentoo-d-changes-on-install t))

(use-package portage-emerge-mode
  :custom (portage-load-site-gentoo-d-changes-on-install t))

(use-package portage-toggle-use
  :commands (portage-toggle-useflag))

(use-package portage-elisp-set
  :commands (portage-update-elisp-set))

(setopt markdown-command "markdown2")
