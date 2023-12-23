// let iterations = 1_000_000
let iterations = 1_000


await withThrowingTaskGroup(of: Void.self) { taskGroup in
    for taskNumber in 1...iterations {
        taskGroup.addTask {
            try await Task.sleep(nanoseconds: 1_000_000_000) // one second
            print("hello from task \(taskNumber)")
        }
    }
}
