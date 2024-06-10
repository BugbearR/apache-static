TEMP_CONFIG := temp_openssl.cnf

all: generate-cert

generate-cert: conf/server.crt

conf/server.crt: localhost.openssl.cnf
	openssl req -x509 -out conf/server.crt -keyout conf/server.key \
	-newkey rsa:4096 -nodes -sha256 \
	-subj '/CN=localhost' -extensions EXT -config localhost.openssl.cnf -reqexts EXT -days 3650

.PHONY: all
