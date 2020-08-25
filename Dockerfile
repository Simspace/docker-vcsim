FROM nimmis/golang

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# download and compile vcsim
RUN go get -u github.com/vmware/govmomi/vcsim

RUN openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -subj '/CN=localhost' -nodes

EXPOSE 443

# run start command
ENTRYPOINT ["vcsim"]
CMD [ "-l", "0.0.0.0:443", "-tlscert", "/root/cert.pem", "-tlskey", "/root/key.pem", "-trace" ]
