
CONFIG_PATH=/etc/dnsmasq/dnsmasq.d
GFW_DNS_SERVER=8.8.8.8
GFW_IPSET_NAME=ipset_gfw


default: gen

gen:
	python3 generate_config.py -f domains/gfw_blocked.txt --prefix server=/ --suffix /${GFW_DNS_SERVER} > ${CONFIG_PATH}/gfw.server.conf
	python3 generate_config.py -f domains/gfw_blocked.txt --prefix ipset=/ --suffix /${GFW_IPSET_NAME} > ${CONFIG_PATH}/gfw.ipset.conf


restart:
	systemctl restart dnsmasq.service

stop:
	systemctl stop dnsmasq.service

