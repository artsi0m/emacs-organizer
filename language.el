(use-package reverse-im
  :ensure t
  :init (reverse-im-mode)
  :custom
  (reverse-im-input-methods '("cyrillic-colemak"))
  (reverse-im-cache-file "~/.emacs.d/reverse-im-cache.el")
  :pin melpa)



(use-package ispell
  :commands (ispell ispell-region ispell-word)
  :config
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,ru_RU")
  :custom
  (ispell-program-name "hunspell")
  (ispell-dictionary "en_US,ru_RU")
  (ispell-personal-dictionary "~/howm/.hunspell_personal"))
