s-remmote-reboot() {
    #do things with parameters like $1 such as
for var in "$@"
do
    ssh sdn@$var 'sudo reboot'
done
}

shir-proxymci(){
 printf '173709' | openconnect us.cisadd.com  -b --no-cert-check -u iruser148686

mci
#kill `ps aux|grep openconnect|grep -v grep|cut -c 10-15`
pkill openconnect
}
s-install-cell(){
op
onos-install -f $OC2
onos-install -f $OC3
onos-install -f $OC4
}

s-byon-cell()
{
cd ~/onos-byon/
onos-app 10.10.20.59 reinstall target/byon-1.0-SNAPSHOT.oar
onos-app 10.10.20.60 reinstall target/byon-1.0-SNAPSHOT.oar
onos-app 10.10.20.61 reinstall target/byon-1.0-SNAPSHOT.oar
}

s-restart-onos() {
    #do things with parameters like $1 such as
for var in "$@"
do
        onos-service $var stop
done
for var in "$@"
do
        onos-service $var start
done

}

mymassstop() {
    #do things with parameters like $1 such as
for var in "$@"
do
        onos-service $var stop
done
}
mymasswipe() {
    #do things with parameters like $1 such as
for var in "$@"
do
        printf "wipe" "$var" "\n"
        onos-wipe-out $var please
done
}

alias shir-massstop=mymassstop
alias shir-maswipe=mymasswipe
