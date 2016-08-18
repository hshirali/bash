s-remmote-reboot() {
    #do things with parameters like $1 such as
for var in "$@"
do
    ssh sdn@$var 'sudo reboot'
done
}

s-proxymci(){
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
cd ~/mybyon/onos-byon/
onos-app 10.10.20.59 reinstall target/byon-1.0-SNAPSHOT.oar
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

s-init()
{
	onos-push-keys $OC2	
	onos-push-keys $OC3
	onos-push-keys $OC4
	onos-patch-vm $OC2 OC2
	onos-patch-vm $OC3 OC3
	onos-patch-vm $OC4 OC4
#	op
#	onos-install $OC2
#	onos-install $OC3
#	onos-install $OC4
}
s-print-date()
{
	echo OC2
	ssh sdn@$OC2 date
	echo OC3
        ssh sdn@$OC3 date
	echo OC4
        ssh sdn@$OC4 date
}

s-installfromzip()
{
for var in "$@"
do
	echo $var pre
	onos-push-keys $var
        scp /root/Downloads/onos-1.6.0.tar.gz  sdn@$var:/tmp/
	echo $var ssh b
	ssh sdn@$var "
	sudo mkdir /opt/onos
	sudo tar zxf /tmp/onos-1.6.0*.tar.gz -C /opt/onos --strip-components=1
	sudo sed -i \"\\\$i /opt/onos/bin/onos-service server& \" /etc/rc.local
	sudo apt-get install htop -y
	"
	echo $var ssh end
done
}

s-test()
{
	ssh sdn@$@ "
	echo \'test\'
        sudo sed -i \"\\\$i /opt/onos/bin/onos-service server& \" /etc/rc.local
	"
}


