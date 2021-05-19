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

  ;; load org mouse
  (use-package org-mouse
    :defer t)

  ;; for pop up ansi multi term
  ;; bind key
  (global-set-key (kbd "C-`") 'spacemacs/shell-pop-multiterm)

  ;; mouse actions
  ;; scale text with mouse
  (global-set-key [C-S-mouse-4] 'zoom-frm-in)
  (global-set-key [C-S-mouse-5] 'zoom-frm-out)
  (global-set-key [C-mouse-4] 'text-scale-increase)
  (global-set-key [(control ?+)] 'text-scale-increase)
  (global-set-key [C-mouse-5] 'text-scale-decrease)
  (global-set-key [(control ?-)] 'text-scale-decrease)
  (global-set-key (kbd "C-0") '(lambda () (interactive)
                                 (text-scale-adjust
                                  (- text-scale-mode-amount))
                                 (text-scale-mode -1)))
  ;;(global-set-key (kbd "C-c C-p C-g") 'projectile-grep)
  (global-set-key (kbd "C-c C-p g") 'projectile-grep)

  ;; ggtags mouse
  (global-set-key [(meta shift mouse-1)] 'ggtags-find-tag-mouse)

  ;; default browser for browse-url
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "chromium")



  ;; for hideshow-viz
  ;; hideshowviz settings
  ;; enable hide show viz for code folding
  (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

  (autoload 'hideshowvis-minor-mode
    "hideshowvis"
    "Will indicate regions foldable with hideshow in the fringe."
    'interactive)
  

  ;; comments support for hideshow
  (defun hs-hide-all-comments ()
    "Hide all top level blocks, if they are comments, displaying only first line.
Move point to the beginning of the line, and run the normal hook
`hs-hide-hook'.  See documentation for `run-hooks'."
    (interactive)
    (hs-life-goes-on
     (save-excursion
       (unless hs-allow-nesting
         (hs-discard-overlays (point-min) (point-max)))
       (goto-char (point-min))
       (let ((spew (make-progress-reporter "Hiding all comment blocks..."
                                           (point-min) (point-max)))
             (re (concat "\\(" hs-c-start-regexp "\\)")))
         (while (re-search-forward re (point-max) t)
           (if (match-beginning 1)
               ;; found a comment, probably
               (let ((c-reg (hs-inside-comment-p)))
                 (when (and c-reg (car c-reg))
                   (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
                       (hs-hide-block-at-point t c-reg)
                     (goto-char (nth 1 c-reg))))))
           (progress-reporter-update spew (point)))
         (progress-reporter-done spew)))
     (beginning-of-line)
     (run-hooks 'hs-hide-hook)))

  ;; ruby support for hideshow
  (add-to-list 'hs-special-modes-alist
               '(ruby-mode
                 "\\(begin\\|module\\|^ *class\\|def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
                 (lambda (arg) (ruby-end-of-block)) nil))

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
