# Set git proxy
set_proxy(){
    hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
    port=1080
    proxy_socks5=socks5://$hostip:$port
    proxy_socks5h=socks5h://$hostip:$port

    # Env
    export http_proxy=${proxy_socks5}
    export HTTP_PROXY=${proxy_socks5}
    export https_proxy=${proxy_socks5}
    export HTTPS_PROXY=${proxy_socks5}
    
    # git proxy
    git config --global http.proxy $proxy_socks5h
    git config --global https.proxy $proxy_socks5h

    # curl proxy
    curl_config_file=$XDG_CONFIG_HOME/.curlrc
    if [[ -e $curl_config_file ]] ; then
        sed "/^proxy/cproxy=${proxy_socks5h}" $curl_config_file > $curl_config_file
    else
        echo "proxy=${proxy_socks5h}" > $curl_config_file
    fi
    # gh proxy
}
set_proxy
