;;=============================================================================
;;Человеку свойственно ошибаться, но для нечеловеческих ляпов нужен компьютер.
;;                                                                  Пол Эрлих
;;
;;Kostafey's emacs confik :) 
;;started from 08.08.2008, 22:45:25
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;

(server-start)
;;=============================================================================
;; Указываем где будут лежать файлы расширений
;;=============================================================================
(defvar site-lisp-path "~/.emacs.d/")
(add-to-list 'load-path site-lisp-path)

;;-----------------------------------------------------------------------------
;auto-customized custom-set-variables
(setq custom-file (concat site-lisp-path "custom/custom.el"))
(load custom-file)

;;-----------------------------------------------------------------------------
(defvar custom-conf-lisp-path (concat site-lisp-path "custom/"))
(add-to-list 'load-path custom-conf-lisp-path)

(require 'look-and-feel)
(require 'key-bindings)

;;;;;;;;;;;;;;;;;;;;;;

(require 'switch-language)
(require 'ispell-conf)
(require 'completition-conf)
(require 'communications)
(require 'reencoding-file)
(require 'history-conf)

(require 'text-modes-conf)

; (require 'version-control)
;; (require 'ide)
;; (require 'maxima-conf)
;; (require 'haskell-conf)
;; (require 'java-conf)
(require 'scheme-conf)
(require 'auctex-conf)
(require 'java-script-conf)
;; (require 'python-conf)

;; (require 'misc-swarm)

(require 'el-get-conf)
;;-----------------------------------------------------------------------------
(add-to-list 'load-path (concat site-lisp-path "my-task-centric/"))
(require 'calc-time)
(require 'hibernate-mapping)

(require 'emacs-lisp-conf)

;;=============================================================================

;;; In praise of Emacs, The One True Editor
;;; 1.0 Aug 19, 1994
;;; 2.0 Aug 28, 1994
;;; Rather ecclesiastical, though.
;;; -elf
(defun praise-emacs()
  "In praise of emacs"
  (interactive)
  (message "Praise Emacs...")
  (sit-for 2)
  (message "Amen."))

(message "*************************")
(message "*** .emacs loaded OK. ***")
(message "*************************")
;;
;; end of .emacs
;;
;;

(global-set-key 
 (kbd "C-c h")  
 '(lambda() (interactive)
    (progn
      (save-buffer)
      (shell-command 
       "sphinx-build -b html C:/myworkspaces/doc/ C:/myworkspaces/doc/build-html/")
      (delete-other-windows))))

(require 'whitespace)
(subword-mode)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; (setq inhibit-field-text-motion 1)
;; (setq words-include-escapes t)
;; (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
;; (modify-syntax-entry ?\n "w" text-mode-syntax-table)

  
;(setq w32-get-true-file-attributes nil)
(setq w32-quote-process-args t)


