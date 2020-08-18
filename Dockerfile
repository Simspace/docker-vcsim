FROM nimmis/golang

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# copy startscript

COPY docker-entrypoint.sh /

# download and compile vcsim
RUN go get -u github.com/vmware/govmomi/vcsim

EXPOSE 443

# run start command
ENTRYPOINT ["vcsim"]
CMD [ "-l", "0.0.0.0:443" ]
