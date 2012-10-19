;;; key-bindings.el -- A collection of key bindings (default and custom).

;;; Commentary:

;; Attempting to make emacs a little bit humane.

;;=============================================================================
;; Exit & iconify emacs
(global-set-key (kbd "M-z") 'iconify-or-deiconify-frame)    ; Hide emacs frame
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)

;;=============================================================================
;; CUA - the core of the emacs humane ;)
;;
(cua-mode t)
;;
;; Region selection:
(setq transient-mark-mode t)
(setq x-select-enable-clipboard t)
;;-----------------------------------------------------------------------------
(global-set-key (kbd "C-S-v") 'cua-paste-pop)
(global-set-key (kbd "M-S-v") '(lambda() (interactive) (cua-paste-pop -1)))
;;-----------------------------------------------------------------------------
(global-set-key (kbd "C-e") 'cua-exchange-point-and-mark)
(global-set-key (kbd "C-S-e") '(lambda() (interactive) (cua-exchange-point-and-mark 1)))
;;-----------------------------------------------------------------------------
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "M-s") 'set-mark-command)
;;-----------------------------------------------------------------------------
(require 'redo)
(global-unset-key "\C-_")

(global-set-key (kbd "C-z") 'undo)              ; Undo C-z
(global-set-key [(meta backspace)] 'undo)
(global-set-key (kbd "C-S-z") 'redo)            ; Redo C-S-z

(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'repeat)

(global-set-key "\C-b" 'backward-delete-char)
(global-set-key "\C-d" 'delete-char)            ; delete
(global-set-key "\C-q" 'quoted-insert)
(global-set-key [(delete)] 'delete-char)

;;-----------------------------------------------------------------------------
(global-set-key (kbd "C-s") 'save-buffer)
;; Cancel all changes from last save
(global-set-key (kbd "C-x r") 'revert-buffer)
(global-set-key (kbd "C-x RET r") 'revert-buffer-with-coding-system)

;;=============================================================================
;; Keyboard prefixes
;;
(global-unset-key "\C-\M-a")
(defvar selected-area-prefix "\C-\M-a")
(defvar change-buffer-prefix "\C-c\C-b")

(require 'buffer-navigation)
(require 'navigation-and-simplify-keys)
(require 'basic-text-editing)

;;=============================================================================
;;           Basic point movements & change buffer's position
;;
;; Physical line navigation:
;; move up down end begin over the real visible screen lines
(require 'physical-line)
(physical-line-mode 1)

(global-set-key (kbd "<up>")   'previous-line)
(global-set-key (kbd "<down>") 'next-line)
(global-set-key (kbd "<end>")  'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)
;;-----------------------------------------------------------------------------
(global-set-key (kbd "C-<right>")   'step-forward-word)
(global-set-key (kbd "C-<left>")    'step-backward-word)
(global-set-key (kbd "C-S-<right>") 'step-forward-select)
(global-set-key (kbd "C-S-<left>")  'step-backward-select)
;;-----------------------------------------------------------------------------
(global-set-key [(meta control down)] 'forward-sentence)
(global-set-key [(meta control up)]   'backward-sentence)
;;-----------------------------------------------------------------------------
(require 'pager)
;; Bind scrolling functions from pager library.
(global-set-key [next] 	   'pager-page-down)
(global-set-key [prior]	   'pager-page-up)
;;-----------------------------------------------------------------------------
;; Scrolling without point movement
(global-set-key (kbd "C-l") 'recenter-top-bottom)

(if (< emacs-major-version 24)
    (progn
    (global-set-key [(control down)] (lambda () (interactive) (scroll-up 1))) ; [C-down]
    (global-set-key [(control up)] (lambda () (interactive) (scroll-down 1)))) ; [C-up]
  (progn
    (global-set-key [(control down)] 'scroll-up-line) ; [C-down]
    (global-set-key [(control up)] 'scroll-down-line))) ; [C-up]
;;
;;=============================================================================

;;=============================================================================
;;                         Point hyper-jumps
;;
;;-----------------------------------------------------------------------------
; bookmarks
(global-set-key (kbd "C-o") 'bookmark-set)
(global-set-key (kbd "C-p") 'bookmark-jump)
;;-----------------------------------------------------------------------------
(require 'goto-last-change)
(global-set-key (kbd "C-x x") 'goto-last-change)
;;-----------------------------------------------------------------------------
;; Search & replace
(global-unset-key (kbd "C-f"))
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)

(global-unset-key (kbd "M-r"))
(global-set-key (kbd "M-r") 'replace-string)
;;
;;=============================================================================

;;=============================================================================
;;                        Text transformations
;;
;;-----------------------------------------------------------------------------
;; Word operations
(global-set-key (kbd "M-t") 'transpose-words)
(global-set-key (kbd "M-y") '(lambda() (interactive) (transpose-words -1)))
;;-----------------------------------------------------------------------------
;; Line operations
(global-set-key (kbd "C-j") 'join-next-line-space-n)
(global-set-key (kbd "C-c j") 'join-next-line-n)
(global-set-key (kbd "C-c C-j") 'join-next-line-semicolon-n)

(global-set-key (kbd "C-c c") 'center-line)

(global-set-key (kbd "C-M-k") 'kill-whole-line)
(global-set-key (kbd "C-k") 'kill-line)

(global-set-key (kbd "C-S-c") 'copy-line)
(global-set-key (kbd "C-S-l") 'mark-line)
(global-set-key (kbd "C-c d") 'duplicate-line)
;; Toggle whether to fold or truncate long lines for the current buffer.
(global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)
;;-----------------------------------------------------------------------------
;; Paragraph operations
(global-set-key (kbd "C-c q")  'unfill-paragraph)
;;-----------------------------------------------------------------------------
;; Rectangle operations
(global-set-key (kbd "C-M-a n") 'rectangle-number-lines)
(global-set-key (kbd "C-M-a v") 'string-insert-rectangle)
(global-set-key (kbd "C-M-a c") 'copy-rectangle-to-clipboard)
;(global-set-key (kbd "M-u") 'cua-upcase-rectangle) - default
;;-----------------------------------------------------------------------------
;; Upcase/downcase
(global-set-key (kbd "C-c w") 'toggle-letter-case)
;; (global-unset-key "\C-\M-c")
(global-set-key (kbd "C-M-a l") 'downcase-region)
(global-set-key (kbd "C-M-a d") 'downcase-region)
(global-set-key (kbd "C-M-a u") 'upcase-region)
(global-set-key (concat selected-area-prefix "u") 'upcase-region)
(global-set-key (concat selected-area-prefix "l") 'downcase-region)
;;-----------------------------------------------------------------------------
;; Region & misc operations
(global-set-key (kbd "C-M-a :") 'align-by-column)
(global-set-key (kbd "C-M-a '") 'align-by-quote)

(global-set-key (kbd "C-;") 'comment-or-uncomment-this)

(global-set-key (kbd "C-`") 'u:en/ru-recode-region)

(global-set-key (kbd "C-M-R") 'replace-regexp)
(global-set-key (kbd "M-R") 'query-replace)
(global-set-key (kbd "C-M-a k") 'keep-lines)
(global-set-key (kbd "C-M-a f") 'flush-lines)
;;
;;=============================================================================

;;=============================================================================
;; Meta - Навигация
;;=============================================================================
(global-set-key "\M-g" 'goto-line)
;;l - влево j - вправо i - вверх k - вниз	
(global-set-key "\M-i" 'previous-line)
(global-set-key "\M-k" 'next-line)
(global-set-key "\M-j" 'backward-char)
(global-set-key "\M-l" 'forward-char)

(global-set-key "\C-cr" 'reposition-window)
(global-unset-key "\M-\C-l")
(global-set-key "\M-\C-j" 'backward-word)
(global-set-key "\M-\C-l" 'forward-word)

(global-set-key "\M-o" 'end-of-line)
(global-set-key "\M-u" 'beginning-of-line)

(global-set-key "\M-m" 'scroll-up)
(global-set-key "\M-," 'scroll-down)

(global-set-key "\M-M" '(lambda () (interactive) (scroll-up 1)))
(global-set-key "\M-<" '(lambda () (interactive) (scroll-down 1)))

;;=============================================================================
;; Look changes
;;
(global-set-key [(meta return)] 'toggle-fullscreen)
;; Folding
(global-set-key [(control meta tab)] 'fold-dwim-toggle-selective-display)
(global-set-key "\C-cf" 'semantic-tag-folding-fold-block)
(global-set-key "\C-cs" 'semantic-tag-folding-show-block)
;; Change font size
(global-set-key (kbd "C-+")      '(lambda nil (interactive) (djcb-zoom 1)))
(global-set-key [C-kp-add]       '(lambda nil (interactive) (djcb-zoom 1)))
(global-set-key (kbd "C--")      '(lambda nil (interactive) (djcb-zoom -1)))
(global-set-key [C-kp-subtract]  '(lambda nil (interactive) (djcb-zoom -1)))
;;
;;=============================================================================

;;=============================================================================
;; Gathering information
;;
(global-set-key (kbd "C-?") 'describe-char)
(global-set-key "\C-\M-a\C-c" 'count-words-region)
;;
;;=============================================================================

;;=============================================================================
;; Buffers navigation
;;
(global-set-key "\C-w" 'prh:kill-current-buffer)
(global-set-key (kbd "C-x w") 'kill-buffer)
(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

;(global-set-key (kbd "C-x <right>") 'next-buffer) - default
;(global-set-key (kbd "C-x <left>") 'previous-buffer) - default

(global-set-key [(control next)] 'next-buffer) 		; C-Page Up
(global-set-key [(control prior)] 'previous-buffer)	; C-Page Down

;;-----------------------------------------------------------------------------
;; tabbar - switch buffers by tabs 
(global-set-key [S-tab] 'tabbar-forward-tab)
(global-set-key [C-S-tab] 'tabbar-backward-tab)
(global-set-key [(meta shift left)] 'tabbar-backward-tab)
(global-set-key [(meta shift right)] 'tabbar-forward-tab)
;;-----------------------------------------------------------------------------
;; ido - switch buffers by completiotion
(require 'ido)
(ido-mode t)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (concat change-buffer-prefix "b") 'switch-to-buffer)
;;-----------------------------------------------------------------------------
;; ibuffer - list of all buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;-----------------------------------------------------------------------------
(require 'bs) ;; other list of buffers
(global-set-key (kbd "C-x C-n") 'bs-show)
;;-----------------------------------------------------------------------------
;; lusty-explorer
(when (require 'lusty-explorer nil 'noerror)
  (global-set-key (kbd "C-c C-f") 'lusty-file-explorer)
  (global-set-key (kbd "C-c C-x")   'lusty-buffer-explorer))
;;-----------------------------------------------------------------------------
;; buffers shortcuts
(global-set-key (concat selected-area-prefix "\C-e") 
                '(lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (concat change-buffer-prefix "e") 
                '(lambda () (interactive) (find-file "~/.emacs")))

(global-set-key "\C-x\C-c" 'switch-to-temp-buffer)
(global-set-key (concat change-buffer-prefix "t") 'switch-to-temp-buffer)

(global-set-key (concat change-buffer-prefix "p") 
                '(lambda () (interactive) (find-file "~/.org.gpg")))
(global-set-key (concat change-buffer-prefix "k") 
                '(lambda () (interactive) (find-file "~/.keys.org")))

;;
;;=============================================================================

;;=============================================================================
;; Windows navigation
;;
(global-unset-key "\C-u")
(global-set-key "\C-u" 'swap-windows)
       
(global-unset-key (kbd "M-m"))
(global-set-key (kbd "M-m") 'mirror-window)

(global-set-key [(control tab)] 'other-window) ; C-tab switchs to a next window
(windmove-default-keybindings 'meta)           ; M-up/down/left/right

(global-set-key (kbd "s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<down>") 'shrink-window)
(global-set-key (kbd "s-<up>") 'enlarge-window)
;;
;;=============================================================================

;;=============================================================================
;; Modes enabling
;;
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)
;; auto-complete-mode
(global-set-key [f7] 'auto-complete-mode)
(define-key ac-mode-map (kbd "C-SPC") 'auto-complete) ;; to 'set-mark-command use M-s instead
(define-key ac-complete-mode-map [next] 'ac-page-next)
(define-key ac-complete-mode-map [prior] 'ac-page-previous)
(define-key ac-complete-mode-map (kbd "C-f") 'ac-isearch)

(require 'reencoding-file)
(global-set-key [f8] 'recode-buffer-rotate-ring)

(global-set-key [f1] 'ispell-word)
;; (global-set-key [f7] 'ispell-buffer); проверить орфографию в текущем буфере
;; (global-set-key [f8] 'ispell-region)
(global-set-key [f9] 'auto-fill-mode); вкл/выкл автозаполнения
(global-set-key [f10] 'flyspell-english)
(global-set-key [f11] 'flyspell-russian)
(global-set-key [f12] 'flyspell-mode); вкл/выкл проверки орфографии "на ходу"

;; yasnippet
(defvar yasnippet-prefix "\C-y")
(global-unset-key yasnippet-prefix)
(global-set-key (concat yasnippet-prefix "n") 'yas/new-snippet)
(global-set-key (concat yasnippet-prefix "f") 'yas/find-snippets)
(global-set-key (concat yasnippet-prefix "v") 'yas/visit-snippet-file)
(global-set-key (concat yasnippet-prefix "r") 'yas/reload-all)
;;
;;=============================================================================

;;=============================================================================
;;                               Mouse
;;
;; Select by mouse and shift
;;-----------------------------------------------------------------------------
;; shift + click select region
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)
(put 'mouse-set-point 'CUA 'move)
;;-----------------------------------------------------------------------------
;; ctrl + shift + click select rectange region
(require 'cua-base)
(global-unset-key (kbd "<C-S-down-mouse-1>"))
(global-set-key (kbd "<C-S-mouse-1>") 'hkb-mouse-mark-cua-rectangle)
(define-key cua--rectangle-keymap (kbd "<C-S-mouse-1>") 'hkb-mouse-mark-cua-rectangle)
;;
;;=============================================================================

(provide 'key-bindings)
