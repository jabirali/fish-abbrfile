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

Not too bad, but could be better. This plugin lets you do the same via a `~/.config/fish/abbrfile`:

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

Personally, I find this approach easier to maintain across machines than dealing with
"universal variables", and cleaner than maintaining lists of `abbr` commands. If you
agree, this plugin is easily installable via [`fisher`][1]:

	fisher add jabirali/fish-abbrfile

[1]: https://github.com/jorgebucaran/fisher
