#!/usr/bin/fish
function fish_command_not_found
    set BINARY $argv[1]
    set RESULT (pkgfile -b $BINARY 2>/dev/null)

    /usr/bin/printf "Command \x1b[1m\x1b[33m'$BINARY'\x1b[0m not found.\n"

    if test -n "$RESULT"
        printf "\x1b[34mAvailable in : \x1b[0m\n"
        echo $RESULT |
            sed 's/ /\n/' |
            awk -F / '{print "\t\x1b[35m\x1b[1m" $1 "/\x1b[0m\x1b[1m" $2 }'

        # A temporary function that'll remove itself once called
        function $BINARY --inherit-variable RESULT --inherit-variable BINARY

            # Edge case, if $BINARY is installed before this function is used
            if command -v $BINARY >/dev/null 2>&1
                # Behave normally
                command $BINARY $argv
            else
                sudo pacman -S $RESULT[1]
            end

            /usr/bin/echo ""
            functions --erase $BINARY
        end

        /usr/bin/printf "\nRun \x1b[33m$BINARY\x1b[0m again to install \x1b[1m$(echo $RESULT[1] | awk -F / '{print "\x1b[35m\x1b[1m" $1 "/\x1b[0m\x1b[1m" $2 }')\x1b[0m\n"
    end

    return # 127
end
