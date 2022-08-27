FROM alpine:3.16

RUN apk add --no-cache \
    bash \
    supervisor \
    iperf \
    iperf3

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/iperf.conf /etc/supervisor/conf.d/iperf.conf

ENV IPERF_VER=iperf3
ENV IPERF_PORT=5201

EXPOSE 5201

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]
