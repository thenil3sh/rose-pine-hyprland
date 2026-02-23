

function __help
    /usr/bin/printf "\x1b[1m\x1b[33mUSAGE : \x1b[0m\n\t\x1b[0mcwatch \x1b[32m<option>\x1b[34m [ PATHS TO WATCH ]\x1b[0m\n"
    /usr/bin/printf "\x1b[1m\x1b[33mOPTIONS\x1b[0m : \n"
    /usr/bin/printf "\t\x1b[34m\x1b[1m--help -h\x1b[0m \tShows this help message\n"
    /usr/bin/printf "\t\x1b[34m\x1b[1m--run  -r\x1b[0m \tRuns the crate binary on change\n"
    /usr/bin/printf "\t\x1b[34m\x1b[1m--test -t\x1b[0m \tRuns tests on change\n"

    /usr/bin/printf "\x1b[1m\x1b[33mEXAMPLE : \x1b[0m\n"
    /usr/bin/printf "\tcwatch \x1b[36m-t \x1b[4msrc/main.rs\x1b[24m \x1b[4mtests/\x1b[0m\n\n"
end

function __cargo_watch_exists
    if not type cargo-watch &>/dev/null
        /usr/bin/printf "\x1b[33mcargo-watch\x1b[0m is not installed\x1b[0m\n"
        return 1
    end
    return 0
end

function __test_enabled
    argparse t/test -- $argv
    if set -ql _flag_test

        return 0
    end
end

function __run_enabled
    argparse r/run -- $argv
    if set -ql _flag_run
        return 0
    end
end

function __test_run_enabled
    argparse r/run t/test -- $argv
    if set -ql _flag_run && set -ql _flag_test
        return 0
    end
    return 1
end

set -g _directories

function __parse_directories
    set -g dirs
    for d in $argv
        if test -e $d
            set -g dirs $dirs -w $d
        else
            echo $d : path or directory not found
        end
    end
end

function __handle_unwatchable
    for p in $argv
        /usr/bin/printf "\x1b[33m$p\x1b[0m : directory or file not found"
    end
end

function cwatch
    # Check if  cargo-watch exists
    if not __cargo_watch_exists
        if not type -qa cargo
            /usr/bin/printf "Neither \x1b[33mcargo\x1b[0m is installed, for help installing : \x1b[34mhttps://rust-lang.org/tools/install/\x1b[0m\nThen, "
        end
        /usr/bin/printf "install it with cargo : \x1b[34mhttps://github.com/watchexec/cargo-watch?tab=readme-ov-file#install\x1b[0m\n"
        return 1
    end

    argparse h/help t/test r/run -- $argv

    # Handles help
    if set -ql _flag_help
        /usr/bin/printf "                  __      __ \n _____    _____ _/ /_____/ / \n/ __/ |/|/ / _ `/ __/ __/ _ \\ \n\\__/|__,__/\\_,_/\\__/\\__/_//_/\n"
        /usr/bin/printf "an alias for cargo watch\n\n"
        __help
        return 1
    end

    __parse_directories $argv

    if string match '' '$dirs'
        for d in $argv
            /usr/bin/printf "\x1b[33m$d\x1b[0m : path or directory not found"
        end
        return 404
    end


    # Handles --test and --run flags
    if set -ql _flag_test && set -ql _flag_run
        printf "\x1b[33mWait, you can't do that? either go for \x1b[0m--run\x1b[33m or \x1b[0m--test\x1b[0m\n"
        return 3
    end

    if set -ql _flag_test
        RUSTFLAGS="-Awarnings" cargo-watch -qcx "test -- --nocapture" $dirs
        return 0
    else if set -ql _flag_run
        RUSTFLAGS="-Awarnings" cargo-watch -qcx run $dirs
        return 0
    else
        /usr/bin/printf "Missing options, try \x1b[34mcwatch --help\x1b[0m\n"
        commandline "cwatch --help     #This will show help"
    end
end
