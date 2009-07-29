;;=============================================================================
;; ����������� ����������
;;=============================================================================
;;-----------------------------------------------------------------------------
;; Cedet
(setq semantic-load-turn-useful-things-on t)
(load-file "~/.emacs.d/cedet-1.0pre6/common/cedet.el")
(global-set-key [?\C- ] 'semantic-ia-complete-symbol)

(defun my-semantic-hook ()
  (semantic-tag-folding-mode 1))
(add-hook 'semantic-init-hooks 'my-semantic-hook)
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
;; html-������
(require 'htmlize)
(setq htmlize-output-type (quote css))
;;-----------------------------------------------------------------------------
;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-font-lock-mode 1)
;;-----------------------------------------------------------------------------
;; Scheme
(require 'cmuscheme)
(setq scheme-program-name "mzscheme")
;M-x run-scheme
(require 'quack)
;;-----------------------------------------------------------------------------
;; auto-complete
(when (require 'auto-complete nil t)   
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
   (auto-complete-mode)
)
;;-----------------------------------------------------------------------------
;;���������� Sunrise Commander
;; M-x sunrise
(require 'sunrise-commander)
(autoload 'nc "nc" "Emulate MS-DOG file shell" t)
;;-----------------------------------------------------------------------------
;;;;;;;;;
;; Tabbar
(require 'tabbar)

(global-set-key [S-tab] 'tabbar-forward-tab)
(global-set-key [C-S-tab] 'tabbar-backward-tab)

;(set-face-foreground 'tabbar-default "LightSteelBlue")
;(set-face-background 'tabbar-default "DarkSlateGray")
;(set-face-foreground 'tabbar-selected "pale green")

(set-face-bold-p 'tabbar-selected t)
(set-face-attribute 'tabbar-button nil :box '(:line-width 1 :color "gray72"))

(setq tabbar-buffer-groups-function
      (lambda () 
        (list
         (cond
          ((find (aref (buffer-name (current-buffer)) 0) " *") "*")
          (t "All Buffers"))
         )))

(tabbar-mode t)
;; tabbar end
;;;;;;;;;;;;;
;;-----------------------------------------------------------------------------
;; ido
(require 'ido)
(ido-mode t)
(global-set-key "\C-x\C-f" 'ido-find-file)
(global-set-key "\C-x\b" 'ido-switch-buffer)

;ibuffer - ��� ���� ������ ������������ ����� ��������
(global-set-key "\C-x\C-b" 'ibuffer)

;����� �����
(defun prh:kill-current-buffer ()
    (interactive)
    (kill-buffer (current-buffer)))
(global-set-key "\C-w" 'prh:kill-current-buffer)
(global-set-key (kbd "C-x w") 'kill-buffer)
;;-----------------------------------------------------------------------------
;������ ������������� ������� � ����������
(icomplete-mode)
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
(load-file "~/.emacs.d/color-theme-6.6.0/themes/color-theme-aliceblue-mod.el")
(color-theme-aliceblue-mod) ;;������� ���������� �����
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

;;=============================================================================
;; KEYS
;;=============================================================================
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

; ����� ������
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)

;; Undo - wtf C-S-_
(global-set-key "\C-z" 'undo)

;;�������� ����
(global-set-key "\M-z" 'iconify-or-deiconify-frame)

;;��������������� ���� 
;;set right ;) font and maximizes
(defun prh:ajust-frame ()
  "Ajusts current frame to display properties"
  (interactive)
  (w32-send-sys-command 61488))
(prh:ajust-frame)

(defun join-next-line ()
  "Joins next line with current"
  (interactive)
  (progn
	(end-of-line)
	(next-line)
	(join-line)))
(global-set-key "\C-j" 'join-next-line)

;�������� ������� ��������� ��������
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(global-set-key "\C-\M-u" 'upcase-region)
(global-set-key "\C-\M-l" 'downcase-region)
(global-unset-key "\C-f")
(global-set-key "\C-fd" 'downcase-region)

(global-set-key "\C-a" 'mark-whole-buffer)
(global-set-key "\C-\M-k" 'kill-whole-line)
(global-set-key "\C-b" 'backward-delete-char)
(global-set-key "\C-d" 'delete-char);delete
(global-set-key [(meta f4)] 'save-buffers-kill-terminal)

(defun create-temp-buffer ()
  "Creates new buffer temp"
  (interactive)
  (progn
	(switch-to-buffer "temp")
	(lisp-interaction-mode)
	(switch-to-buffer nil)))
(create-temp-buffer)
(defun switch-to-temp-buffer ()
  "Canges current buffer to temp"
  (interactive)
  (switch-to-buffer "temp"))
(global-set-key "\C-x\C-c" 'switch-to-temp-buffer)
(global-set-key "\C-ft" 'switch-to-temp-buffer)

(defun switch-to-keys-buffer ()
  "Canges current buffer to keys.org"
  (interactive)
  (find-file "~/keys.org"))
(global-set-key "\C-fk" 'switch-to-keys-buffer)

(defun switch-to-emacs-buffer ()
  "Canges current buffer to .emacs"
  (interactive)
  (find-file "~/.emacs"))
(global-set-key "\C-fe" 'switch-to-emacs-buffer)

(global-set-key "\M-s" 'save-buffer)
(global-set-key "\C-s" 'isearch-forward)
(global-set-key "\C-r" 'isearch-backward)

(show-paren-mode 1) ;;��������� ������ ������
(setq inhibit-startup-message t) ;;�� ���������� ��������� ��� ������
(fset 'yes-or-no-p 'y-or-n-p) ;;�� ����������� ���� ������ yes �������
(setq default-tab-width 4) ;;���������

;;-----------------------------------------------------------------------------
;; ���������
;;
;��������� ������ ��� ����������� �����
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))

(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

(global-set-key [(control down)] 'gcm-scroll-down)
(global-set-key [(control up)]   'gcm-scroll-up)

;(require 'smooth-scrolling)
;(setq smooth-scroll-margin 4)

    (defun sfp-page-down ()
      (interactive)
      (next-line
       (- (window-text-height)
          next-screen-context-lines)))
    
    (defun sfp-page-up ()
      (interactive)
      (previous-line
       (- (window-text-height)
          next-screen-context-lines)))
    
    (global-set-key [next] 'sfp-page-down)
    (global-set-key [prior] 'sfp-page-up)

;; ��� ���������
;(setq scroll-step 1)
;; ���� ���� ����� �� ������� ���� �� ����� �� ������������� ������,
;; �� ���������� ���� ���������, ����� ������� ����� � ����
(setq scroll-conservatively 50)
(setq scroll-up-agressively 0)
(setq scroll-down-agressively 0)

;; �� �������� ��������� ����� ����� ���������
(setq scroll-preserve-screen-position t)
;; ������� ���������
(setq scroll-margin 4)
;;
;;-----------------------------------------------------------------------------

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

;;=============================================================================
;;
;;��������� �������� ������������ Ispell
;;
(require 'flyspell)
(require 'ispell)

(setq
 ; i like aspel, and you?
 ispell-program-name "aspell"

 ; my dictionary-alist, using for redefinition russian dictionary
 ispell-dictionary-alist 
 '(("english"                       ; English
    "[a-zA-Z]"
    "[^a-zA-Z]"
    "[']"
    nil
    ("-d" "en")
    nil iso-8859-1)
   ("russian"                       ; Russian
    "[�����Ũ����������������������������������������������������������]"
    "[^�����Ũ����������������������������������������������������������]"
    "[-]"
    nil
    ("-C" "-d" "ru")
    nil utf-8)
   (nil                             ; Default
    "[A-Za-z]"
    "[^A-Za-z]"
    "[']"
    nil
    ("-C")
    nil iso-8859-1))

 ispell-russian-dictionary "russian"
 ispell-english-dictionary "english"
 flyspell-default-dictionary ispell-russian-dictionary
 ispell-dictionary ispell-english-dictionary
 ispell-local-dictionary ispell-russian-dictionary
 ispell-extra-args '("--sug-mode=ultra"))

(defun flyspell-russian ()
  (interactive)
  (flyspell-mode t)
  (ispell-change-dictionary ispell-russian-dictionary)
  (flyspell-buffer)
  (message "Russian dictionary - Spell Checking completed."))

; English
(defun flyspell-english ()
  (interactive)
  (flyspell-mode t)
  (ispell-change-dictionary ispell-english-dictionary)
  (flyspell-buffer)
  (message "English dictionary - Spell Checking completed."))

(setq ispell-highlight-face (quote flyspell-incorrect))
(setq ispell-have-new-look t)
(setq ispell-enable-tex-parser t)
(add-hook 'text-mode-hook 'flyspell-mode)
(setq flyspell-delay 1)
(setq flyspell-always-use-popup t)

(global-set-key [f1] 'ispell-word)
(global-set-key [f7] 'ispell-buffer); ��������� ���������� � ������� ������
(global-set-key [f8] 'ispell-region)
(global-set-key [f9] 'auto-fill-mode); ���/���� ��������������
(global-set-key [f10] 'flyspell-english)
(global-set-key [f11] 'flyspell-russian)
(global-set-key [f12] 'flyspell-mode); ���/���� �������� ���������� "�� ����"
;;
;;=============================================================================

;;
;;
(message "*************************")
(message "*** .emacs loaded OK. ***")
(message "*************************")
;;
;; end of .emacs
;;
;;