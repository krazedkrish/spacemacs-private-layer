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

(setq my-extra-packages
      '(
        (my-extra :location local)
        ))

;; For each extension, define a function my-extra/init-<extension-name>
;;
(defun my-extra/init-my-extra()
;;   "Initialize my extension"

  ;; for pop up ansi multi term
  ;; bind key
  (global-set-key [(control f12)] 'spacemacs/shell-pop-multiterm)

  ;; for hideshow-viz
  ;; hideshowviz settings
  ;; enable hide show viz for code folding
  (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

  (autoload 'hideshowvis-minor-mode
    "hideshowvis"
    "Will indicate regions foldable with hideshow in the fringe."
    'interactive)

  (dolist (hook (list 'emacs-lisp-mode-hook
                      'c++-mode-hook
                      'web-mode-hook
                      'json-mode-hook
                      'js2-mode-hook
                      'python-mode-hook
                      'ruby-mode-hook))
    (add-hook hook 'hideshowvis-enable))

  ;; If enabling hideshowvis-minor-mode is slow on your machine use M-x,
  ;; customize-option, hideshowvis-ignore-same-line and set it to nil. This will
  ;; then display - icons for foldable regions of one line, too but is faster
  ;;
  ;; To enable displaying a + symbol in the fringe for folded regions,
  ;; use:
  ;;
  ;; (hideshowvis-symbols)
  (add-hook 'hideshowvis-minor-mode-hook 'hideshowvis-symbols)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
