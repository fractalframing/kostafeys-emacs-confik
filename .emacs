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
;;-----------------------------------------------------------------------------
;; ��������� Maxima
;; 
(load "c:/Program Files/Maxima-5.18.1/share/maxima/5.18.1/emacs/setup-imaxima-imath.el")
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
;;-----------------------------------------------------------------------------

;;=============================================================================
;;��������� ��� ����� ������ ����� ����������
;;=============================================================================
(add-to-list 'load-path "~/.emacs.d/")
;;-----------------------------------------------------------------------------
;; ��������� UTF-8
(require 'russian-utf8-env)
(set-language-environment "Russian UTF-8")
(prefer-coding-system 'cp1251-dos)
;;-----------------------------------------------------------------------------
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

(custom-set-variables
 '(cua-mode t nil (cua-base))
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(ecb-auto-activate t)
 '(ecb-layout-window-sizes (quote (("left8" (0.33766233766233766 . 0.26666666666666666) (0.33766233766233766 . 0.1111111111111111) (0.33766233766233766 . 0.4888888888888889) (0.33766233766233766 . 0.1111111111111111)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-tar-setup (quote cons))
 '(ecb-tip-of-the-day nil)
 '(global-hl-line-mode 1)
 '(show-paren-mode t)
 '(speedbar-tag-split-minimum-length 200)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))

;; ��������� ������ ����� �������
(desktop-save-mode t)

;������� ������ ������ ��������� ��� �����������
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;;��������� ������� ������ �������
;(set-cursor-color "red")
(blink-cursor-mode nil);������ �� ������

;;
;; ��������� ������� ������ Emacs
;;
(setq default-major-mode 'text-mode)
; Turn on auto-fill mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(setq auto-fill-mode t)
(setq fill-column 75)
;; Show marked text
(setq font-lock-maximum-decoration t)
; for syntax highlighting
(global-font-lock-mode 1 t)
;; ��������� ������ ������
(show-paren-mode 1)
;(setq show-paren-style 'expression);�������� ��� ��������� � �������
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ��������� ������ ��������� ���������
;;
(setq inhibit-startup-message t) ;;�� ���������� ��������� ��� ������
(setq initial-scratch-message nil) ;; Scratch buffer settings. ������� ���.
(fset 'yes-or-no-p 'y-or-n-p) ;;�� ����������� ���� ������ yes �������

;;������� ��������� � ������
(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 4)

;; show column & line numbers in status bar
(setq column-number-mode t)
(setq line-number-mode t)

;; hour format
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)
(setq calendar-date-display-form (quote ((format "%04s-%02d-%02d" year (string-to-int month) (string-to-int day)))))
(setq calendar-time-display-form (quote (24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")"))))
(setq calendar-week-start-day 1)
(setq european-calendar-style t)

;;���������
(setq-default tab-width 4)
;; Start off in "C:/home" dir.
(cd "~/")
(setq my-author-name (getenv "USER"))
(setq user-full-name (getenv "USER"))
;; Shut off message buffer. Note - if you need to debug emacs,
;; comment these out so you can see what's going on.
; (setq message-log-max nil)
; (kill-buffer "*Messages*")
(recentf-mode 1); Recent files in menu
;;
;;�������� ��������� ����� ������������� ������ (Backup)
;;
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/backup"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
;(setq version-control t);������������ ����� - 2 ������ � 2 ���������
;(setq delete-old-versions t);�������� ������������� �������
;;
;;�����...
;;
;; Scroll Bar gets dragged by mouse butn 1
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)
;; Paste at point NOT at cursor
(setq mouse-yank-at-point 't)
;;������ �����
(mouse-wheel-mode 1)
;;
;;��������� ��������� ��������� "��� � Windows"
;;
;;��������� ���������� ��� � Windows
;;
;;Delete (and its variants) delete forward instead of backward.
;;C-Backspace kills backward a word (as C-Delete normally would).
;;M-Backspace does undo.
;;Home and End move to beginning and end of line
;;C-Home and C-End move to beginning and end of buffer.
;;C-Escape does list-buffers." 
(pc-bindings-mode)
;;��������� ��������� "��� � Windows"
(pc-selection-mode)
(delete-selection-mode nil)
;;
;;��������� ������ CUA
;;��������� Ctr-c,v,x,d ��� � windows
;;
(require 'cua-base)
(cua-mode t)
;;��������� ������� ������ ������� ����� CUA
(setq cua-normal-cursor-color "black")
(setq cua-overwrite-cursor-color "red")
(setq cua-read-only-cursor-color "green") 
;; always end a file with a newline
(setq require-final-newline t)
(delete-selection-mode t) ; <del> ������� ���������� �����
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;��������� �������� ���� ���������
 ; ��� ������� - ������������� �� ���� ����� - Linux
 ;(set-frame-parameter nil 'fullscreen
 ;   (if (frame-parameter nil 'fullscreen) nil 'fullboth))
 ; ��� ������� - ������������� �� ���� �����
 (add-to-list 'default-frame-alist '(left . 0))
 (add-to-list 'default-frame-alist '(top . 0))
 (add-to-list 'default-frame-alist '(height . 45))
 ;(add-to-list 'default-frame-alist '(height . 42))
 (add-to-list 'default-frame-alist '(width . 154))
 ;;��������� �������� ������
 ;(set-frame-size (selected-frame) 154 45)
 ;;��������� ������ �������� ���� ������ 
 ;(set-frame-position (selected-frame) 0 0)

;;=============================================================================
;; ��������� �������� ������
;;=============================================================================
;;-----------------------------------------------------------------------------
;; Meta - ���������
;;-----------------------------------------------------------------------------
 (global-set-key "\M-g" 'goto-line)
 ;l - ����� j - ������ i - ����� k - ����
 (global-set-key "\M-i" 'previous-line)
 (global-set-key "\M-k" 'next-line)
 (global-set-key "\M-j" 'backward-char)
 (global-set-key "\M-l" 'forward-char)

;; Undo - wtf C-S-_
(global-set-key "\C-z" 'undo)

;;
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [\C-home] 'beginning-of-buffer)
(global-set-key [\C-end] 'end-of-buffer)
;;������� ������ �������
;(setq kill-whole-line t) ������� �� ������� ������� �� ����� ������
(global-set-key [(control y)] 
  '(lambda () 
     (interactive)
     (beginning-of-line)
     (kill-line)))
;; setting some f[1-12] keys
(global-set-key [f1]    'help)
(global-set-key [f2]    'save-buffer)
(global-set-key [f4]    'ispell-buffer)
(global-set-key [M-f4]  'save-buffers-kill-emacs)
(global-set-key [M-f7]  'isearch-forward)

; ����� ������
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)

;; C-tab switchs to a next window
(global-set-key [(control tab)] 'other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
(message "*** .emacs loaded OK. ***")
;;
;; end of .emacs
;;
;;
