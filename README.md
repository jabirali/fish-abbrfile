# Fish Abbrfile

Fish has a wonderful little built-in feature called "abbreviations", which let
you autocomplete predefined snippets like `gs` into commands like `git status`. 
However, maintaining long lists of such abbreviations clutter your `config.fish`:

	# Version control.
	abbr -ga 'g'  'git
	abbr -ga 'ga' 'git add'
	abbr -ga 'gc' 'git commit'
	abbr -ga 'gd' 'git diff'
	abbr -ga 'gf' 'git fetch'
	abbr -ga 'gp' 'git push'
	abbr -ga 'gs' 'git status'
	
	# Package management.
	abbr -ga 'a'  'sudo apt'
	abbr -ga 'ai' 'sudo apt install'
	abbr -ga 'ar' 'sudo apt autoremove'
	abbr -ga 'as' 'apt search'
	abbr -ga 'ah' 'apt help'

It's not too bad, but it could be better. This plugin lets you accomplish the
same by instead maintaining a `~/.config/fish/abbrfile` with the following format:

	# Version control.
	g:  git
	ga: git add
	gc: git commit
	gd: git diff
	gf: git fetch
	gp: git push
	gs: git status
	
	# Package management.
	a:  sudo apt
	ai: sudo apt install
	ar: sudo apt autoremove
	as: apt search
	ah: apt help

Personally, I like this approach better than "universal variables", and cleaner
than lists of `abbr` commands. If you agree, this is available via [`fisher`][1]:

	fisher add jabirali/fish-abbrfile

[1]: https://github.com/jorgebucaran/fisher
