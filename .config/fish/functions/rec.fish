function rec -d "Start Terminal recording using Asciinema"
    if test -z "$argv"
        asciinema rec ~/logs/(date '+%F %T%Z').cast
    else
        asciinema rec ~/logs/$argv.cast
    end
end
