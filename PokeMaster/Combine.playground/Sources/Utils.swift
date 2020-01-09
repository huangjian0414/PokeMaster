import Foundation
import Combine

public func check<P: Publisher>(_ title: String, publisher: () -> P) -> AnyCancellable {
    print("--\(title)")
    defer {
        print("")
    }
    return publisher()
    .print()// Combine 内建的 Operator，它会在该 publisher 发送事件时，将具体事件的内容打印到控制台，方便调试观察
    .sink(receiveCompletion: {_ in}, receiveValue: {_ in})// sink 负责订阅和请求 sink 接受两个参数，它们都是 “闭包回调”:receiveCompletion 在 Self (也就是调用 sink 的 Publisher) 发布结束事件时被调用，receiveValue 则在 Self 发布值时被调 用。
}

public enum SampleError: Error {
    case sampleError
}

public enum MyError: Error {
    case myError
}

public func delay(_ seconds: TimeInterval = 0, on queue: DispatchQueue = .main, block: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + seconds, execute: block)
}


public struct TimeEventItem<Value> {
    public let duration: TimeInterval
    public let value: Value

    public init(duration: TimeInterval, value: Value) {
        self.duration = duration
        self.value = value
    }
}

extension TimeEventItem: Equatable where Value: Equatable {}
extension TimeEventItem: CustomStringConvertible {
    public var description: String {
        return "[\(duration)] - \(value)"
    }
}

public struct TimerPublisher<Value>: Publisher {
    public typealias Output = TimeEventItem<Value>
    public typealias Failure = Never

    let items: [TimeEventItem<Value>]

    public init(_ items: [TimeEventItem<Value>]) {
        self.items = items
    }

    public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {

        let data = items.sorted { $0.duration < $1.duration }
        for index in data.indices {
            let item = items[index]
            Combine_Sources.delay(item.duration) {
                _ = subscriber.receive(item)
                if index == data.endIndex - 1 {
                    subscriber.receive(completion: .finished)
                }
            }
        }
    }
}

extension Dictionary where Key == TimeInterval {
    public var timerPublisher: TimerPublisher<Value> {
        let items = map { kvp in
            TimeEventItem(duration: kvp.key, value: kvp.value)
        }
        return TimerPublisher(items)
    }
}
