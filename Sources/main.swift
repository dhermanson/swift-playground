import PostgresKit

let logger = Logger(label: "postgres-logger")

let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

defer {try! eventLoopGroup.syncShutdownGracefully()}

let configuration = SQLPostgresConfiguration(
  hostname: "localhost",
  username: "user",
  password: "secret",
  database: "defaultdb",
  tls: .disable
)
let db = PostgresConnectionSource.init(sqlConfiguration: configuration)

let pool = EventLoopGroupConnectionPool(
  source: db,
  on: eventLoopGroup)

defer {pool.shutdown()}

let x = try await pool.withConnection { conn in
                conn.query("SELECT * from person;")
}.get()


print("result: \(x)")
