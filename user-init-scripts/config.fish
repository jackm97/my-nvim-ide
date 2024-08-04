if status is-interactive
    # Commands to run in interactive sessions can go here
    if test "$SKIP_FISH_CONFIG" != "1"
	set -x SKIP_FISH_CONFIG 1
	exec bash -i -c "fish"
    end
end
