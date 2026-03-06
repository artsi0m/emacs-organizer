(use-package auctex
  :init (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

(setq-default TeX-engine 'luatex)
