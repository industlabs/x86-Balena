#!/bin/bash
## Event handlers
# @event    Called on image creation
on_install() {
    task "INSTALL"
    ## Integrating APT
    #task "Integrating APT repositories" \
    #&& echo "deb http://ppa.launchpad.net/example/package/ubuntu trusty main" >>/etc/apt/sources.list \
    #&& gpg --keyserver pgpkeys.example.com --recv-key 0123456789ABCDEF \
    #|| return 20

    task "/INSTALL"
}
# @event    Container first execution only
on_init() {
    task "INIT"
    ## Mount volumes ##
    task "Mounting volumes"
    # Fix perms and ownership
        v-perm "/conf"
    # Bind volumes
        #v-bind "/conf/nginx" "/etc/nginx" -- "nginx.conf"    
        
    ## Downloading VirtualHere server for ARM32
    task "Downloading VirtualHere" \
    &&  curl -o /bin/vhusbd 'https://virtualhere.com/sites/default/files/usbserver/vhusbdarm' \
    && chmod +x /bin/vhusbd

    task "/INIT"
}
# @event    Main container startup code
on_run() {
    task "RUN"
    run --root "/bin/vhusbd" -c "/conf/config.ini"
    task "/RUN"
}
# @event    Shutdown procedure (container stop request)
on_term() {
    task "TERM"
    run-signal -w 'SIGINT' # -w: Await process termination; default
    task "/TERM"
}
# @event    Health-check is performed.
on_health() {
    return 0; # default: always pass
}
# Invoke the run.lib.sh entry point
source "/lib/run.lib.sh"
