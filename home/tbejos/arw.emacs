;;  file: .emacs
;;
;;  This file contains all of the information for configuring gnu-emacs
;;  the way I like it.  Some of the things in this file require version 19.
;;  Also required are some of the file in ~arw/emacs-bin/.
;;
;;


;; Path to search for autoload files
;;XXX Require no longer seems to work with load-path.
(setq load-path (append '("/home/arw/emacs-bin") load-path))
; (setq load-path (cons "/home/arw/emacs-bin" load-path))

(byte-recompile-directory "~/emacs-bin" nil)
(kill-buffer "*Compile-Log*")

(setq paren-mode 'paren)
(require 'paren)
; (require 'indent)
(load "~/emacs-bin/indent.el")

; (load-library "p4")
(load "p4")
(setq p4-file-refresh-timer-time 8640000)


;;;
;;;  VARIABLE SETTINGS
;;;

(setq user "arw")

(setq inhibit-startup-message t)	; Startup message is boring
(setq delete-auto-save-files t)		; Delete # files upon ^X^S of file
(setq require-final-newline nil)	; Otherwise, emacs will add one.
(setq scroll-step 1)			; Otherwise, it will jump-scroll.
(show-paren-mode)			; Show which paren I'm closing.
; (setq compile-command "scons -u PX_USE_SHARED_CACHE=0 ")
(setq compile-command "scons -u ")
(setq lpr-command "enscript")
(setq lpr-switches '("-R1"))
(setq default-major-mode 'text-mode)
(setq compilation-window-height 15)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq visible-bell t)

;; Don't require newlines at the ends of files
(setq truncate-partial-width-windows nil) 

;; This is supposed to help cut-and-paste.
(set-clipboard-coding-system (quote x-ctext-unix))

;; Version Control
(setq vc-initial-comment t)	; Get an initial comment describing the file.
; (setq vc-mistrust-permissions t)	; Check master file for lock status.
(setq vc-static-header-alist nil)	; No header string association.

(setq c++-tab-always-indent 'tab-inside-strings)
(setq c-tab-always-indent nil)

;; Allow lisp expression evaluation
(put 'eval-expression 'disabled nil)


;; Default values for vairables.
;;
;; Often, you need to use setq-default instead of setq for variables that are
;; local to each buffer.  Otherwise, the value might get set to some system
;; default when a new buffer is opened.
(setq-default fill-column 78)	; I think this gets overwritten
(setq-default display-time-day-and-date t)

;; Pixar Coding Conventions (these are actually set later in this file):
(make-variable-buffer-local 'c-basic-offset)	; This is NOT the default!
(make-variable-buffer-local 'c-continued-statement-offset)
(setq-default c-basic-offset 4)
(setq-default c-continued-statement-offset 4)


;; Require confirmation when quitting.
;; Add commented version of preceding line in case emacs deleted this:
; (put 'save-buffers-kill-terminal 'disabled "Are you sure you want to exit?\n")


;;;
;;;  KEY BINDINGS
;;;

(global-set-key "\C-h" 'backward-delete-char)
; (global-set-key "\C-x " 'set-mark-command) ;  eliminate ctrl-space for mark

(global-set-key "\C-cc" 'compile)
(global-set-key "\C-cl" 'center-line-at-top) ; display line at top of buffer
(global-set-key "\C-ck" 'center-line-at-bottom)
(global-set-key "\C-xw" 'spell-word)
(global-set-key "\C-cw" 'what-line)
(global-set-key "\C-cg" 'goto-line)

;; Slide up and down one line
(global-set-key "\M-p" '(lambda  () (interactive)
			  (scroll-down 1) (previous-line 1)))
(global-set-key "\M-n" '(lambda  () (interactive)
			  (scroll-up 1) (next-line 1)))

;; These are useful because of common typing mistakes
(global-set-key "\C-x\C-u" 'undo)
(global-set-key "\C-x\C-k" 'kill-buffer)

;; These require emacs-bin/my-comment.el
(global-set-key "\C-c\C-c" 'my-comment-toggle-region)
(global-set-key "\C-c\C-u" 'my-uncomment-region)

(global-set-key "\C-x\C-q" 'p4-edit)

;; These require emacs-bin/my-buffer.el
(global-set-key "\C-ce" 'run-line-in-other-window) ; put line in  other window
(global-set-key "\C-xb" 'my-switch-buffer)
(global-set-key "\C-x4b" 'my-switch-buffer-other-window)
(global-set-key "\C-cf" 'flip-files)

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\M-h" 'help-for-help)
(global-set-key "\M-o" 'kill-paragraph)
(global-set-key "\M-d" 'kill-this-word-forward)
(global-set-key "\C-x!" 'shell)
(global-set-key "\C-x8" 'split-window-vertically) ; c-x8 was undefined
(global-set-key "\C-x9" 'split-window-horizontally) ; c-x9 was undefined
(global-set-key "\C-x2" "\C-x8\C-xb")
(global-set-key "\C-x&" 'shrink-window)

; Set incremental search keys to do regexp searches.
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-cr" 'replace-regexp)
(global-set-key "\C-cq" 'query-replace-regexp)

(global-set-key "\M-s" 'center-line)

;; Function Key Bindings
(global-set-key [f1] 'help-for-help)
(global-set-key [f2] 'flip-files)
;; For some reason f3 and f4 no longer work.
; (global-set-key [f3] 'my-switch-other-buffer)
; (global-set-key [f4] 'revert-buffer)
(global-set-key [f5] 'revert-buffer)


(defun last-elem (list)
  (if (eq (cdr list) nil)
      (car list)
    (last-elem (cdr list))))

(defun previous-buffer ()
  "Switch to the last visited buffer."
  (interactive)
  (bury-buffer))

(defun next-buffer ()
  "Switch to the buffer at the bottom of the stack."
  (interactive)
  (switch-to-buffer (last-elem (buffer-list))))

(global-set-key [f6] 'previous-buffer)
(global-set-key [f7] 'next-buffer)


(defun gpto-next-error ()
  (interactive)
  (next-error)
  (hilit-recenter nil)
  )

(defun gpto-insert-mark-comment ()
  (interactive)
  (save-buffer)
  (p4-edit nil)
  (set-mark-command nil)
  (insert "//arwXXX")
  (newline)
)
(defun gpto-insert-question-comment ()
  (interactive)
  (save-buffer)
  (p4-edit nil)
  (set-mark-command nil)
  (insert "//arwYYY")
  (newline)
)

(global-set-key [f8] 'gpto-next-error)
(global-set-key [f9] 'gpto-insert-mark-comment)
(global-set-key [f10] 'gpto-insert-question-comment)

;; Unset this one because I hit it when I want \C-x\C-f
(global-unset-key "\C-x\C-d")

;; I hate it when I accidentally turn on overwrite-mode!
(global-unset-key [insert])


;;;
;;; MINIBUFFER COMPLETION STUFF
;;;

;; Don't require confirmation for minibuffer completion.  This is the default.
(setq minibuffer-completion-confirm nil)

;; This allow a way override completion and create a new file or buffer.
(define-key minibuffer-local-completion-map "\C-C" 'exit-minibuffer)
(define-key minibuffer-local-must-match-map "\C-C" 'exit-minibuffer)

;; This makes it so that emacs won't stop completing buffernames each
;; time it encounters punctuation.
(define-key minibuffer-local-completion-map "\ " 'minibuffer-complete)
(define-key minibuffer-local-must-match-map "\ " 'minibuffer-complete)

;; This allows cancellation of the minibuffer.
;; I think these are in the defaults. 
(define-key minibuffer-local-completion-map  "\C-G" 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map "\C-G" 'abort-recursive-edit)

;; Allow this to be different for different modes and buffers.
(make-variable-buffer-local 'compile-command)



;;
;; Abbreviations
;;

;; Read abbreviation file.
(read-abbrev-file "~/.abbrev_defs")

;; Turn abbreviation mode on.
(abbrev-mode 1)



;;;
;;;  EDITIING MODES
;;;

;; Which modes to use based on the #! line in a script file.
(setq interpreter-mode-alist
      (append '(("sh" . sh-mode)
		("csh" . sh-mode)
		("tcsh" . sh-mode)
		("gptsh" . tcl-mode)
		("querysh" . tcl-mode)
		("ifwish" . tcl-mode)
		("hookwish" . tcl-mode))
	      interpreter-mode-alist))

;; Set which mode to set for files with various names or extensions.
(setq auto-mode-alist
      (append '(
		("\\.C$"	.	c++-mode)
		("\\.h$"	.	preferred-mode)
		("\\.c\\+\\+$"	.	c++-mode)
		("\\.cxx$"	.	c++-mode)
		("\\.cpp$"	.	c++-mode)
		("\\.hpp$"	.	c++-mode)
		("\\.cpp\\."	.	c++-mode)
		("\\.ci$"	.	c++-mode)
		("\\.hi$"	.	c++-mode)
		("\\Proto_h$"	.	c++-mode)
		("\\Proto_cpp"	.	c++-mode)
		("\\.c$"	.	c-mode)
		("\\.cl$"	.	c++-mode)
		("\\.tex$"	.	tex-mode)
		("\\.outline$"	.	tex-mode)
		("\\.txt$"	.	text-mode)
		("\\.text$"	.	text-mode)
		("\\.ed.*$"	.	text-mode)	; zmail messages
		("tmp.report"	.	report-mode) ; sugs/bugs
		("\\.tcl$"	.	tcl-mode)
		("\\.gptsh$"	.	tcl-mode)
		("\\.mkp$"	.	tcl-mode)	; mkpuppet
		("\\.gojo$"	.	tcl-mode)	; gojo
		(".geppettorc"	.	tcl-mode)
 		("\\.emacs.*"	.	emacs-lisp-mode)
 		("\\.el$"	.	emacs-lisp-mode)
 		("\\.scm$"	.	lisp-mode)
 		("\\.html$"	.	html-helper-mode)
		("TODO"		.	text-mode)
		("README"	.	nroff-mode)
		("Makefile"	.	makefile-mode)
		("makefile"	.	makefile-mode)
		("Make.rules"	.	makefile-mode)
		("\\.p$"	.	perl-mode)
		("\\.pl$"	.	perl-mode)
		("\\.pm$"	.	perl-mode)
		("\\.perl$"	.	perl-mode)
		("\\.sh$"	.	sh-mode)
		("\\.csh$"	.	sh-mode)
		("\\.complete$"	.	sh-mode)
		("\\.alias$"	.	sh-mode)
		("\\.sl$"	.	sl-mode)	; Shader Language
		("\\.rib$"	.	rib-mode)	; RenderMan files
		("\\.rip$"	.	rib-mode)
		("\\.tail$"	.	rib-mode)
		("\\.m$"	.	mdl-mode)	; Pixar Mdl Mode
		("\\.qp$"	.	mdl-mode)
		("\\.def$"	.	mdl-mode)
		("\\.obj$"	.	mdl-mode)
		("\\.stdin$"	.	mdl-mode)
		("\\.hook$"	.	mdl-mode)
		("\\.rmm$"	.	mdl-mode)
		("\\.supe$"	.	supe-mode)	; Supe file mode
		("\\.py$"	.	python-mode)
		)
              auto-mode-alist))

;; Ignore files with these extensions
(setq completion-ignored-extensions
      (append '(".o" ".so" ".aux" ".log" ".loe" ".lof" ".toc" ".idx" ".ps" ".dvi" ".blg" ".bbl" ".slo" ".d" ".autohtml")
	      completion-ignored-extensions))


;; Files to be automatically loaded
(autoload 'my-comment-region "my-comment" "Default commenting routine" t)
(autoload 'my-uncomment-region "my-comment" "Default uncommenting routine" t)

(autoload 'my-switch-buffer "my-buffer" "Switch ONLY to existing buffer." t)
(autoload 'my-switch-other-buffer "my-buffer" "Switch to other-buffer." t)
(autoload 'my-switch-buffer-other-window "my-buffer"
  "Switch ONLY to existing buffer in another window." t)
(autoload 'reload-buffer "my-buffer"
  "If the file corresponding to the current buffer has changed, reload it." t)
(autoload 'run-line-in-other-window "my-buffer"
  "Run current line in the other window" t)
(autoload 'flip-files "my-buffer" "Toggle between .C and .h files." t)

; (autoload 'perl-mode "perl-mode.el" "Perl script editing commands" t)
; (autoload 'sl-mode "sl-mode.el" "Pixar Shader Language mode." t)
; (autoload 'rib-mode "rib-mode.el" "RenderMan mode." t)
; (autoload 'mdl-mode "mdl-mode" "Pixar Modeling Language mode." t)
; (autoload 'supe-mode "supe-mode" "Supe file editing mode." t)
; (autoload 'report-mode "report-mode.el" "Bugs & Sugs report mode." t)
(autoload 'python-mode "python-mode" "Pything script editing mode." t)

;;; Dbx mode
(autoload 'dbx "gud" "Dbx Mode" t)
(autoload 'dbx-last "gud" "Dbx Mode" t)
(autoload 'run-dbx "gud" "Dbx Mode" t)

;;; An HTML editing mode
(autoload 'html-helper-mode "html-helper-mode" "HTML helper mode" t)


;;
;;  Mode Hooks - Customize how various modes are initialized.
;;

(add-hook 'text-mode-hook
	  '(lambda ()
             (setq indent-tabs-mode t)
	     (setq require-final-newline nil)
	     (turn-on-auto-fill)
	     ))

(c-add-style "arw"
	     '((c-basic-offset . 4)
	       (c-hanging-braces-alist
		((class-open after)
		 (topmost-intro)
		 (substatement-open)
		 (innamespace)
		 (namespace-open)))
	       (c-echo-syntactic-information-p . t)
	       (c-offsets-alist
		(inline-open . 0)
		(innamespace . 0)
		(access-label . /)
		)))



;; Stuff that's the same in c and c++ mode.
(defun c-and-c++-common-mode-hook-stuff ()
  (setq tab-width 8)
  (setq fill-column 76)
  (setq c-basic-offset 4)
  (setq c-continued-statement-offset 4) 
  (local-set-key "\C-c\C-u" 'my-uncomment-region)
  (local-set-key "\M-\C-h" 'backward-kill-word))
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (c-and-c++-common-mode-hook-stuff)
	     (local-set-key "\C-c\C-c" 'my-comment-toggle-region)
	     (setq comment-start "// ")
	     (setq preferred-mode-string "c++")))
(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-and-c++-common-mode-hook-stuff)
	     (local-set-key "\C-c\C-c" 'my-c-comment-toggle-region)
	     (setq indent-tabs-mode nil)
	     (setq comment-start "/* ")
	     (setq comment-end " */")
	     (setq preferred-mode-string "c")))

(add-hook 'sh-mode-hook				;; Shell script mode
	  '(lambda ()
	     (local-set-key "\C-c\C-c" 'my-comment-toggle-region)
	     (local-set-key "\C-c\C-u" 'my-uncomment-region)
	     (setq comment-start "# ")
	     (setq tab-width 4)
	     (local-unset-key "$")))		; unset the macro key

(add-hook 'tcl-mode-hook			;; Tcl mode
	  '(lambda ()
	     (local-set-key "\C-c\C-c" 'my-comment-toggle-region)
	     (local-set-key "\C-c\C-u" 'my-uncomment-region)
	     (setq comment-start "# ")))

(add-hook 'report-mode-hook			;; Bug report mode
	  '(lambda ()
	     (turn-on-auto-fill)
	     (setq comment-start "	")		; Tab
	     (local-set-key "\M-q" 'fill-paragraph)
	     (setq fill-column 74)))

(add-hook 'emacs-lisp-mode-hook			;; Emacs lisp
	  '(lambda ()
; 	     (require 'my-comment)
             (load "~/emacs-bin/my-comment.el")
	     (setq comment-start "; ")))

(add-hook 'vc-log-mode				;; Version control mode
	  '(lambda ()
	     (setq fill-column 70)))

(add-hook 'makefile-mode-hook			;; Makefile mode
	  '(lambda ()
	    (local-unset-key "$")))		; unset the macro key

(add-hook 'html-helper-mode-hook		;; Html mode
	  '(lambda ()
	     (turn-on-auto-fill)
	     (setq fill-column 78)))

(add-hook 'mdl-mode-hook			;; Pixar mdl mode
	  '(lambda ()
	     (setq comment-start "# ")
	     (local-set-key "\C-c\C-c" 'my-comment-toggle-region)
	     (local-set-key "\C-c\C-u" 'my-uncomment-region)
	     (setq preferred-mode-string "mdl")
	     (setq compile-command "mtst -rs *.shot -q")))

(add-hook 'sl-mode-hook				;; PRMan shading language
	  '(lambda ()
	     (setq preferred-mode-string "sl")))

(add-hook 'supe-mode-hook			;; Pixarl supe file mode 
          '(lambda ()
	     (font-lock-fontify-buffer)	; do highlight colors
	     (local-set-key "\C-l" 'font-lock-fontify-buffer)))

(add-hook 'python-mode-hook
	  '(lambda ()
	     (font-lock-fontify-buffer)	; do highlight colors
	     (local-set-key "\C-c\C-c" 'my-comment-toggle-region)
; 	     (local-set-key "\C-cc" 'py-execute-buffer)
	     (local-set-key "\C-cc" 'compile)
	     ))


;; Mode hook functions
(defvar preferred-mode-string "c++"
  "String that gives the preferred mode for files with ambiguous extensions.")

(defun preferred-mode ()
  (cond
   ((equal preferred-mode-string "c++") (c++-mode))
   ((equal preferred-mode-string "mdl") (mdl-mode))
   ((equal preferred-mode-string "sl") (sl-mode))
   ((equal preferred-mode-string "c") (c-mode))))



;;;
;;;  FUNCTION DEFINITIONS
;;;

(defun center-line-at-top()
  "Recenter the current window so that the current line is at the top."
  (interactive) 
  (save-excursion
    (recenter 0)))

(defun center-line-at-bottom()
  "Recenter the current window so that the current line is at the bottom."
    (interactive) 
    (save-excursion
      (recenter (- (window-height) 2))))

(setq kill-word-regexp-string "[][{}()<>\\@|/*+=.,?!;:`'\"\t ---]")

(defun kill-this-word-forward()
  "Kill word in forward direction. The words are delimited via spaces on
    either side, and also by various other punctuation, parentheses, and end
    of lines..."
   (interactive)
   (save-excursion

     ; Find the beginning of the word
     (if (bobp)
	 (setq bow (point))
       (progn 
	 (re-search-backward (concat kill-word-regexp-string "\\|\n")) 
	 (forward-char)
	 (setq bow (point))))

     ; Find the end of the word
     (re-search-forward  (concat kill-word-regexp-string "\\|\n\\|\\'")) 
     (if (not (eobp)) (backward-char))
     (setq eow (point))

     ; If no word found, delete one whitespace character.
     (if (= bow eow)
	 (setq eow (1+ eow)))

     (kill-region bow eow) ; delete from beginning of word to end of word
   ))

(defun kill-this-word-backward()
  "Kill word in backward direction. The words are     
    delimited via spaces on either side, and also by 
    various other punctuation, parentheses, and end of lines..."
   (interactive)
   (save-excursion
     (re-search-backward (concat kill-word-regexp-string "\\|\n\\|^.")) 
     (if (not (bolp))
	 (progn 
	   (if (not (eobp))(forward-char))
	   (setq bow (point)))      ; set bow to beginning of word
       (progn 
	 (forward-char)
	   (setq bow (1- (point)))))
     (re-search-forward  (concat kill-word-regexp-string "\\|\n\\|^.\\|\\'")) 
     (if (not (eobp))
	 (backward-char))
     (setq eow (point))      ; set eow to end of word
     (if (= bow eow) (setq bow (1- bow)))
     (kill-region eow bow) ; delete from beginning of word to end of word, 
   ))


;; This forces completion to a known filename when loading a file.
;; (C-c overrides)  Similar to my-switch-buffer.
(defun my-find-file ()
  "Edit file FILENAME.
Switch to a buffer visiting file FILENAME.
Creates a new file/buffer if you hit C-c."
  (interactive)
  (switch-to-buffer
   (find-file-noselect 
    ;; 4th arg 't' means don't ask to confirm after completion
    (read-file-name "Find File: " nil nil t)))) 
(global-set-key "\C-x\C-f" 'my-find-file)


;; On each line in the current region, replace each newline with a space.
;; Also remove leading and trailing whitespace.  Do this by opening a shell
;; and running perl, piping the current region as input.
;;
(defun join-lines ()
  "Operating on the current region, replace each newline with a space.
Also remove leading and trailing whitespace from each lines.  Do this by
opening a shell and running perl, piping the current region as input."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end)
   "perl -e 'while(<>) { s\/^\\s*(.*)\\s*\$\/$1 \/\; print\; } print chr(10)\;\'"
   t)
)

(defun split-lines ()
  "Operating on the current region, replace each contiguous white space string
with a newline.  Do this by opening a shell and running perl, piping the
current region as input."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end)
   "perl -e 'while(<>) { split \/\\s+\/ \; foreach (@_) { print \; print chr(10)\; } }'"
   t)
)
;    "perl -e 'while(<>) { @words=split \/\\s+\/ \; foreach (@words) { print \; print chr(10)\; } }'"

(defun ascii ()
  "Print the ascii code of the first character in the region, in decimal."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end)
   "perl -e 'while(<>) { chomp; print ord; print chr(32); }'"
   nil)
)


;; Load this stuff now, so that is immediately available.
; (require 'my-comment)
(load "~/emacs-bin/my-comment.el")

; (require 'my-fill)
(load "~/emacs-bin/my-fill.el")
(load-file "/home/arw/emacs-bin/jpa-stuff.elc")

;; Show time on screen
(display-time)

; (menu-bar-mode nil)
(tool-bar-mode nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(c-default-style (quote ((java-mode . "java") (other . "arw"))))
 '(indent-tabs-mode nil)
 '(scroll-bar-mode (quote right)))

(put 'save-buffers-kill-terminal 'disabled nil)

