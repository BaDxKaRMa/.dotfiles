function makegif -d "Use Asciicast2gif"
    if test -z "$argv"
        asciicast2gif ~/logs/(ls logs/ | fzf -q ".cast ") ~/logs/gifs/latest.gif
    else
        asciicast2gif ~/logs/(ls logs/ | fzf -q ".cast ") ~/logs/gifs/$argv.gif
    end
end
