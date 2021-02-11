function bdig --description 'Bulk dig the scrap file'
if string match --quiet --regex --invert '\D' (cat scrap | read -n1 -d'\0')
    for ip in (cat scrap)
        echo -n $ip, 
        dig -x $ip
    end
    else
        for host in (cat scrap)
            dig $host
        end
    end
end
