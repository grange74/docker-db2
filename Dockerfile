FROM ubuntu:14.10
MAINTAINER Nicolas Grange "grange74@gmail.com"

ADD db2expc.rsp /tmp/db2expc.rsp

# Install prerequisites 
RUN dpkg --add-architecture i386 && \
	apt-get update && \
 	apt-get -y install libpam0g:i386 libaio1 libstdc++6 lib32stdc++6 binutils wget && \
	ln -s /lib/i386-linux-gnu/libpam.so.0 /lib/libpam.so.0 && \
	rm -rf /var/lib/apt/lists/*

# Download DB2 Express Installer from Dropbox as IBM site is too painful to automatically download from.
# Run the installer and then clean up
# Doing this in 1 RUN command to keep the Image size smaller by not having the Installer
RUN wget "https://www.dropbox.com/s/ut3136498v8lbti/v10.5_linuxx64_expc.tar.gz?dl=1" \
		-O /tmp/v10.5_linuxx64_expc.tar.gz && \         
    cd /tmp && \
    tar xvzf v10.5_linuxx64_expc.tar.gz  && \
	rm v10.5_linuxx64_expc.tar.gz  && \
	./expc/db2setup -r db2expc.rsp  && \
	rm -rf /tmp/expc && \
	rm -rf /tmp/db2*

EXPOSE 50000

ENV DB2_HOME /opt/ibm/db2/V10.5
ENV LD_LIBRARY_PATH /opt/ibm/db2/V10.5/lib32/

CMD ["/bin/bash"]



