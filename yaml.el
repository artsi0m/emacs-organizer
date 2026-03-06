(use-package yaml-mode)

(use-package flymake-yamllint
  :when (executable-find "yamllint")
  :hook (yaml-mode . flymake-yamllint-setup)
  :ensure t)

(use-package docker-compose-mode)

(use-package ansible
    :hook (ansible-mode . whitespace-mode)
    :ensure t)

(use-package flymake-ansible-lint
  :when (executable-find "ansible-lint")
  :ensure t
  :commands flymake-ansible-lint-setup
  :hook (((ansible-mode) . flymake-ansible-lint-setup)
         ((ansible-mode) . flymake-mode)))

(use-package ansible-doc
    :hook (ansible-mode . ansible-doc-mode))
