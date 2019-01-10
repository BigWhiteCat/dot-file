;;------语言环境字符集设置结束------------
(set-language-environment 'utf-8)

;;缩进
(setq tex-basic-offset 4)
(setq latex-basic-offset 4)
(setq php-basic-offset 4)

;;去行尾空格
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;;取消滚动栏
(set-scroll-bar-mode nil)
;;取消工具栏
(tool-bar-mode nil)
;;启动设置
(setq default-frame-alist
      '((vertical-scroll-bars)
	(tool-bar-lines . 0)
	(menu-bar-lines . 0)
	(right-fringe)
	(left-fringe)))

;;显示时间设置
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上

;;设置打开文件的缺省路径
(setq default-directory "/home/xiaohai")

;;关闭烦人的出错时的提示声
(setq visible-bell t)

;;关闭emacs启动时的画面
(setq inhibit-startup-message t)

;;关闭gnus启动时的画面
(setq gnus-inhibit-startup-message t)

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行列号(缓冲区的)
;; (global-linum-mode 1) ; always show line numbers
(setq column-number-mode t)
(setq line-number-mode t)


;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西
(setq kill-ring-max 200)

;; Autofill in all modes;;
(setq-default auto-fill-function 'do-auto-fill)

;;把 fill-column 设为 60. 这样的文字更好读
(setq default-fill-column 300)

;;tab键为8个字符宽度
(setq default-tab-width 8)

;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
(setq tab-stop-list ())

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3 scroll-conservatively 10000)

;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;打开括号匹配显示模式
(show-paren-mode t)

;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
(setq show-paren-style 'parenthesis)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。
(setq frame-title-format "emacs@%b")

;;在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)

;;设定不产生备份文件
(setq make-backup-files nil)

;;自动保存模式
(setq auto-save-mode nil)

;;允许屏幕左移
(put 'scroll-left 'disabled nil)

;;允许屏幕右移
(put 'scroll-right 'disabled nil)


;;允许emacs和外部其他程序的粘贴
;; (setq x-select-enable-clipboard t)

;;设置有用的个人信息,这在很多地方有用。
(setq user-full-name "jinxiaohai")
(setq user-mail-address "xiaohaijin@outlook.com")

;;Non-nil if Transient-Mark mode is enabled.
(setq-default transient-mark-mode t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 当浏览 man page 时，直接跳转到 man buffer。
(setq Man-notify-method 'pushy)

;;设置home键指向buffer开头，end键指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;; C-f5, 设置编译命令; f5, 保存所有文件然后编译当前窗口文件
(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
(global-set-key [C-f5] 'compile)
(global-set-key [f5] 'du-onekey-compile)

;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S jinxiaohai")

;;设置M-g为goto-line
(global-set-key (kbd "M-g") 'goto-line)

;; ;;取消control+space键设为mark
;; (global-set-key (kbd "C-SPC") 'nil)

;;代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'f90-mode-hook 'hs-minor-mode)

;;能把一个代码块缩起来，需要的时候再展开
;; C-c @ C-M-s 现实所有的代码
;; C-c @ C-M-h 折叠所有的代码
;; C-c @ C-s   显示当前代码区
;; C-c @ C-h   折叠当前代码区
;; C-c @ C-c   折叠/显示当前代码区


;;--------------模式的强制转换--------------
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.f\\'" . f90-mode))


;;------------------auctex------------------
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(require 'tex-mik)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(require 'tex)
(TeX-global-PDF-mode t)

;;----------------插件yasnippet------------------------
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)
;;(setf yas/indent-line 'fixed)


;;------------------company-mode-------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/company-mode")
(autoload 'company-mode "company" nil t)
(require 'company-clang)
;;设置最小的开始补全单词数
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)
;;设置延迟时间
(setq company-idle-delay 0)
(setq company-transformers '(company-sort-by-occurrence))
(defvar company-mode/enable-yas t "Enable yasnippet for all backends")


;;;;;;;;;;;;;;;;;;;;;;基于company的其它插件;;;;;
;;===============company-auctex=================
(add-to-list 'load-path "~/.emacs.d/plugins/company-auctex")
(require 'company-auctex)
(company-auctex-init)


;;==============company-c-header================
(add-to-list 'load-path "~/.emacs.d/plugins/company-c-headers")
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)


;;=====================tabbar=========================
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode 1)
;;设置tabbar
(global-set-key [(meta j)] 'tabbar-forward)
(global-set-key [(meta k)] 'tabbar-backward)


;;==================doxymacs================
(add-to-list 'load-path "~/.emacs.d/plugins/doxymacs/lisp")
(require 'doxymacs)
(doxymacs-mode)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

;;C++注释高亮
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(defconst doxymacs-C++-file-comment-template
  '("////////////////////////////////////////////////////////////////////////" > n
    "/// COPYRIGHT NOTICE" > n
    "/// COPYRIGHT (c) 2016, 金小海" > n
    "/// All rights reserved." > n
    "/// " > n
    "/// " (doxymacs-doxygen-command-char) "file    "
    (if (buffer-file-name)
	(file-name-nondirectory (buffer-file-name))
      "") > n
      "/// " (doxymacs-doxygen-command-char) "version 1.0" > n
      "/// " (doxymacs-doxygen-command-char) "author  " (user-full-name) (doxymacs-user-mail-address) > n
      "/// " (doxymacs-doxygen-command-char) "date    " (current-time-string) > n
      "/// " > n
      "/// " (doxymacs-doxygen-command-char) "brief   " (p "Brief description of this file: ") > n
      "/// " > n
      "/// 修订说明:最初版本" > n
    "////////////////////////////////////////////////////////////////////////" > n)
  "Default C++-style template for file documentation")
;; C-c d ? will look up documentation for the symbol under the point
;; C-c d r will rescan your doxygen tags file
;; C-c d f will insert a Doxygen comment for the next function
;; C-c d i will insert a Doxygen comment for the current file.
;; C-c d ; will insert a Doxygen comment for a member variable on the current line (like M-;).
;; C-c d m will insert a blank multi-line Doxygen comment.
;; C-c d s will insert a blank single-line Doxygen comment.
;; C-c d @ will insert grouping comments around the current region.


;;===================autopair=====================
(add-to-list 'load-path "~/.emacs.d/plugins/autopair/")
(require 'autopair)
(autopair-global-mode)


;;==================smex========================
(add-to-list 'load-path "~/.emacs.d/plugins/smex")
(require 'smex)
(smex-initialize)
;;全局键位的绑定。
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;加速启动
(global-set-key [(meta x)] (lambda ()
           (interactive)
           (or (boundp 'smex-cache)
               (smex-initialize))
               (global-set-key [(meta x)] 'smex)
               (smex)))
(global-set-key [(shift meta x)] (lambda ()
           (interactive)
           (or (boundp 'smex-cache)
           (smex-initialize))
           (global-set-key [(shift meta x)]'smex-major-mode-commands)
           (smex-major-mode-commands)))


;;================rainbow-delimiters==================
(add-to-list 'load-path "~/.emacs.d/plugins/rainbow-delimiters")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'LaTeX-mode-hook #'rainbow-delimiters-mode)


;;================markdown-mode====================
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "major mode for editing Github Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README \\.md\\'" . gfm-mode))


;;==============indent-guide==============
(add-to-list 'load-path "~/.emacs.d/plugins/indent-guide")
(require 'indent-guide)
;;全局启动
(indent-guide-global-mode)
;;设置颜色
;; (set-face-background 'indent-guide-face "dimgray")


;;============ido-vertical-mode===========
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(add-to-list 'load-path "~/.emacs.d/plugins/ido-vertical-mode")
(require 'ido-vertical-mode)
(ido-mode t)
(setq ido-save-directory-list-file nil)
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


;;===============theme================
(add-to-list 'custom-theme-load-path "~/.emacs.d/plugins/molokai-theme")
(setq molokai-theme-kit t)




;;==================elpy=====================
;;加载elpy
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
;;使用
(package-initialize)
(elpy-enable)
(setq elpy-rpc-python-command "python3")


;;================cmake=====================
(add-to-list 'load-path "~/.emacs.d/plugins/cmake")
(require 'cmake-mode)


;; ;;================多个repositories===========
;; (setq packager-archives
;;       '(("gnu" . "http://elpa.gnu.org.packages")
;;         ("marmadade" . "http://marmadade-repo.org/packages")
;;         ("melpa" . "https://melpa.org/packages")))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;================neotree================
;; (add-to-list 'load-path "~/.emacs.d/plugins/neotree")
;; (require 'neotree)
;; (global-set-key [f8] 'neotree-toggle)
;; (setq neotree-theme (if (display-grayscale-p) 'icons 'arrow))
;; (setq neo-smart-open t)

;; ;; ;;=============doom-themes===============
;; (add-to-list 'load-path "~/.emacs.d/plugins/doom-theme")
;; (require 'doom-themes)
;; (setq doom-themes-enable-bold t
;;       doom-themes-enable-italic t)
;; ;; (load-theme 'doom-one t) ;;默认色,看着最漂亮的
;; (load-theme 'doom-vibrant) ;;看着还行
;; ;; (load-theme 'doom-molokai) ;;颜色太亮
;; (load-theme 'doom-nova) ;;颜色太亮
;; (doom-themes-visual-bell-config)
;; (doom-themes-org-config)


;; ;;=============root-help===============
;; (add-to-list 'load-path "~/.emacs.d/plugins/root-help")
;; (require 'root-help)
;; (defun root-c++-mode-hook ()
;;   "Hook for C++ mode - binding ROOT functions"
;;   (define-key c++-mode-map "\C-crc"  'root-class)
;;   (define-key c++-mode-map "\C-crh"  'root-header-skel)
;;   (define-key c++-mode-map "\C-crs"  'root-source-skel)
;;   (define-key c++-mode-map "\C-cri"  'root-include-header)
;;   (define-key c++-mode-map "\C-crm"  'root-main)
;;   (define-key c++-mode-map "\C-crl"  'root-insert-linkdef)
;;   (define-key c++-mode-map "\C-crp"  'root-insert-pragma)
;;   (define-key c++-mode-map "\C-crx"  'root-shell)
;;   (define-key c++-mode-map "\C-crg"  'root-send-line-to-root)
;;   (define-key c++-mode-map "\C-crr"  'root-send-region-to-root)
;;   (define-key c++-mode-map "\C-crb"  'root-send-buffer-to-root)
;;   (define-key c++-mode-map "\C-crf"  'root-execute-file))
;; (add-hook 'c++-mode-hook 'root-c++-mode-hook)


;; ;;===============emms===============
;; (add-to-list 'load-path "~/.emacs.d/plugins/emms/lisp")
;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)


;; ;;==================web-mode=====================
;; (add-to-list 'load-path "~/.emacs.d/plugins/web-mode")
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (setq web-mode-engines-alist
;;       '(("php"    . "\\.phtml\\'")
;;         ("blade"  . "\\.blade\\."))
;;       )
;; (add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("/some/react/path/.*\\.js[x]?\\'" . web-mode))

;; (setq web-mode-content-types-alist
;;       '(("json" . "/some/path/.*\\.api\\'")
;;         ("xml"  . "/other/path/.*\\.api\\'")
;;         ("jsx"  . "/some/react/path/.*\\.js[x]?\\'")))
;; (setq web-mode-markup-indent-offset 2)
;; (setq web-mode-css-indent-offset 2)
;; (setq web-mode-code-indent-offset 2)
;; (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
;; (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
;; (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
;; (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
;; (setq web-mode-style-padding 1)
;; (setq web-mode-script-padding 1)
;; (setq web-mode-block-padding 0)
;; (setq web-mode-comment-style 2)
;; (setq web-mode-extra-auto-pairs
;;       '(("erb"  . (("beg" "end")))
;;         ("php"  . (("beg" "end")
;;                    ("beg" "end")))
;;         ))
;; (setq web-mode-enable-auto-pairing t)
;; (setq web-mode-enable-css-colorization t)



;; ;;=================web-mode==================
;; (add-to-list 'load-path "~/.emacs.d/plugins/web-mode")
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; ;;===================multi-mode=====================
;; (add-to-list 'load-path "~/.emacs.d/plugins/multi-mode")
;; (require 'multi-mode)

;; ;;=====================mmm-mode=======================
;; (add-to-list 'load-path "~/.emacs.d/plugins/mmm-mode")
;; (require 'mmm-mode)

;; ;;====================mumamo-mode====================
;; (add-to-list 'load-path "~/.emacs.d/plugins/mumamo-mode")
;; (require 'multi-mode)


;; ;;======================html======================
;; (add-to-list 'load-path "~/.emacs.d/plugins/html-helper-mode")
;; (require 'html-helper-mode)
;; (setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.html$" . html-mode) auto-mode-alist))


;; ;;=======================markdown-mode========================
;; (add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
;; (require 'markdown-mode)


;; (setq html-helper-do-write-file-hooks t)
;; (setq html-helper-build-new-buffer t)
;; (setq html-helper-basic-offset 2)
;; (setq html-helper-address-string
;;       "<a href=\"http://www.santafe.edu/~nelson/\">Nelson Minar &lt;nelson@santafe.edu&gt;</a>")


;; ;;======================jde=======================
;;jde的安装
;; (add-to-list 'load-path "~/.emacs.d/plugins/jdee-2.4.1/lisp")
;; (load "jde")


;; ;;======================java======================
;; (add-to-list 'load-path "~/.emacs.d/plugins/JAVA/auto-complete-master")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories
;;              "~/.emacs.d/plugins/JAVA/auto-complete-master/dict")
;; (ac-config-default)
;; (add-to-list 'load-path "~/.emacs.d/plugins/JAVA/fuzzy-el-master")
;; (setq ac-fuzzy-enable t)

;; (add-to-list 'load-path "~/.emacs.d/plugins/JAVA/popup-el-master")

;; (add-to-list 'load-path "~/.emacs.d/plugins/JAVA/pos-tip")
;; (require 'pos-tip)
;; (setq ac-quick-help-prefer-pos-tip t) ;;default is t

;; ;;quick-help
;; (setq ac-use-quick-help t)
;; (setq ac-quick-help-delay 1.0)
;; ;;设置tab键
;; (setq ac-dwim t)


;; ;;======================ecb========================
;;(add-to-list 'load-path "~/.emacs.d/plugins/ecb")
;;(require 'ecb)


;; ;;==================powerline===================
;; (add-to-list 'load-path "~/.emacs.d/plugins/powerline")
;; (require 'powerline)


;; ;;=====================eshell===================
;; (global-set-key [f4] 'eshell)


;; ;;===================session====================
;; (add-to-list 'load-path "~/.emacs.d/plugins/session")
;; (require 'session)


;; ;;==================expand-region===============
;; (add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
;; (require 'cc-mode-expansions)

;; ;;==================popup=======================
;; ;;这是yasnippet的插件的子插件
;; (add-to-list 'load-path "~/.emacs.d/plugins/popup-el-master")
;; (require 'popup)


;; ;;==================Ace Jump Mode==============
;; ;; ace jump mode major function
;; (add-to-list 'load-path "~/.emacs.d/plugins/ace_jump_mode/")
;; (autoload
;;   'ace-jump-mode
;;   "ace-jump-mode"
;;   "Emacs quick move minor mode"
;;   t)
;; ;; you can select the key you prefer to
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; ;;C-c 再加空格键进行启动


;; ;;===================flymake====================
;; ;; (add-to-list 'load-path "~/.emacs.d/plugins/flymake")
;; ;; (require 'flymake)

;; ;;==================Org-mode====================
;; ;;为TODO定义不同的状态
;; (setq org-todo-keywords
;;       '((sequence "TODO" "|" "DONE")))

;; ;;跟踪一个特定项目的完成时间
;; (setq org-log-done 'time)


;; ;;================evil================
;; (add-to-list 'load-path "~/.emacs.d/plugins/evil")
;; (require 'evil)
;; (evil-mode 1)
;; (setq evil-default-state 'emacs)


;; ;;===============slime================
;; (setq inferior-lisp-program "/usr/local/lib/sbcl") ; your Lisp system
;; (add-to-list 'load-path "~/SoftWear/lisp/slime-master/")  ; your SLIME directory
;; ;;(require 'slime)
;; (require 'slime-autoloads)
;; (slime-setup '(slime-fancy))


;; ;;===============cscope==============
;; (add-to-list 'load-path "~/.emacs.d/plugins/cscope/contrib/xcscope")
;; (require 'xcscope)
;; ;;这里以核原码为例，介绍Cscope的基本用法。
;; ;;首先，在源码根目录下，如～/kernerl/linux-2.6.29.3,利用cscope-indexer脚本生成文件
;; ;;列表和数据库，方法是执行                cscope-indexer -r
;; ;;其中-r参数表示递归检索子目录，文件列表和数据库的默认文件名分别为cscope.files和
;; ;;cscope.out,可以使用-i和-f参数进行修改。
;; ;;然后用emacs打开init/main.c, ctrl+s搜索sched_init函数，将光标停在函数名上，按ctrl+c s d
;; ;;进行查找!!!
;; ;; C-c s s   Find symbol
;; ;; C-c s d   Find global definition
;; ;; C-c s g   Find global definition(alternate binding)
;; ;; C-c s G   Find global definition without prompting
;; ;; C-c s c   Find functions calling a function
;; ;; C-c s C   Find called functions
;; ;; C-c s t   Find test string
;; ;; C-c s e   Find egrep pattern
;; ;; C-c s f   Find a file
;; ;; C-c s i   Find files #include a file
;; ;;在搜索出来的结果中可以通过n和p两个键跳转
;; ;; n    下一个symbol
;; ;; p    上一个symbol
;; ;; N    下一个文件
;; ;; P    上一个文件


;; ;;======================Load gdb-many-window=====================
;; ;;gdb-many-window
;; ;;这个功能插件可以使emacs的调试界面像VC一样，有watch, stacktrace等窗口，
;; ;;真正实现图形化gdb.
;; ;;在emacs中编译好程序，然后M-x gdb，连按两次ret，多窗口gdb就出来了
;; ;;http://www.inet.net.nz/~nickrob/multi-gud.el
;; ;;http://www.inet.net.nz/~nickrob/multi-gdb-ui.el
;; ;; (add-to-list 'load-path"~/.emacs.d/plugins/multi_gdb")
;; ;; (setq gdb-many-windows t)
;; ;; (load-library "multi-gud.el")
;; ;; (load-library "multi-gdb-ui.el")


;; ;;-----------------内部插件的控制----------------------
;; ;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;; ;;                                   global-semanticdb-minor-mode
;; ;;                                   global-semantic-idle-summary-mode
;; ;;                                   global-semantic-mru-bookmark-mode))
;; ;; (semantic-mode 1)
