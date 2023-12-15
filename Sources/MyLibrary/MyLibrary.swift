// The Swift Programming Language
// https://docs.swift.org/swift-book
import Figlet
import PostgresNIO
import Logging

public enum MyLibrary {

    public func start() async throws {

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
        
    }

    public class Person {

        private let name: String

        public init(name: String) {
            self.name = name
        }

        public func speak() -> String {
            return "hello from \(self.name)"
        }

        public func sayhi() {
            Figlet.say("hello")
        }

        public func say(_ phrase: String) {
            Figlet.say(phrase)
        }

    }
}



