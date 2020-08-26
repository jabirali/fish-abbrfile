#!/usr/bin/env fish

# Create abbreviations for every entry in `abbrfile`.
if [ -f ~/.config/fish/abbrfile ]
	for line in (sed '/^#/d' ~/.config/fish/abbrfile)
		set -l dict (string split ' ' -- $line)
		if [ (count $dict) -ge 2 ]
      # Abbreviation that should trigger expansion.
			set -l key (string trim -- $dict[1])
      # Command to run when the triggering happens.
			set -l val (string trim -- (string join ' ' -- $dict[2..-1]))
      # Only define abbreviation if the command is valid. This makes it
      # possible to e.g. abbreviate `vi` to `vim` on systems where `vim`
      # is available, but use the real `vi` if `vim` is not installed.
      set -l cmd (string split --no-empty ' ' -- $val)
      if [ $cmd[1] = "sudo" ]
        # Sudo detected. Check the next argument to see how to proceed.
        if type -q $cmd[2]
          abbr -ga $key $val
        end
      else
        # Sudo not detected. Just check the first argument of the command.
        if type -q $cmd[1]
          abbr -ga $key $val
        end
      end
		else if [ -n "$line" ]
			echo "abbrfile: Could not parse \"$line\"."
		end
	end
end
