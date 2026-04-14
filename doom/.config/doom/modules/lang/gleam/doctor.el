;; -*- lexical-binding: t; no-byte-compile: t; -*-
;;; lang/gleam/doctor.el
(unless (treesit-available-p)
  (warn! "gleam-ts-mode requires treesit to be available in Emacs!"))

(assert! (or (not (modulep! +lsp))
             (modulep! :tools lsp))
         "This module requires (:tools lsp)")

(when (and (modulep! +lsp)
           (not (executable-find "gleam")))
  (warn! "Gleam LSP needs `gleam` executable available!"))
