;;; lang/gleam/packages.el -*- lexical-binding: t; -*-

(package! gleam-ts-mode
  :recipe (:host github
           :repo "gleam-lang/gleam-mode"
           :branch "main"
           :files ("gleam-ts-*.el")))
