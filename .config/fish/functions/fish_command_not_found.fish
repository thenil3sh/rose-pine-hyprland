function fish_command_not_found
    set BINARY $argv[1]

    set RESULT (pkgfile -b $BINARY 2>/dev/null)

    /usr/bin/printf "Command \x1b[1m\x1b[33m'$BINARY'\x1b[0m not found.\n"
    if test -n "$RESULT"
        /usr/bin/printf "\x1b[34mAvailable in : \x1b[0m\n"
        /usr/bin/echo $RESULT |
            /usr/bin/sed 's/ /\n/' |
            /usr/bin/awk -F / '{print "\t\x1b[35m\x1b[1m" $1 "/\x1b[0m\x1b[1m" $2 }'
        function $BINARY --inherit-variable RESULT --inherit-variable BINARY
            sudo pacman -S $RESULT[1]
            /usr/bin/echo ""
            functions --erase $BINARY
        end
        /usr/bin/printf "\nRun \x1b[33m$BINARY\x1b[0m again to install \x1b[1m$(echo $RESULT[1] | awk -F / '{print "\x1b[35m\x1b[1m" $1 "/\x1b[0m\x1b[1m" $2 }')\x1b[0m\n"
    end
    return
end
