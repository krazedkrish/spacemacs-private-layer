;;; packages.el --- %LAYERNAME% Layer packages File for Spacemacs
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

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq my-highlight-symbol-packages
    '(
      highlight-symbol
      ;; package names go here
      ))

;; List of packages to exclude.
(setq my-highlight-symbol-excluded-packages '())

(defun my-highlight-symbol/init-highlight-symbol ()
  (use-package highlight-symbol
    :defer t
    :init
    (progn
      ;; (global-set-key [C-S-mouse-1] 'highlight-symbol-at-point)
      )))

;; For each package, define a function %LAYERNAME%/init-<package-name>
;;
;; (defun %LAYERNAME%/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
