;;=============================================================================
;; ����������� ����������
;;=============================================================================
;;-----------------------------------------------------------------------------
;; Cedet
(setq semantic-load-turn-useful-things-on t)
(load-file "~/.emacs.d/cedet-1.0pre6/common/cedet.el")
(global-set-key [?\C- ] 'semantic-ia-complete-symbol)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; ECB
(add-to-list 'load-path "~/.emacs.d/ecb-2.40/") 
(require 'ecb)
(global-set-key (kbd "\e\el") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "C-x C-a") 'ecb-activate)
(global-set-key (kbd "C-x C-q") 'ecb-deactivate)
(global-set-key "\M-m" 'ecb-goto-window-methods)
;������������ ���� ������� ����� ������� ����������
(setq imenu-auto-rescan 1)
;;-----------------------------------------------------------------------------

;;=============================================================================
;;��������� ��� ����� ������ ����� ����������
;;=============================================================================
(add-to-list 'load-path "~/.emacs.d/")
;;-----------------------------------------------------------------------------
;; auto-complete
(when (require 'auto-complete nil t)
   (auto-complete-mode)
   (global-auto-complete-mode t)
   (setq ac-auto-start t)                  ;automatically start
   (setq ac-dwim t)                        ;Do what i mean
   (setq ac-override-local-map nil)        ;don't override local map
   (set-face-background 'ac-menu-face "lightgray")
   (set-face-underline 'ac-menu-face "darkgray")
   (set-face-background 'ac-selection-face "steelblue")
   (define-key ac-complete-mode-map "\t" 'ac-expand)
   (define-key ac-complete-mode-map "\r" 'ac-complete)
   (define-key ac-complete-mode-map "\M-n" 'ac-next)
   (define-key ac-complete-mode-map "\M-p" 'ac-previous)
)
;;-----------------------------------------------------------------------------
;;���������� Sunrise Commander
;; M-x sunrise
(require 'sunrise-commander)
;;-----------------------------------------------------------------------------
;; tabs
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(control shift tab)] 'tabbar-forward)
(global-set-key [(control meta shift tab)] 'tabbar-backward)
;;-----------------------------------------------------------------------------
;; ido
(require 'ido)
(ido-mode t)
;ibuffer - ��� ���� ������ ������������ ����� ��������
(global-set-key "\C-x\C-b" 'ibuffer)
;;-----------------------------------------------------------------------------
;; session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;;-----------------------------------------------------------------------------
;; ������ ��������� �����
(require 'linum)
(global-linum-mode) ; ��������� �����
;;-----------------------------------------------------------------------------
;; ������ ���������
;;��������� ��� ����� ������ ����� ����������
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")  
(require 'color-theme) ;;���������� "������ ���������"
(color-theme-initialize) ;;���������� ���������� �������� ����
(color-theme-aliceblue) ;;������� ���������� �����
;;-----------------------------------------------------------------------------

;; ��������� ������ ����� �������
(desktop-save-mode t)

;������� ������ ������ ��������� ��� �����������
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;(set-default-font "consolas")
;(set-face-font 'default "7x14")
;(global-font-lock-mode -1)

;; ��������� UTF-8
;(require 'russian-utf8-env)
;(set-language-environment "Russian UTF-8")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;��������� ��������� ������
;�������� ��������� cp1251
(put-charset-property 'cyrillic-iso8859-5 'preferred-coding-system 'koi8-r)
;(codepage-setup 1251)
(define-coding-system-alias 'windows-1251 'cp1251)
(set-input-mode nil nil 'We-will-use-eighth-bit-of-input-byte)
;(setq-default coding-system-for-read 'cp1251)
(set-selection-coding-system 'cp1251)
;
;������� � ���� Set Language Environment ����� Cyrillic-CP1251
(set-language-info-alist
 "Cyrillic-CP1251" `((charset cyrillic-iso8859-5)
		   (coding-system cp1251)
		   (coding-priority cp1251)
		   (input-method . "cyrillic-jcuken")
		   (features cyril-util)
		   (unibyte-display . cp1251)
		   (sample-text . "Russian (�������)    ������������!")
		   (documentation . "Support for Cyrillic CP1251."))
'("Cyrillic"))

(setq default-buffer-file-coding-system 'cp1251-dos);;dos - ��� CRLF
(prefer-coding-system 'cp1251-dos)
(setq locale-coding-system  'cp1251)
(set-terminal-coding-system 'cp1251)
(set-keyboard-coding-system 'cp1251)
;(setq-default coding-system-for-read 'cp1251)
;(setq-default coding-system-for-write 'cp1251)
(setq selection-coding-system 'cp1251)
(setq default-process-coding-system 'cp1251)
;
;��������� ��� windows
(set-w32-system-coding-system  'cp1251)
(setq w32-system-coding-system 'cp1251)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(ecb-auto-activate t)
 '(ecb-layout-window-sizes (quote (("left8" (0.33766233766233766 . 0.26666666666666666) (0.33766233766233766 . 0.1111111111111111) (0.33766233766233766 . 0.4888888888888889) (0.33766233766233766 . 0.1111111111111111)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("c:")))
 '(ecb-tar-setup (quote cons))
 '(ecb-tip-of-the-day nil)
 '(global-hl-line-mode 1)
 '(show-paren-mode t)
 '(speedbar-tag-split-minimum-length 200)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; full screen toggle using command+[RET]
(defun toggle-fullscreen () 
  (interactive) 
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen) 
                                           nil 
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen) 

;; Meta - ���������
 (global-set-key "\M-g" 'goto-line)
 ;l - ����� j - ������ i - ����� k - ����
 (global-set-key "\M-i" 'previous-line)
 (global-set-key "\M-k" 'next-line)
 (global-set-key "\M-j" 'backward-char)
 (global-set-key "\M-l" 'forward-char)

;; Undo - wtf C-S-_
(global-set-key "\C-z" 'undo)

;;�������� ����
(global-set-key "\M-z" 'iconify-or-deiconify-frame)

;; ��������� ������ ������
(show-paren-mode 1)

(setq inhibit-startup-message t) ;;�� ���������� ��������� ��� ������
(fset 'yes-or-no-p 'y-or-n-p) ;;�� ����������� ���� ������ yes �������
(setq default-tab-width 4) ;;���������

;; ��� ���������
;(setq scroll-step 1)
;; conservatively scrolling
(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 4)

; ����� ������
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)

;; �������� �����
;(cua-selection-mode t)
; M-w - ����������
; C-w - ��������
; C-k - �������� �� ����� ������
; C-y - ��������

;;��������� ������ CUA
;;��������� Ctr-c,v,x,d ��� � windows
;;
(require 'cua-base)
(cua-mode t)

;; C-tab switchs to a next window
(global-set-key [(control tab)] 'other-window)

 ; ��� ������� - ������������� �� ���� ����� - Linux
 ;(set-frame-parameter nil 'fullscreen
 ;   (if (frame-parameter nil 'fullscreen) nil 'fullboth))
 ; ��� ������� - ������������� �� ���� �����
 (add-to-list 'default-frame-alist '(left . 0))
 (add-to-list 'default-frame-alist '(top . 0))
 (add-to-list 'default-frame-alist '(height . 45))
 ;(add-to-list 'default-frame-alist '(height . 42))
 (add-to-list 'default-frame-alist '(width . 154))
 ;(set-frame-size (selected-frame) 154 45)
 ;(set-frame-position (selected-frame) 0 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ��������� Maxima
;; 
(load "c:/Program Files/Maxima-5.18.1/share/maxima/5.18.1/emacs/setup-imaxima-imath.el")
(setq imaxima-tmp-dir "C:\\Windows\\tmp")
;; ���������� Maxima
;; ��������� ��� ����� ������ ����� ����������
(add-to-list 'load-path "c:/Program Files/Maxima-5.18.1/share/maxima/5.18.1/emacs/")
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'maxima-mode "maxima" "Maxima mode" t)
; C-c C-C - ��������� ������
; C-c C-r - ��������� ���������� ����
; C-c C-b - ��������� ����� (�.�. ����)
(setq auto-mode-alist (cons '("\\.mxm" .  maxima-mode) auto-mode-alist))
;; M-X emaxima-mode
(autoload 'emaxima-mode "emaxima" "EMaxima" t)
(add-hook 'emaxima-mode-hook 'emaxima-mark-file-as-emaxima)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;��������� AucTeX
;;
(require 'tex-mik)
(add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
(setq TeX-parse-self t)             ; Enable parse on load.
(setq TeX-auto-save t)              ; Enable parse on save.
(setq-default TeX-master nil)       ; Query for master file.
(setq TeX-PDF-mode t)
(setq TeX-interactive-mode t)
(setq TeX-source-specials-mode 1)
;;������������ ����
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
;;��������� PreviewLatex
(load "preview-latex.el" nil t t) 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;������ ������������� ������� � ����������
(icomplete-mode)

;;
;;
(message "*** .emacs loaded OK. ***")
;;
;; end of .emacs
;;
;;