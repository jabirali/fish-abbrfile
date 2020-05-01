#!/usr/bin/env fish

# Create abbreviations for every entry in `abbrfile`.
if [ -f ~/.config/fish/abbrfile ]
	for line in (sed '/^#/d' ~/.config/fish/abbrfile)
		set -l dict (string split ' ' $line)
		if [ (count $dict) -ge 2 ]
			set -l key (string trim $dict[1])
			set -l val (string trim (string join ' ' $dict[2..-1]))
			abbr -ga $key $val
		else if [ -n "$line" ]
			echo "abbrfile: Could not parse \"$line\"."
		end
	end
end
