# Fish Abbrfile
## Motivation
Fish has a wonderful little built-in feature called "abbreviations", which let
you autocomplete predefined snippets like `gs` into commands like `git status`. 
However, maintaining long lists of such abbreviations clutter your `config.fish`:

	# Package management.
	abbr -ga 'a'  'sudo apt'
	abbr -ga 'ai' 'sudo apt install'
	abbr -ga 'ar' 'sudo apt autoremove --purge'
	abbr -ga 'as' 'apt search'
	abbr -ga 'ah' 'apt help'

Not too bad. Could be better. This plugin lets you do the same via `~/.config/fish/abbrfile`:

	# Package management.
	a   sudo apt
	ai  sudo apt install
	ar  sudo apt autoremove --purge
	as  apt search
	ah  apt help

You can have any number of spaces (but not tabs) between abbreviations and expansions.
Personally, I find this approach easier to maintain across machines than dealing with
"universal variables", and much cleaner than maintaining lists of `abbr` commands.

If you agree, this plugin is easily installable via [`fisher`][1]:

	fisher add jabirali/fish-abbrfile

## Advanced usage
Another common usecase for abbreviations is that you want to autocorrect UNIX
commands like `ls`, `find`, `grep`, `cat` to modern replacements like [`exa`][2],
[`fd`][3], [`rg`][4], and [`bat`][5]. These are faster, smarter, and prettier
than their classic counterparts. But they may not be available on *every* machine
you check your dotfiles into, so such autocorrection can get in the way on many
systems. This plugin solves that my checking that a command is valid before
performing an abbreviation: so if you write the following in your `abbrfile`,

    # Better coreutils.
    ls    exa
    find  fd
    grep  rg
    cat   bat -p

then e.g. `find` will only be autocorrected to `fd` on systems where `fd` is
installed. You can even add multiple entries with the same name; in the
following example, the plugin prefers the editor `nvim` over `vim`, and
`vim` over `vi`, but resorts to `vi` when that's the only thing available:

    # Better editors.
    vi    vim
    vi    nvim

[1]: https://github.com/jorgebucaran/fisher
[2]: https://the.exa.website/
[3]: https://github.com/sharkdp/fd
[4]: https://github.com/BurntSushi/ripgrep
[5]: https://github.com/sharkdp/bat
