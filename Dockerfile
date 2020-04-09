FROM golang

RUN go get github.com/google/ko/cmd/ko

# Entrypoint:
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
