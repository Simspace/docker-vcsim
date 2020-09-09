FROM golang:1.15.0

MAINTAINER bergey <bergey@simspace.com>

# download and compile vcsim
RUN go get -u github.com/vmware/govmomi/vcsim

RUN openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -subj '/CN=localhost' -nodes

EXPOSE 443

# run start command
ENTRYPOINT ["vcsim"]
CMD [ "-l", "0.0.0.0:443", "-tlscert", "/go/cert.pem", "-tlskey", "/go/key.pem", "-trace" ]
