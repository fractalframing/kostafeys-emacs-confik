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
(require 'basic-text-editing)
(require 'navigation-and-simplify-keys)
(require 'buffer-navigation)
(require 'switch-language)
(require 'ispell-conf)
(require 'completition-conf)
(require 'communications)
(require 'reencoding-file)
(require 'history-conf)

(require 'text-modes-conf)
(require 'version-control)
(require 'ide)
;; (require 'maxima-conf)
;; (require 'haskell-conf)
(require 'java-conf)
(require 'scheme-conf)
(require 'auctex-conf)
(require 'java-script-conf)
;; (require 'python-conf)

(require 'misc-swarm)

;;-----------------------------------------------------------------------------
(add-to-list 'load-path (concat site-lisp-path "my-task-centric/"))
(require 'calc-time)
(require 'hibernate-mapping)

;;=============================================================================
;; Byte-compilation
;;
(setq max-specpdl-size 100000) ;for byte-compile
(setq max-lisp-eval-depth 500000)
;; cd ~/.emacs.d; emacs --batch -f batch-byte-compile **/*.el

(defun byte-recompile-custom-files()
  (interactive)
  (progn
    (byte-recompile-directory custom-conf-lisp-path 0 t)
    (byte-recompile-directory (concat site-lisp-path "my-task-centric/") 0 t)))
;;=============================================================================

(server-start)

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

