let iterations = 1_000_000

await withThrowingTaskGroup(of: Void.self) { taskGroup in
    for _ in 1...iterations {
        taskGroup.addTask {
            try await Task.sleep(nanoseconds: 10_000_000_000)
        }
    }
}
