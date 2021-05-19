;;; packages.el --- my-rails Layer packages File for Spacemacs
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
(setq my-rails-packages
    '(
      ;; package names go here
      evil-rails
      ;;ruby-guard
      robe
      ))

;; List of packages to exclude.

(setq my-rails-excluded-packages '())

;; For each package, define a function my-rails/init-<package-name>
;;
;; (defun my-rails/init-my-package ()
;;   "Initialize my package"
;;   )
(defun my-rails/init-evil-rails()
  (use-package evil-rails
    :defer t
    ;;  :init 
    ;; (progn
    ;;   (add-hook 'projectile-mode-hook 'evil-rails))
    ))

(defun my-rails/init-ruby-guard()
  (use-package ruby-guard
    :defer t
    ;;  :init 
    ;; (progn
    ;;   (add-hook 'projectile-mode-hook 'ruby-guard))
    ))
(defun my-rails/init-robe()
  (use-package robe
    :defer t)
  (global-set-key (kbd "C-c C-j") 'robe-jump)
  )


;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
