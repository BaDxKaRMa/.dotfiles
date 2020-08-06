function unzipd
set zipfile "$argv"
set zipdir (basename "$argv" .zip)
unzip $zipfile -d $zipdir
end
