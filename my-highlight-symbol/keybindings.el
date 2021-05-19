;; my-highlight-sysmbol configurations
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [(meta f3)] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(control shift f3)] 'unhighlight-regexp)
(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (save-excursion
                    (goto-char (posn-point (event-start event)))
                    (highlight-symbol-at-point))))
