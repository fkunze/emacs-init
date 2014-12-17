;-*- coding: utf-8 -*-
; Fritz Kunze's emacs init file.
; 2008-08N
;
;;; seehttp://emacsredux.com/blog/2013/04/05/recently-visited-files/
(message "hello from ~/.emacs.d/init.el")
(show-paren-mode 1)
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode 1)
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c r") 'recentf-ido-find-file)
(global-set-key (kbd "C-c C-r") 'recentf-ido-find-file)
(global-set-key [(meta f11)] 'xsteve-ido-choose-from-recentf)


  (package-initialize)

(add-to-list 'load-path (expand-file-name "c:/program files (x86)/maxima-5.31.2/share/maxima/5.31.2/emacs"))

;;http://stackoverflow.com/questions/19145433/shortcut-for-inserting-environments-in-org-mode

(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'maxima "maxima" "Maxima interaction" t)

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((maxima . t)
;;    (emacs-lisp . t)
;;    (ruby . t)
;;    )) ; this line activates maxima

;; (setq org-capture-templates
;;   '(("t" "Todo" entry (file+headline "~/dropbox/todo.org" "Tasks")
;;      "* TODO %?\n  %i\n SCHEDULED: %t\n %a\n :PROPERTIES: :CREATED: %U :END:"
;;          :prepend t)
;;     ("n" "Notes" entry (file+datetree "~/dropbox/notes.org" "Notes")
;;      "* Note %?\n %i\n :NOTE:\nEntered on %U\n %a\n"
;;          :prepend t)))

;; (add-to-list 'org-structure-template-alist '("C" "#+begin_comment\n?\n#+end_comment"))

;; My old version of the remember template
;; (setq org-remember-templates (quote (
;; ("todo" ?t "* TODO %?\n  %u\n  %a" "~/dropbox/todo.org" "Tasks" nil)
;; ("note" ?n "* %?                                        
;;     :NOTE:\n  :CLOCK:\n  :END:\n  %U\n  %a" "~/dropbox/notes.org" "Notes" nil)
;; ("phone" ?p "* PHONE %:name - %:company -                
;;     :PHONE:\n  Contact Info: %a\n  %u\n  %?" "~/dropbox/todo.org" "Phone" nil)
;; ("appointment" ?a "* %?\n  %U" "~/dropbox/todo.org" "Appointments" nil))))

;; John Wiegley's current version of the capture template
;; (quote (("t" "Task" entry (file+headline "~/Documents/Tasks/todo.txt" "Inbox") "* TODO %?
;; SCHEDULED: %t
;; :PROPERTIES:
;; :ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
;; :END:" :prepend t))))


;;Following is code I found to highlight changes
;;http://emacs-fu.blogspot.com/2009/05/tracking-changes.html

;; higlight changes in documents
(global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil); initially hide and then toggle highlight-changes-visible-mode when you want to see what has changed.

;; toggle visibility
(global-set-key (kbd "<f6>")      'highlight-changes-visible-mode) ;; changes
;; remove the change-highlight in region
(global-set-key (kbd "S-<f6>")    'highlight-changes-remove-highlight)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

;; alt-pgup/pgdown jump to the previous/next change

;; if you're not already using it for something else...
(global-set-key (kbd "<M-prior>") 'highlight-changes-next-change)
(global-set-key (kbd "<M-next>")  'highlight-changes-previous-change)



(add-to-list 'load-path "~/.emacs.d")



(setq python-shell-interpreter "C:\\Python27\\python.exe")

(define-key global-map "\C-cc" 'org-capture)


;----
; loading custom commands and functions in ~/.emacs.d
;


(message "hey fritz - we are now processing our ~/.emacs.d/init.el")
(message "hey fritz - we are now processing our ~/.emacs.d/noran.el")

(message "hey fritz - we are loading the file ~\\.emacs.d\\init.el")
(message "hey fritz - we are loading the file ~\\.emacs.d\\init.el")
(message "hey fritz - we are loading the file ~\\.emacs.d\\norang.el")

(message "hey fritz - we are now processing our ~/.emacs.d/edit_server.el")

(load-file  "~/.emacs.d/edit_server.el")

(message "hey fritz - we are loading the file ~\\.emacs.d\\edit_server.el")

(message "hey fritz - we are now processing our emacs postscript printer code")

(if (string= system-name "CORPLAPTP65") ; Works in office only
    (progn
      ;;  Windows printer
      (setq-default ps-lpr-command (expand-file-name "/gs/gsview/gsprint.exe"))
      (setq-default ps-printer-name t)
      (setq-default ps-printer-name-option nil)
      (setq ps-lpr-switches '("-query")) ; show printer dialog
      (setq ps-printer-name "//BRN001BA92A3E67")
      (setq printer-name "//BRN001BA92A3E67")
      (setq ps-right-header '("/pagenumberstring load" ps-time-stamp-mon-dd-yyyy))))


(message "hey fritz - we finished processing our emacs postscript printer code")

(message "hey fritz - we are loading our emacs scratch buffer changes")


(load-file  "~/.emacs.d/scratchbuffer.el")


(message "hey fritz - we've finished loading our emacs scratch buffer changes")

(message "hey fritz - display pathname in frame title code")

;; SHOW FILE PATH IN FRAME TITLE
;; (setq-default frame-title-format "%b (%f)")
(setq frame-title-format '((:eval default-directory)))


(message "hey fritz - we are loading our emacs keyboard shortcuts")

(load-file  "~/.emacs.d/keyboard.el")


(message "hey fritz - we've finished loading our emacs keyboard shortcuts")

(message "hey fritz - we are loading a way to print files")
(load-file  "~/.emacs.d/emacs_print.el")

(message "hey fritz - we finished loading a way to print files")



(message "hey fritz - we are loading our abbrev_defs.el")

(load-file  "~/.emacs.d/abbrev_defs.el")

(message "hey fritz - we've finished loading our abbrev_defs.el")

(message "hey fritz - we are loading our elisp_util.el")

(load-file  "~/.emacs.d/elisp_util.el")

(message "hey fritz - we've finished loading our elisp_util.el")

(message "hey fritz - we are loading rainbow-mode.el")

(load-file "~/.emacs.d/rainbow-mode.el")

(message "hey fritz - we've finished loading rainbow-mode.el")

(load-file  "~/.emacs.d/rainbow-delimiters.el")

(message "hey fritz - we've finished loading rainbow-delimiters.el")

(message "hey fritz - we are loading our rst_mods.el which add functionality to rst-mode")

(load-file  "~/.emacs.d/rst_mods.el")

(message "hey fritz - we've finished loading our rst_mode.el")


(require 'ido)


;;Uniquify

;; I use uniquify to distinguish between two identically named files as the default, appending a <n> extension, is rubbish. This tip is from Trey Jackson (http://trey-jackson.blogspot.com/2008/01/emacs-tip-11-uniquify.html). I changed it later to one that was offered by xah lee that follows.



;; make buffer names easily identifiable
(require 'uniquify) ; bundled with GNU Emacs 23.2.1 or earlier
(setq uniquify-buffer-name-style 'forward)

;;setq x- select- enable-clipboard t)
;; Use IDO to find recent files
(require 'recentf)
(recentf-mode t)
;;
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
	  (mapcar (lambda (x)
		    (cons (file-name-nondirectory x)
			  x))
		  recentf-list))
	 (filename-list
	  (remove-duplicates (mapcar #'car file-assoc-list)
			     :test #'string=))
	 (filename (ido-completing-read "Choose recent file: "
					filename-list
					nil
					t)))
    (when filename
      (find-file (cdr (assoc filename
			     file-assoc-list))))))
(global-set-key "\C-x\ \C-r" 'recentf-ido-find-file)


;; Display Completions Vertically

;; It’s a lot easier to scan long path names if they’re displayed vertically, instead of horizontally. Run this to achieve just that:

;;(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;;You’ll want to set truncate-lines to nil if you do this.

;    ""                                  ; right bracket around the sole remaining completion

  (defun my-ido-minibuffer-setup-hook ()
    ;; allow line wrapping in the minibuffer
    (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'my-ido-minibuffer-setup-hook)





(message "hey fritz - we finished load code to make recent files possible through ido-mode")

; from stack overflow - how to push copies from external programs onto the kill ring
(defadvice kill-new (before kill-new-push-xselection-on-kill-ring activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external selection to the kill ring"
  (let ((have-paste (and interprogram-paste-function
                         (funcall interprogram-paste-function))))
    (when have-paste (push have-paste kill-ring))))


(load-file   "~/.emacs.d/browse-kill-ring.el")
(load-file  "~/.emacs.d/browse-kill-ring-plus.el")
(require 'browse-kill-ring)
(require 'browse-kill-ring+)



;;IIMAGE
;; (add-to-list 'iimage-mode-image-regex-alist
;;              (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
;;                            "\\)\\]")  1))


;; (defun org-toggle-iimage-in-org ()
;;   "display images in your org file"
;;   (interactive)
;;   (if (face-underline-p 'org-link)
;;       (set-face-underline-p 'org-link nil)
;;       (set-face-underline-p 'org-link t))
;;   (iimage-mode))




(server-start)

(message "hey fritz - we've set up runemacs and emacsclientw.exe")

(require 'help-fns+)

(message "hey fritz - we've set up help-fns.el - an easier way to read help on emacs")

(message "hey fritz - we are loading the latest version of org-mode now")

;;see http://orgmode.org/worg/org-contrib/org-track.html
;; to learn how one might do automatic upgrades

;(add-to-list 'load-path "~/.emacs.d/org-6.36/lisp")
;(add-to-list 'load-path "~/.emacs.d/org-6.36/contrib/lisp")

;(add-to-list 'load-path "~/.emacs.d/org-7.8.09/")
;(require 'org-install)
;(add-to-list 'load-path "~/.emacs.d/org-7.8.09/contrib/lisp")

(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/from-org-mobile.org")




(message "hey fritz - we are loading our org-projects.el which defines how we publish org-mode files")

(load-file  "~/.emacs.d/org-projects.el")

(message "hey fritz - we've finished loading our org-projects.el")

(message "hey fritz - we are loading my  modifications to org based on wiegley's code and others for using org and gtd")

(load-file  "~/.emacs.d/emacs_org-mods.el")

(message "hey fritz - we've finished loading our emacs_org-mods.el")

(message "hey fritz - we are setting up rainbow-delimiters mode for everything")

;(require 'rainbow-delimiters)
;(global-rainbow-delimiters-mode) ;; require it everywhere - see the file for more information
;;(when (require 'rainbow-delimiters nil 'noerror) 
;;  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode))

(message "hey fritz - we are loading modifications to solve a minor problem with different fonts for kanji, hiragana, katakana and romaji")
;;See https://groups.google.com/group/gnu.emacs.help/browse_thread/thread/0d7eb081b0e695ee/836e8bd3abc7ae46?show_docid=836e8bd3abc7ae46&pli=1

(set-fontset-font ; fix japanese font
 "fontset-default" 'japanese-jisx0208
 (if (eq window-system 'x)
     "-jis-fixed-medium-r-normal--24-230-75-75-c-240-jisx0208.1983-0"
 "-outline-MS Mincho-normal-normal-normal-mono-24-*-*-*-c-*-jisx0208*-*")) 

(message "hey fritz - we've finished fixing japanese font problems")

(message "hey fritz - we are loading setting up spell checking now")
(defun turn-spell-checking-on ()
  "Turn speck-mode or flyspell-mode on."
  ;; (speck-mode 1)
  (flyspell-mode 1)
  )

(add-hook 'text-mode-hook 'turn-spell-checking-on)
(add-hook 'org-mode-hook 'turn-spell-checking-on)
(add-hook 'rst-mode-hook 'turn-spell-checking-on)

;; repeat simple and complex commands
(global-set-key (kbd "C-.") 'repeat)


(message "hey fritz - we've finished setting up spell checking now")

(global-set-key (kbd "<f12>") 'org-agenda)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-mode t t)
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(current-language-environment "UTF-8")
 '(default-frame-alist (quote ((font . "-outline-Courier New-normal-r-normal-normal-21-157-96-96-c-*-iso8859-1") (top . 10) (left . 150) (tool-bar-lines . 1) (menu-bar-lines . 1) (right-fringe) (left-fringe))))
 '(doc-view-ghostscript-program (executable-find "mgs"))
 '(exec-path (quote ("c:/Program Files (x86)/AMD APP/bin/x86_64" "C:/Program Files (x86)/Common Files/Microsoft Shared/Windows Live" "C:/Program Files (x86)/Common Files/Microsoft Shared/Windows Live" "C:/Program Files/Common Files/Microsoft Shared/Windows Live" "C:/Program Files (x86)/Common Files/Microsoft Shared/Windows Live" "C:/Windows/system32" "C:/Windows" "C:/Windows/System32/Wbem" "C:/Windows/System32/WindowsPowerShell/v1.0/" "C:/Program Files (x86)/Windows Live/Shared" "C:/Program Files/Intel/DMIX" "C:/Program Files (x86)/QuickTime/QTSystem/" "C:/Program Files (x86)/Calibre2/" "C:/Program Files (x86)/Common Files/Roxio Shared/DLLShared/" "C:/Program Files (x86)/Common Files/Roxio Shared/DLLShared/" "C:/Program Files (x86)/Common Files/Roxio Shared/13.0/DLLShared/" "C:/Program Files (x86)/Vim/vim74" "C:/bin/mksmin" "C:/Python27" "C:/Python27/Lib" "C:/Python27/DLLs" "C:/Python27/Lib/lib-tk" "C:/Python27/Lib/site-packages" "C:/Python27/Scripts" "C:/bin/mksmin/Aspell/bin" "C:/bin/mksmin/grep-2.5.4-bin/bin" "C:/Program Files/Java/jdk1.6.0_25/bin" "C:/android-sdk/tools" "C:/Program Files (x86)/ATI Technologies/ATI.ACE/Core-Static" "C:/Program Files (x86)/GnuWin32/bin" "C:/Program Files (x86)/Toshiba/Bluetooth Toshiba Stack/sys/" "C:/Program Files (x86)/Toshiba/Bluetooth Toshiba Stack/sys/x64/" "C:/Program Files (x86)/emacs/bin" "C:/bin/SysinternalsSuite" "C:/Program Files/Calibre2/" "C:/Program Files/TortoiseHg/" "C:/Ruby193/bin" "C:/Program Files (x86)/Google/google_appengine" "C:/Program Files/Mercurial" "C:/Program Files (x86)/Google/google_appengine/" "c:/Program Files (x86)/emacs/bin" "c:/Program Files (x86)/emacs/lib-src/oo-spd/i386" "c:/Program Files (x86)/emacs/lib-src/oo/i386" "C:/Program Files (x86)/Maxima-5.31.2/bin/")))
 '(focus-follows-mouse nil)
 '(global-visual-line-mode t)
 '(grep-command "findstr.exe /n /s /r   ")
 '(grep-use-null-device t)
 '(gud-pdb-command-name "python -u c:/python27/lib/pdb.py ")
 '(ido-case-fold t)
 '(ido-decorations (quote ("
-> " "" "
   " "
   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
 '(ido-enable-flex-matching t)
 '(ido-enable-last-directory-history t)
 '(ido-everywhere t)
 '(ido-max-file-prompt-width 0.75)
 '(ido-max-work-directory-list 80)
 '(ido-max-work-file-list 100)
 '(ido-mode (quote both) nil (ido))
 '(ido-show-dot-for-dired t)
 '(ido-use-filename-at-point t)
 '(indicate-empty-lines t)
 '(inhibit-startup-echo-area-message "fkunze")
 '(inhibit-startup-screen t)
 '(ispell-program-name "C:\\bin\\mksmin\\Aspell\\bin\\aspell.exe")
 '(mouse-autoselect-window t)
 '(mouse-drag-copy-region t)
 '(mouse-wheel-follow-mouse t)
 '(mouse-wheel-mode t)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 3) ((control)))))
 '(mouse-yank-at-point t)
 '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "<[^>
]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/dropbox/todo.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-archive-location "~/dropbox/archive.org %s_archive::* From %s")
 '(org-babel-maxima-command "c:/PROGRA~2/MAXIMA~1.2/bin/maxima.bat")
 '(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item . auto))))
 '(org-clock-history-length 28)
 '(org-clock-in-resume t)
 '(org-clock-in-switch-to-state (quote bh/clock-in-to-started))
 '(org-clock-into-drawer "CLOCK")
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-completion-use-ido t)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/dropbox/notes.org")
 '(org-directory "~/OrgProjects")
 '(org-export-html-mathjax-template "<script type=\"text/javascript\" src=\"%PATH\">
/**
 *
 * @source: %PATH
 *
 * @licstart  The following is the entire license notice for the
 *  JavaScript code in %PATH.
 *
 * Copyright (C) 2012-2013  MathJax
 *
 * Licensed under the Apache License, Version 2.0 (the \"License\");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an \"AS IS\" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @licend  The above is the entire license notice
 * for the JavaScript code in %PATH.
 *
 */

/*
@licstart  The following is the entire license notice for the
JavaScript code below.

Copyright (C) 2012-2013 Free Software Foundation, Inc.

The JavaScript code below is free software: you can
redistribute it and/or modify it under the terms of the GNU
General Public License (GNU GPL) as published by the Free Software
Foundation, either version 3 of the License, or (at your option)
any later version.  The code is distributed WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU GPL for more details.

As additional permission under GNU GPL version 3 section 7, you
may distribute non-source (e.g., minimized or compacted) forms of
that code without the copy of the GNU GPL normally required by
section 4, provided you include this license notice and a URL
through which recipients can access the Corresponding Source.


@licend  The above is the entire license notice
for the JavaScript code below.
*/
<!--/*--><![CDATA[/*><!--*/
    MathJax.Hub.Config({
        // Only one of the two following lines, depending on user settings
        // First allows browser-native MathML display, second forces HTML/CSS
        :MMLYES: config: [\"MMLorHTML.js\"], jax: [\"input/TeX\"],
        :MMLNO: jax: [\"input/TeX\", \"output/HTML-CSS\"],
        extensions: [\"tex2jax.js\",\"TeX/AMSmath.js\",\"TeX/AMSsymbols.js\",
                     \"TeX/noUndefined.js\"],
        tex2jax: {
            inlineMath: [ [\"\\\\(\",\"\\\\)\"] ],
            displayMath: [ ['$$','$$'], [\"\\\\[\",\"\\\\]\"], [\"\\\\begin{displaymath}\",\"\\\\end{displaymath}\"] ],
            skipTags: [\"script\",\"noscript\",\"style\",\"textarea\",\"pre\",\"code\"],
            ignoreClass: \"tex2jax_ignore\",
            processEscapes: true,
            processEnvironments: true,
            preview: \"TeX\"
        },
        showProcessingMessages: true,
        displayAlign: \"%ALIGN\",
        displayIndent: \"%INDENT\",

\"TeX\": {equationNumbers: { autoNumber: \"AMS\" }}

,\"SVG\": {
               linebreaks: { automatic: true, width: \"container\" } },

\"HTML-CSS\": {
             scale: %SCALE,
             linebreaks: { automatic: true, width: \"container\" },
             availableFonts: [\"STIX\",\"TeX\"],
             preferredFont: \"TeX\",
             webFont: \"TeX\",
             imageFont: \"TeX\",
             showMathMenu: true,
        },
        MMLorHTML: {
             prefer: {
                 MSIE:    \"MML\",
                 Firefox: \"MML\",
                 Opera:   \"HTML\",
                 other:   \"HTML\"
             }
        }
    });
/*]]>*///-->
</script>")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-icalendar-include-todo t)
 '(org-id-method (quote org))
 '(org-insert-heading-respect-content nil)
 '(org-log-into-drawer t)
; '(org-remember-store-without-prompt t)
; '(org-remember-templates (quote ((116 "* TODO %?
;  %u" "~/dropbox/todo.org" "Tasks") (110 "* %u %?" "~/dropbox/notes.org" "Notes"))))
 '(org-return-follows-link nil)
 '(org-reverse-note-order t)
 '(org-special-ctrl-a/e t)
 '(org-support-shift-select t)
 '(org-todo-keyword-faces (quote (("TODO" :foreground "medium blue" :weight bold) ("APPT" :foreground "medium blue" :weight bold) ("NOTE" :foreground "brown" :weight bold) ("STARTED" :foreground "dark orange" :weight bold) ("WAITING" :foreground "red" :weight bold) ("DELEGATED" :foreground "dark violet" :weight bold) ("DEFERRED" :foreground "dark blue" :weight bold) ("SOMEDAY" :foreground "dark blue" :weight bold))))
 '(org-todo-keywords (quote ((sequence "TODO" "APPT" "|" "DONE" "NOTE"))))
 '(org-use-speed-commands t)
 '(python-indent 2)
 '(python-indent-offset 2)
 '(python-python-command "C:\\Python27\\python.exe")
 '(recentf-max-saved-items 1000)
 '(recentf-mode t)
; '(remember-annotation-functions (quote (org-remember-annotation)))
;'(remember-handler-functions (quote (org-remember-handler)))
 '(safe-local-variable-values (quote ((after-save-hook archive-done-tasks) (after-save-hook sort-done-tasks) (after-save-hook commit-after-save))))
 '(select-active-regions t)
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(uniquify-after-kill-buffer-p t)
 '(uniquify-buffer-name-style (quote reverse) nil (uniquify))
 '(uniquify-ignore-buffers-re "^\\*")
 '(uniquify-separator "|"))



(defalias 'list-buffers 'ibuffer)
(message "hey fritz - you just replaced list-buffers with ibuffer")

   
(message "hey fritz - we are fixing an emacs bug such that when you open a “.xml” file, the file is opened with the old xml mode the sgm-mode, not nxml-mode")

(add-to-list 'auto-mode-alist '("<!DOCTYPE html .+DTD XHTML .+>" . nxml-mode) )

;; formerly '("\\.xml\\'" . nxml-mode))


;;; this must be loaded after the (load ... eli/fi-site-init.el) 
;;; to solve a compatibilty problem

;; (setq fi:eli-compatibility-mode nil)

;; (defun alisp ()
;;   (interactive)
;;   (let ((lisp-directory "C:\\Program Files\\acl81\\")
;;         (lisp-name "mlisp"))
;;     (fi:common-lisp (format "*%s*" lisp-name)
;;                     lisp-directory
;;                     (format "%s\\%s.exe" lisp-directory lisp-name)
;;                     (list "+B" "+cx" "+M")
;;                     fi:common-lisp-host
;;                     (format "%s.dxl" lisp-name))))



;; (defun add-to-load-path (path-string)
;;   (message (format "Passed %S..." path-string))
;;   (if (stringp path-string)
;;       (when (file-exists-p path-string)
;; 	(message (format "Adding %S to load-path..." path-string))
;; 	(add-to-list 'load-path (expand-file-name path-string)))
;;     (crs-add-to-load-path (car path-string))
;;     (if (cdr path-string)
;; 	(crs-add-to-load-path (cdr path-string)))))


(message "Initialization complete") (sit-for 1)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 158 :width normal :foundry "outline" :family "Arial Unicode MS")))))

;; I don't know why these are here.  I commented them out to figure out what they do.

;(put 'upcase-region 'disabled nil)

;(put 'downcase-region 'disabled nil)

;(put 'narrow-to-region 'disabled nil)

;; 3 remember templates for TODO tasks, Notes, and Phone calls
;(setq org-remember-templates (quote (
;("todo" ?t "* TODO %?\n  %u\n  %a" "~/dropbox/todo.org" "Tasks" nil)
;("note" ?n "* %?                                        
;    :NOTE:\n  :CLOCK:\n  :END:\n  %U\n  %a" "~/dropbox/notes.org" "Notes" nil)
;("phone" ?p "* PHONE %:name - %:company -                
;    :PHONE:\n  Contact Info: %a\n  %u\n  %?" "~/dropbox/todo.org" "Phone" nil)
;("appointment" ?a "* %?\n  %U" "~/dropbox/todo.org" "Appointments" nil))))




(load "org-todo.el")


;;; Git Bash
(setq explicit-shell-file-name
      "C:/Program Files (x86)/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")
