FROM alpine:latest

EXPOSE 80

RUN apk add --no-cache tzdata libc6-compat wget curl bash && \
       ln -s /lib /lib64 && \
       cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
       echo "Asia/Shanghai" >  /etc/timezone && \
       sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd && \
       date && apk del --no-cache tzdata

ENV KANBAN_ENV=1.6.2

RUN mkdir -pv /opt/kanban && \
    wget -q https://github.com/leanlabsio/kanban/releases/download/${KANBAN_ENV}/kanban_x86_64_linux -O /opt/kanban/kanban && \
    chmod +x /opt/kanban/kanban
    
COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
