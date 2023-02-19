wget -o .\exp.exe “http://live.sysinternals.com/procexp.exe”
wget -o .\auto.exe “http://live.sysinternals.com/autoruns.exe”
wget -o .\view.exe “http://live.sysinternals.com/TCPView.exe”
wget -o .\gawr.exe “https://2.na.dl.wireshark.org/win64/Wireshark-win64-4.0.3.exe”

netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh adv f a r n="ICMP" dir=in action=allow protocol=icmpv4:8,any
netsh adv f a r n="ICMP" dir=out action=allow protocol=icmpv4:8,any

netsh adv f a r n="DNS" dir=out action=allow protocol=udp localport=53 remoteport=53 enable=yes profile=any action=allow
netsh adv f a r n="DNS" dir=in action=allow protocol=udp localport=53 remoteport=53 enable=yes profile=any action=allow

netsh adv f a r n="HTTP-in" dir=in protocol=tcp localport=8081 action=allow
netsh adv f a r n="HTTP-out" dir=out protocol=tcp localport=8081 action=allow

netsh adv f a r n=RDP-TCP-Server dir=in act=allow prof=any prot=tcp localport=3389 
netsh adv f a r n=RDP-UDP-Server dir=in act=allow prof=any prot=udp localport=3389

netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable

timeout 120
netsh advfirewall set allprofiles state off