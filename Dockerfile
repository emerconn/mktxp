FROM python:3-slim AS builder

LABEL org.opencontainers.image.source=github.com/akpw/mktxp

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir .

# ---------------- #

FROM gcr.io/distroless/python3-debian12

WORKDIR /app

COPY --from=builder /usr/local/bin/mktxp . 

USER nonroot:nonroot

EXPOSE 49090

ENTRYPOINT ["mktxp"]

CMD ["export"]

 
