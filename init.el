﻿;;=============================================================================
;; Человеку свойственно ошибаться, но для нечеловеческих ляпов нужен компьютер.
;;                                                                  Пол Эрлих
;; To err is human, but to really foul things up you need a computer.
;;                                                               Paul Ehrlich
;;
;; Kostafey's emacs confik :) 
;; started from 08.08.2008, 22:45:25
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;

(server-start)
(defvar *emacs-load-start* (current-time))
;;=============================================================================
;; Elisp extensions paths
;;=============================================================================
(defvar site-lisp-path "~/.emacs.d/") ; root extensions folder
(add-to-list 'load-path site-lisp-path)
;;-----------------------------------------------------------------------------
;; Third-party *.el files (in general low-supporded, misplaced in ELPA)
;; without any patching or with tiny patches, stored in this repo.
(defvar third-party-lisp-path (concat site-lisp-path "artifacts/"))
(add-to-list 'load-path third-party-lisp-path)
;; Personal customization
(defvar custom-conf-lisp-path (concat site-lisp-path "custom/"))
(add-to-list 'load-path custom-conf-lisp-path)
;; Reusable customization
(defvar solutions-path
  (file-name-as-directory (expand-file-name "solutions" site-lisp-path)))
(add-to-list 'load-path solutions-path)
;;-----------------------------------------------------------------------------
(require 'cedet-conf)
;;-----------------------------------------------------------------------------
;auto-customized custom-set-variables
(setq custom-file (concat custom-conf-lisp-path "custom.el"))
(load custom-file)
;;-----------------------------------------------------------------------------

(require 'functions)
(require 'look-and-feel)

(require 'elpa-conf)
(require 'ide)
;; (add-to-list 'load-path (concat site-lisp-path "popup-switcher/"))
;; (require 'popup-switcher)

(add-to-list 'load-path
             (concat site-lisp-path 
                     "clomacs/src/elisp/"))
(require 'clomacs)
(require 'ejc-sql-conf nil 'noerror)

(require 'switch-language)
(require 'ispell-conf)
(require 'completition-conf)
(require 'ack-conf)
(require 'communications nil 'noerror)
(require 'reencoding-file)

(require 'copy-paste-clipboard-linux)
(require 'key-bindings)

(require 'history-conf)
(require 'text-modes-conf)

(require 'version-control)
;; (require 'maxima-conf)
;; (require 'haskell-conf)
(require 'emacs-lisp-conf)
(require 'java-conf)
(require 'clojure-conf)
(require 'scheme-conf)
(require 'auctex-conf)
(require 'java-script-conf)
(require 'aj-compilation)
(require 'sphinx-frontend)
;; (require 'python-conf)
;; (require 'ejc-sql-conf nil 'noerror)

;; (require 'misc-swarm)

;; (require 'el-get-conf)
(require 'calc-time)
(require 'hibernate-mapping)

(setq w32-quote-process-args t)

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

(message "My .emacs loaded in %ds" 
         (let ((emacs-sub-version 
                (string-to-number (nth 2 (split-string emacs-version "\\.")))))
           (if (and (>= emacs-major-version 24)
                    (>= emacs-minor-version 2)
                    (>= emacs-sub-version 1))
               (destructuring-bind              
                   (hi lo ms ps)
                   (current-time)
                 (- (+ hi lo) (+ (first *emacs-load-start*)
                                 (second *emacs-load-start*))))
             (destructuring-bind              
                 (hi lo ms)
                 (current-time)
               (- (+ hi lo) (+ (first *emacs-load-start*)
                               (second *emacs-load-start*)))))))

(message "*************************")
(message "*** .emacs loaded OK. ***")
(message "*************************")
;;
;; end of .emacs
;;
;;


