FROM swift:5.9.2 AS builder

WORKDIR /home/root

ADD Package.swift Package.swift
ADD Sources Sources

RUN swift build -c release


FROM swift:5.9.2

COPY --from=builder /home/root/.build/release/MyCLI /app/app

WORKDIR /app
ENTRYPOINT [ "./app" ]
