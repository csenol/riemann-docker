FROM dockerfile/ruby

# Install dependencies
RUN apt-get update
RUN apt-get install -y curl
# Download the latest .deb and install

RUN curl -L http://aphyr.com/riemann/riemann_0.2.6_all.deb > /tmp/riemann_0.2.6_all.deb
RUN dpkg -i /tmp/riemann_0.2.6_all.deb
RUN gem install riemann-client riemann-tools riemann-dash

RUN apt-get install -y openjdk-7-jre-headless

ADD entry.sh /srv/entry.sh
ADD riemann.config /srv/riemann.config
RUN chmod +x /srv/entry.sh

ADD dash.rb /etc/dash.rb

EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556
EXPOSE 4567

CMD ["/srv/entry.sh"]