(use-package slime :commands (slime))

(when (executable-find "sbcl")
(setq inferior-lisp-program "sbcl"))
