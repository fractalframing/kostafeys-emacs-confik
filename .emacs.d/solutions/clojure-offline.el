;;; clojure-offline.el -- The set of functions to help use clojure offline.

;;; Copyright © 2013 - Kostafey <kostafey@gmail.com>

;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software Foundation,
;;; Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.  */

;;; Usage:

;; 1. Select (mark) dependencies vector in the defproject expression of the 
;;    project.clj file, like here (selection is marked by # symbols):
;;
;;   :dependencies #[[org.clojure/clojure "1.5.1"]
;;                   [compojure "1.1.5"]
;;                   [me.raynes/laser "1.1.1"]
;;                   [mysql/mysql-connector-java "5.1.24"]
;;                   [korma "0.3.0-RC5"]
;;                   [lib-noir "0.4.9"]]#
;;
;; 2. Run M-x clj-off-create-script RET RET

(defvar clojure-offline-script-buffer-name "*clojure-offline*")

(defun force-symbol-name (some-symbol)
  "Return lisp symbol `some-symbol' as a string at all costs!"
  (mapconcat 'char-to-string
             (string-to-list (symbol-name some-symbol)) ""))

(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
  (replace-regexp-in-string 
   "\\`[ \t\n]*" "" 
   (replace-regexp-in-string "[ \t\n]*\\'" "" string)))

;;----------------------------------------------------------------------
;;
;;;###autoload
(defun clj-off-parse-artifact (artifact-name)
  "Parse `artifact-name' to list (`group-id' `artifact-id' `version')
Input formats, e.g.:
 [org.clojure/clojure \"1.5.1\"]
 org.clojure:clojure:pom:1.5.1
Ouptut format, e.g.:
 (\"org.clojure\" \"clojure\" \"1.5.1\")"
  ;; lein format as string e.g. "[org.clojure/clojure \"1.5.1\"]"
  (let* ((artifact-name
          (if (and (stringp artifact-name)
                   (equal (substring (trim-string artifact-name) 0 1) "["))
              (read (trim-string artifact-name))
            artifact-name)))
    (let* ((is-lein-format (vectorp artifact-name))
           artifact-list
           group-and-artifact
           group-id
           artifact-id
           version)
      (if is-lein-format
          ;; lein format, e.g. [org.clojure/clojure "1.5.1"]
          (progn
            (setq group-and-artifact
                  (split-string (force-symbol-name (elt artifact-name 0)) "/"))
            (setq group-id (nth 0 group-and-artifact))
            (setq artifact-id (if (> (length group-and-artifact) 1)
                                  (nth 1 group-and-artifact)
                                (nth 0 group-and-artifact)))
            (setq version (elt artifact-name 1)))
        ;; maven format, e.g. "org.clojure:clojure:pom:1.5.1"
        (progn
          (setq artifact-list (split-string artifact-name ":"))
          (setq group-id (nth 0 artifact-list))
          (setq artifact-id (nth 1 artifact-list))
          (setq version (nth 3 artifact-list))))
      (list group-id artifact-id version))))

;;;###autoload
(defmacro clj-off-with-artifact (artifact-name &rest body)
  "Inject `group-id' `artifact-id' `version' local variables to the `body'
scope."
  `(let* ((artifact (clj-off-parse-artifact ,artifact-name))
          (group-id (nth 0 artifact))
          (artifact-id (nth 1 artifact))
          (version (nth 2 artifact)))
     ,@body))

;;----------------------------------------------------------------------
;;
;;;###autoload
(defun clj-off-get-clojars-url (artifact-name)
  "Convert from maven's `artifact-name' to probably jar url location on
clojars.
E.g. convert from
lein-ring:lein-ring:pom:0.8.2
to
https://clojars.org/repo/lein-ring/lein-ring/0.8.2/lein-ring-0.8.2.jar"
  (clj-off-with-artifact
   artifact-name
   (concat "https://clojars.org/repo/"
           (mapconcat 'identity (split-string group-id "\\.") "/") "/"
           artifact-id "/" version "/"
           artifact-id "-" version ".jar")))

(defun clj-off-get-list-clojars-url (artifact-names-array)
  (map 'list 'clj-off-get-clojars-url artifact-names-array))

;;;###autoload
(defun clj-off-type-clojars-url (artifact-name)
  (interactive
   (list
    (read-from-minibuffer "Clojure artifact: "
                          (buffer-substring (mark) (point)) nil nil
                          'clj-off-artifact-name-history)))
  (message (clj-off-get-clojars-url artifact-name)))

;;----------------------------------------------------------------------
;;
;;;###autoload
(defun clj-off-get-mvn-deploy (artifact-name)
  "Convert from maven's `artifact-name' to local maven repository creation
script.
E.g. convert from
lein-ring:lein-ring:pom:0.8.2
to
mvn deploy:deploy-file -DgroupId=lein-ring -DartifactId=lein-ring \
    -Dversion=0.8.2 -Dpackaging=jar -Dfile=lein-ring-0.8.2.jar \
    -Durl=file:maven_repository"
  (clj-off-with-artifact
   artifact-name
   (concat "mvn deploy:deploy-file "
           "-DgroupId=" group-id " "
           "-DartifactId=" artifact-id " "
           "-Dversion=" version " "
           "-Dpackaging=" "jar" " "
           "-Dfile=" artifact-id "-" version ".jar" " "
           "-Durl=" "file:maven_repository")))

(defun clj-off-get-list-mvn-deploy (artifact-names-array)
  (map 'list 'clj-off-get-mvn-deploy artifact-names-array))

;;----------------------------------------------------------------------
;;
(defun clj-off-create-script-buffer ()
  "Create buffer dedicated to output configure required clojure jars."
  (get-buffer-create clojure-offline-script-buffer-name))

;;;###autoload
(defun clj-off-create-script (artifact-names-array)
  (interactive
   (list
    (read-from-minibuffer "Clojure artifacts list: "
                          (buffer-substring (mark) (point)) nil nil
                          'clj-off-artifacts-list-history)))
  (let ((artifact-names-array (if (stringp artifact-names-array)
                                  (read (trim-string artifact-names-array))
                                artifact-names-array)))
    (set-buffer (clj-off-create-script-buffer))
    (erase-buffer)
    (toggle-truncate-lines nil)
    (mapc (lambda (art) (insert (concat "wget " art "\n")))
          (clj-off-get-list-clojars-url artifact-names-array))
    (insert "\n")
    (mapc (lambda (art) (insert (concat art "\n")))
          (clj-off-get-list-mvn-deploy artifact-names-array))
    (switch-to-buffer (clj-off-create-script-buffer))))

(provide 'clojure-offline)
