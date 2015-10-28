;;; extensions.el --- my-extra Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq my-extra-pre-extensions
      '(
        ;; pre extension names go here
        ))

(setq my-extra-post-extensions
      '(
        my-extra-packages
        ;; post extension names go here
        ))

;; For each extension, define a function my-extra/init-<extension-name>
;;
(defun my-extra/init-my-extra-packages ()
;;   "Initialize my extension"

  ;; for term-toggle
  (require 'term-toggle)
  ;; bind key
  (global-set-key [(control f12)] 'term-toggle)

  ;; for hideshow-viz
  ;; hideshowviz settings
  ;; enable hide show viz for code folding
  (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

  (autoload 'hideshowvis-minor-mode
    "hideshowvis"
    "Will indicate regions foldable with hideshow in the fringe."
    'interactive)

  (dolist (hook (list 'emacs-lisp-mode-hook
                      'c++-mode-hook))
    (add-hook hook 'hideshowvis-enable))

  ;; If enabling hideshowvis-minor-mode is slow on your machine use M-x,
  ;; customize-option, hideshowvis-ignore-same-line and set it to nil. This will
  ;; then display - icons for foldable regions of one line, too but is faster
  ;;
  ;; To enable displaying a + symbol in the fringe for folded regions,
  ;; use:
  ;;
  ;; (hideshowvis-symbols)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
