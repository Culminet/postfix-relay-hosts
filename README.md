# postfix-relay-hosts
- used for adding relay rules to multiple servers easily
- ran from master mail exchanger and propagated to all mail exchangers

# How to do magic
- you don't, the script does
- chmod +x relay-hosts.sh
- alias relay-hosts='/usr/local/culminet/bin/relay-hosts.sh'
- relay-hosts <add/del/show> <network/cidr> <OK/REJECT>
