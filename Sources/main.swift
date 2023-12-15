import PostgresKit

let config = PostgresConnection.Configuration(
  host: "localhost",
  port: 5432,
  username: "user",
  password: "secret",
  database: "defaultdb",
  tls: .disable
)

let logger = Logger(label: "postgres-logger")

let connection = try await PostgresConnection.connect(
  configuration: config, id: 1, logger: logger
)

try await connection.close()

print("done!!\n")
