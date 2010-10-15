;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;Настройки AucTeX
;;
(setq auctex-version "11.86-e23.1-msw")
(add-to-list 'load-path (format "~/.emacs.d/auctex-%s/site-lisp/" auctex-version))
(add-to-list 'load-path (format "~/.emacs.d/auctex-%s/site-lisp/auctex/" auctex-version))
(add-to-list 'load-path (format "~/.emacs.d/auctex-%s/site-lisp/site-start.d/" auctex-version))
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;\mathtext.sty
;tex\latex\cyrillic\t2aenc.def
;fonts\source\lh\lh-t2a\lacodes.mf
;fonts\source\lh\lh-t2a\lacodes.mf
;;;;;;;;;;;;;; pdf2dsc
(require 'tex-mik)
(add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
(setq TeX-parse-self t)             ; Enable parse on load.
(setq TeX-auto-save t)              ; Enable parse on save.
(setq-default TeX-master nil)       ; Query for master file.
(setq TeX-PDF-mode t)
(setq TeX-interactive-mode t)
(setq TeX-source-specials-mode 1)
;;модифицируем меню
;;; some more menu entries in the command list:
;;; see tex-mik.el from package auctex: %v is defined in tex-mik.el
;;; other variables are defined in tex.el from auctex
;;; the meaning of some auctex-varibles:
        ;symbols defined in tex.el and tex-mik.el:
        ;%b name slave tex-file  %t name master tex-file   
        ;%d dvi-file  %f ps-file 
        ;%l "latex --src-specials"
        ;%n line number  %p printcommand  %q "lpq"  
        ;%r (TeX-style-check TeX-print-style)
        ;%s master-file-name without extention
        ;%v yap command view line
(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-command-list
		  (list "->PS landscape for pdf"
			"dvips %d -N0 -Ppdf -G0 -T 297mm,210mm -o %f " 
			'TeX-run-command nil t))
     (add-to-list 'TeX-command-list
		  (list "All Texify run-viewer"
			"texify --tex-opt=--src --run-viewer --clean %s.tex"
			'TeX-run-command nil t))))
;;
;;Настройки PreviewLatex
(load "preview-latex.el" nil t t) 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'auctex-conf)