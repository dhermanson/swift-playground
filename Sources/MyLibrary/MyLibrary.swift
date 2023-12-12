// The Swift Programming Language
// https://docs.swift.org/swift-book
import Figlet

public enum MyLibrary {

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



