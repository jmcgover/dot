-- INDENT
--
-- 'tabstop' 'ts'	number	(default 8)
-- 			local to buffer
-- 	Defines the column multiple used to display the Horizontal Tab
-- 	character (ASCII 9); a Horizontal Tab always advances to the next tab
-- 	stop.
--
-- 'softtabstop' 'sts'	number	(default 0)
-- 			local to buffer
-- 	Create soft tab stops, separated by 'softtabstop' number of columns.
--
-- 'expandtab' 'et'	boolean	(default off)
-- 			local to buffer
-- 	In Insert mode: Use the appropriate number of spaces to insert a
-- 	<Tab>.  Spaces are used in indents with the '>' and '<' commands and
-- 	when 'autoindent' is on.  To insert a real tab when 'expandtab' is
-- 	on, use CTRL-V<Tab>.  See also |:retab| and |ins-expandtab|.
--
-- 'autoindent' 'ai'	boolean	(default on)
-- 			local to buffer
-- 	Copy indent from current line when starting a new line (typing <CR> in
-- 	Insert mode or when using the "o" or "O" command). . . .
-- 
-- 'smartindent' 'si'	boolean	(default off)
-- 			local to buffer
-- 	Do smart autoindenting when starting a new line.  Works for C-like
-- 	programs, but can also be used for other languages. 
-- 	Normally 'autoindent' should also be on when using 'smartindent'.
--
-- 'wrap'			boolean	(default on)
-- 			local to window
-- 	When on, lines longer than the width of the window will wrap and
-- 	displaying continues on the next line.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- UNDO
-- 'undodir' 'udir'	string	(default "$XDG_STATE_HOME/nvim/undo//")
-- 			global
--  			Disallowed in |modeline|. |no-modeline-option|
-- 	List of directory names for undo files, separated with commas.
-- 	When writing: If none of the directories exist Nvim will attempt
-- 	to create the last directory in the list.
-- 'undofile' 'udf'	boolean	(default off)
-- 			local to buffer
vim.opt.undofile = true

-- BACKUP
-- 'backup' 'writebackup'	action	~
--    off	     off	no backup made
--    off	     on		backup current file, deleted afterwards (default)
--    on	     off	delete old backup, backup current file
--    on	     on		delete old backup, backup current file
-- 'backupext' 'bex'	string	(default "~")
-- 			global
-- 'backupdir' 'bdir'	string	(default ".,$XDG_STATE_HOME/nvim/backup//")
-- 			global
-- 			Disallowed in |modeline|. |no-modeline-option|
-- 'backupcopy' 'bkc'	string	(default "auto")
-- 			global or local to buffer |global-local|
vim.opt.backup = true
vim.opt.backupext = ".bak"
vim.opt.backupdir = (os.getenv("XDG_STATE_HOME") or os.getenv("HOME").."/.local/state").."/nvim/backup//"

-- SWAP
-- 'swapfile' 'swf'	boolean	(default on)
-- 			local to buffer
vim.opt.swapfile = true

-- COLOR
-- 'termguicolors' 'tgc'	boolean	(default off)
-- 			global
-- 	Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight|
-- 	attributes instead of "cterm" attributes. |guifg|
--set 	Requires an ISO-8613-3 compatible terminal.
vim.opt.termguicolors = true

-- RULER
vim.opt.ruler = true

-- WHITESPACE VISIBILITY
vim.opt.listchars="tab:»»,trail:·,nbsp:~"
vim.opt.list = true
