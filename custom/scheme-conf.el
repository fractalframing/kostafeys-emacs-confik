;;=============================================================================
;; Scheme
(require 'cmuscheme)
(setq scheme-program-name "mzscheme")
;M-x run-scheme
(require 'quack)
;;-----------------------------------------------------------------------------

(defun scheme-study-ide ()
  "Creates handy scheme study ide"
  (interactive)
  (progn
	(run-scheme "mzscheme")
	(delete-frame)
	(split-window-horizontally)
	(next-multiframe-window)
	(switch-to-buffer "*scheme*")
	(shrink-window-horizontally 22)
	(previous-multiframe-window)
))
(global-unset-key "\C-xs")
(global-set-key "\C-xss" 'scheme-study-ide)
(global-set-key "\C-xsr" 'scheme-send-region)
(global-set-key "\M-e" 'eval-print-last-sexp)
;;=============================================================================

(provide 'scheme-conf)
