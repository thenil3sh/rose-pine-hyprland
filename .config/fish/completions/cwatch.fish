complete -c cwatch -e

complete -c cwatch -x -s h -l help \
    -n "not __fish_seen_argument -s r -l run -s t -l test" \
    -d "Shows a helpful message"

complete -c cwatch -x -s r -l run \
    -n "not __fish_seen_argument -s h -l help -s t -l test" \
    -d "Runs the binary crate on every change"

complete -c cwatch -x -s t -l test \
    -n "not __fish_seen_argument -s h -l help -s r -l run" \
    -d "Runs tests on every change"

complete -c cwatch -f -a "(__fish_complete_directories) (__fish_complete_path)"
