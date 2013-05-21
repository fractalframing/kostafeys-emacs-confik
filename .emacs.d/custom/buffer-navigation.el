;;-----------------------------------------------------------------------------
;; ibuffer sorting
(setq-default ibuffer-default-sorting-mode 'major-mode)

;;-----------------------------------------------------------------------------
;; Here's a handy function that kills the current buffer and removes
;; the file it is connected to.
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;;-----------------------------------------------------------------------------
;Убить буфер
(defun prh:kill-current-buffer ()
    (interactive)
    (kill-buffer (current-buffer)))

;;=============================================================================
;; Переключения буферов
;; Buffers changing
;;=============================================================================
;;-----------------------------------------------------------------------------
;; Tabbar
(require 'tabbar)

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

;;=============================================================================

;;; save minibuffer history between sessions
(when (> emacs-major-version 21) (savehist-mode t))
;;=============================================================================

(defun switch-to-temp-buffer ()
  "Swithes to temp buffer."
  (interactive)
  (progn
    (let ((temp-buffer-name "temp"))
      (if (not (get-buffer temp-buffer-name))
          (progn 
            (switch-to-buffer temp-buffer-name)            
            (linum-mode t)
            ;; (flyspell-russian)
            (auto-fill-mode t)
            (setq auto-complete-mode t))
        (switch-to-buffer temp-buffer-name)))))

(defun copy-to-clipboard-buffer-file-path ()
  (interactive)
  "Copy current file path to the clipboard."
  (let ((result (kill-new (buffer-file-name))))
    (message result)
    result))

(defun copy-to-clipboard-buffer-file-name ()
  (interactive)
  "Copy current file name to the clipboard."
  (let ((result (kill-new (file-name-nondirectory (buffer-file-name)))))
    (message result)
    result))

(defun kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))

(provide 'buffer-navigation)

