import PostgresKit


let logger = Logger(label: "postgres-logger")

let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

defer {try! eventLoopGroup.syncShutdownGracefully()}

let configuration = PostgresConfiguration(
  hostname: "localhost",
  username: "user",
  password: "secret",
  database: "defaultdb"
)
let db = PostgresConnectionSource(configuration: configuration)
let pool = EventLoopGroupConnectionPool(
  source: db,
  on: eventLoopGroup)

defer {pool.shutdown()}

let x = await try pool.withConnection { conn in
                conn.query("SELECT 1;")
}.get()


print("result: \(x)")

// let res = pools.withConnection { conn -> in
//                        return "test"
// }

// pools.withConnection(
// pools.withConnection { conn in
// }
// // pools.withConnection { conn
// // }


// try await connection.close()

print("done!!\n")
