;;; lang/gleam/config.el -*- lexical-binding: t; -*-
(use-package! gleam-ts-mode
  :mode (rx ".gleam" eos)
  :init (set-tree-sitter! nil 'gleam-ts-mode
          '((gleam :url "https://github.com/gleam-lang/tree-sitter-gleam")))
  :config
  (when (modulep! +lsp)
    (add-hook 'gleam-ts-mode-local-vars-hook #'lsp 'append)))

(when (modulep! +evil-ts-obj)
  (use-package! evil-ts-obj
    :config
    (defvar evil-ts-obj-gleam-compound-nodes
      '("function" "anonymous_function" "case_clause" "case" "block")
      "Compound node types for Gleam.")

    (defvar evil-ts-obj-gleam-statement-nodes
      '("let" "let_assert" "use" "assert")
      "Statement node types for Gleam.")

    (defvar evil-ts-obj-gleam-param-nodes
      '("function_parameters" "anonymous_function_parameters"
        "list" "tuple" "record")
      "Param node types for Gleam.")

    (defvar evil-ts-obj-gleam-things
      `((compound ,(evil-ts-obj-conf--make-nodes-regex evil-ts-obj-gleam-compound-nodes))
        (statement ,(evil-ts-obj-conf--make-nodes-regex evil-ts-obj-gleam-statement-nodes))
        (param ,(evil-ts-obj-conf--make-nodes-regex evil-ts-obj-gleam-param-nodes))
        (str "^string$"))
      "Things for Gleam.")

    (defun evil-ts-obj-gleam-setup-things ()
      "Set up evil-ts-obj language config for Gleam."
      (evil-ts-obj-def-init-lang 'gleam evil-ts-obj-gleam-things))

    (add-hook 'gleam-ts-mode-hook #'evil-ts-obj-gleam-setup-things)
    (add-hook 'gleam-ts-mode-hook #'evil-ts-obj-mode)))
