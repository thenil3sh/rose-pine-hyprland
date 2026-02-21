function watch_src
    cargo watch -qcw src/ -x run
end

function watch_test
    cargo watch -qcw tests/ -x "test -- --nocapture"
end

function cwatch_test
    cargo watch -qcx "test -- --nocapture"
end

function help
    /usr/bin/printf "USAGE : \n\t\x1b[0mcwatch \x1b[32m<mode>\x1\n"
    /usr/bin/printf "\x1b[33mMODES :\x1b[0m\n"
    /usr/bin/printf "\t\x1b[34mtest\x1b[0m - watches \x1b[33mtest\ \x1b[0mdirectory only, and rerun test on change\n"
    /usr/bin/printf "\t\x1b[34msrc\x1b[0m  - watches \x1b[33msrc\ \x1b[0m directory only, and rerun code on change\n"
    /usr/bin/printf "\t\x1b[34m<blank>\x1b[0m - watches complete crate, and rerun the binary on change\n"
end

function cargo_watch_exists
    if not type cargo-watch &>/dev/null
        /usr/bin/printf "\x1b[31mcargo-watch\x1b[0m is not installed\x1b[0m\n"
        return 1
    end
    return 0
end

function cwatch
    if not cargo_watch_exists
        return
    end
    argparse h/help -- $argv
    if set -ql _flag_help
        /usr/bin/printf "cwatch\nan alias to cargo-watch\n\n"
        help
        return 1
    end
    switch $argv[1]
        case test
            cwatch_test
        case src
            watch_src
        case ''
            cargo watch -qcx run
        case '*'
            /usr/bin/printf "cwatch : Unknown arguement \x1b[33m\"$argv\"\n\n"
            help
        case -h
            /usr/bin/printf "cwatch\nan alias to cargo-watch"
            help
    end
end
