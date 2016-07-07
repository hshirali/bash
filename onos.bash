myrebootfun() {
    #do things with parameters like $1 such as
for var in "$@"
do
    ssh sdn@$var 'sudo reboot'
done
}
alias shir-remmote-reboot=myrebootfun

proxymci(){
 printf '173709' | openconnect us.cisadd.com  -b --no-cert-check -u iruser148686

mci
#kill `ps aux|grep openconnect|grep -v grep|cut -c 10-15`
pkill openconnect
}
alias shir-proxymci=proxymci
installon3(){
op
onos-install -f $OC2
onos-install -f $OC3
onos-install -f $OC4
}

alias shir-install-cell=installon3
mymcifun(){
mci
installon3
}
alias shir-mci-install-cell=mymcifun


mybyoncell()
{
cd ~/onos-byon/
onos-app 10.10.20.59 reinstall target/byon-1.0-SNAPSHOT.oar
onos-app 10.10.20.60 reinstall target/byon-1.0-SNAPSHOT.oar
onos-app 10.10.20.61 reinstall target/byon-1.0-SNAPSHOT.oar
}

alias shir-byon-cell=mybyoncell


myrestart() {
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

alias shir-restart-onos=myrestart

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

