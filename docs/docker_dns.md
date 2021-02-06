# Fix VPN DNS resolving in docker

Since docker is kinda retarted, and doesn't understand VPN DNS on ubuntu, here is a way how to fix it.

```bash
$ sudo apt update
$ sudo apt install dnsmasq resolvconf net-tools
```

Find your docker IP
```bash
$ ifconfig | grep -A2 docker0
```

Update DNSMasq (`vim /etc/dnsmasq.conf`), by adding these lines to the end
```
interface=docker0
bind-interfaces
listen-address=<your docker0 IP>
```

Create/edit /etc/resolvconf/resolv.conf.d/tail and add this line:
```
nameserver <your docker0 IP>
```

Restart networking, update `resolv.conf`, restart docker:
```bash
$ sudo systemctl restart NetworkManager
$ sudo resolvconf -u
$ sudo service dnsmasq restart
$ sudo service docker restart
```