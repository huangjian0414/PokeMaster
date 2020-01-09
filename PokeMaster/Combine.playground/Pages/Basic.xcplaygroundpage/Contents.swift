import Foundation
import Combine
import UIKit
//check("Empty") {
//    Empty<Int, SampleError>()
//}
//check("Just") {
//    Just("Hello SwiftUI")
//}
//check("Sequence") {
//    Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3])
//        .scan(0, +)// 一边进行重复操作，一边将每一步中间状态发送出去
//}
//check("Array") {
//    [1, 2, 3].publisher.map{$0*2}
//        .reduce(0, +) // map 对 output 的元素 进行变形:
//
//}
//
//check("Compact Map") {
//    ["1", "2", "3", "cat", "5"]
//        .publisher
//        .compactMap { Int($0)// 将 map 结果中那些 nil 的元素去掉
//    }
//}
//
//check("Flat Map 1") {
//    // 外层 Publisher 的是一个数组的数组 外层 Publisher 会发送两个 Output 事件，每个事 件的值被 flatMap 传递到内层，并通过 $0.publisher 生成新的 Publisher 并返回  内层 Publisher 实际上是 [1, 2, 3].publisher 和 ["a", "b", "c"].publisher
//    [[1, 2, 3], ["a", "b", "c"]]
//        .publisher .flatMap {
//            $0.publisher
//    }
//}
//
//check("Flat Map 2") { ["A", "B", "C"]
//    .publisher
//    .flatMap { letter in
//        [1, 2, 3]
//            .publisher
//            .map { "\(letter)\($0)" }
//    }
//    
//}
//
//check("Remove Duplicates") {
//    ["S", "Sw", "Sw", "Sw", "Swi", "Swif", "Swift", "Swift", "Swif"]
//        .publisher
//        .removeDuplicates()// 移除连续出现的重复事件值
//}
//
//check("Fail") {
//    Fail<Int, SampleError>(error: .sampleError)
//}
//
//check("Fail") {
//    Fail<Int, SampleError>(error: .sampleError)
//        .mapError{ _ in MyError.myError // 将 Publisher 的 Failure 转换成 Subscriber 所需要的 Failure 类型
//    }
//}
//
///// “Swift” 这个字符串是无法被转换为 Int 值的，当问题发生时，我们 抛出了一个自定义的 myError 错误。这导致整个事件流以错误结果终止，接下来的 “4” 也不再会被计算和发布。
//check("Throw") {
//    ["1", "2", "Swift", "4"].publisher
//        .tryMap { s -> Int in
//            guard let value = Int(s) else {
//                throw MyError.myError
//            }
//            return value
//    }
//}
//
//check("Throw") {
//    ["1", "2", "Swift", "4"].publisher
//        .tryMap { s -> Int in
//            guard let value = Int(s) else {
//                throw MyError.myError
//            }
//            return value
//    }
//    .replaceError(with: 3)//replaceError，它会把错误替换成一个给定的值，并且立即发送 finished 事件
//}
//
//check("Throw") {
//    ["1", "2", "Swift", "4"].publisher
//        .tryMap { s -> Int in
//            guard let value = Int(s) else {
//                throw MyError.myError
//            }
//            return value
//    }
//    .catch{_ in [1, 2, 3].publisher} // 返回一个 Publisher
//}
//
//check("Catch and Continue") {
//    ["1", "2", "Swift", "4"].publisher
//        //.print("[ Original ]")
//        .flatMap { s in return Just(s)
//            .tryMap { s -> Int in
//                guard let value = Int(s) else {
//                    throw MyError.myError }
//                return value }
//            //.print("[ TryMap ]")
//            .catch { _ in Just(-1)/*.print("[ Just ]")*/ }/*.print("[ Catch ]")*/
//    }
//}
//
//check("Filter") {
//    [1,2,3,4,5].publisher.filter { $0 % 2 == 0 }
//}

//check("Contains") {
//    [1,2,3,4,5].publisher
//        .print("[Original]")
//        .contains(3)
//}


//check("Merge") {
//    [1:"A",2:"B",3:"C"].timerPublisher.merge(with: [4:"D",5:"E",6:"F"].timerPublisher)
//}


//check("Flat Map 3") { [["A", "B"], "C"]
//    .publisher
//    .flatMap { letter in
//        [1, 2, 3]
//            .publisher
//            .map{ "\(letter)\($0)" }
//
//    }
//}

///Subject 也是 Combine 框架中的一个协议，它为我们提供了从外界发送数据的方式,外界每次调用 send(_:) 或者 send(completion:)，对应的 Subject 就会向外发布一个 事件
/// 两种最常用的 Subject，它们分别是 PassthroughSubject 及 CurrentValueSubject

//let s1 = check("Subject") {
//    () -> PassthroughSubject<Int, Never> in
//    let subject = PassthroughSubject<Int, Never>()
//    delay(1) {
//        subject.send(1)
//        delay(1) {
//            subject.send(2)
//            delay(1) {
//                subject.send(completion: .finished) }
//        } }
//    return subject
//}

//let subject_example1 = PassthroughSubject<Int, Never>()
//let subject_example2 = PassthroughSubject<Int, Never>()
//check("Subject Order") {
//    subject_example1.merge(with: subject_example2)
//}
//subject_example1.send(20)
//subject_example2.send(1)
//subject_example1.send(40)
//subject_example1.send(60)
//subject_example2.send(1)
//subject_example1.send(80)
//subject_example1.send(100)
//subject_example1.send(completion: .finished)
//subject_example2.send(completion: .finished)


/// zip 将从两个序列中取出 index 相同的元素， 把它们组合为多元组，然后放到返回的序列中去
//let subject1 = PassthroughSubject<Int, Never>()
//let subject2 = PassthroughSubject<String, Never>()
//
//subject1.send(1)
//subject2.send("A")
//subject1.send(2)
//check("Zip") { // 晚点订阅 看看结果
//    subject1.zip(subject2)
//}
//subject2.send("B")
//subject2.send("C")
//subject2.send("D")
//subject1.send(3)
//subject1.send(4)
//subject1.send(5)

/// combineLatest 只要发生了新的事件，combineLatest 就把新发生的事 件值和另一个 Publisher 中当前的最新值合并

//let subject3 = PassthroughSubject<String, Never>()
//let subject4 = PassthroughSubject<String, Never>()
//
//subject3.send("1")
//subject4.send("A")
//subject3.send("2")
//check("Combine Latest") { //晚点订阅 看看结果
//    subject3.combineLatest(subject4)
//}
//subject4.send("B")
//subject4.send("C")
//subject4.send("D")
//subject3.send("3")
//subject3.send("4")
//subject3.send("5")


/// 如果我们希望订阅操作和值的发布是异步行为，不在同一时间发生的话，可以使用 Future。Future 提供了一种方式，可以让我们创建一个接受未来的事件的 Publisher。

/// 如果你的异步 API 有可能不发送任何一个值， 而是可能发布两个或更多的值的话，你会需要一个更加一般性的 Publisher 类型来把 指令式程序转换为响应式程序，这个类型就是 Subject
//func loadPage(
//    url: URL,
//    handler: @escaping (Data?, URLResponse?, Error?) -> Void)
//{
//    URLSession.shared.dataTask(with: url) {
//        data, response, error in
//        handler(data, response, error) }.resume()
//}
//
//let future = check("Future") {
//    Future<(Data, URLResponse), Error> { promise in
//    loadPage(url: URL(string: "https://example.com")!) { data, response, error in
//            if let data = data, let response = response {
//                promise(.success((data, response)))
//            }else{
//                promise(.failure(error!))
//            }
//        }
//    }
//}

//let subject = PassthroughSubject<(), Never>()
//let observer = NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) {_ in subject.send()
//}


//let subject = PassthroughSubject<Date, Never>()
//Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//subject.send(Date()) }
//let timer = check("Timer") {
//    subject
//}


//struct Response: Decodable {
//    struct Args: Decodable {
//        let foo: String
//    }
//    let args: Args?
//}
//let urlCheck = check("URL Session") {
//    URLSession.shared.dataTaskPublisher(for: URL(string: "https://httpbin.org/get?foo=bar")!)
//        .map{ data , _ in data}
//        .decode(type: Response.self, decoder: JSONDecoder())
//        .compactMap{$0.args?.foo}
//}

//let timer = Timer.publish(every: 1, on: .main, in: .default)
//let timerCheck = check("Timer Connected") {
//    timer
//}
//timer.connect()


/// combine中 @Published把一个 class 的属性值转变为 Publisher。它同时提供了值的存储和对外的 Publisher (通过投影符号 $ 获取)
//class Wrapper {
//    @Published var text = "hehe"
//}
//var wrapper = Wrapper()
//
//let wrapperCheck = check("Published"){
//    wrapper.$text
//}
//wrapper.text = "123"


//class Clock {
//    var timeString: String = "--:--:--" {
//        didSet { print("\(timeString)") }
//    }
//}
//
//let clock = Clock()
//let formatter = DateFormatter()
//formatter.timeStyle = .medium
//let timer = Timer.publish(every: 1, on: .main, in: .default)
//var token = timer
//    .map { formatter.string(from: $0) }
//    .assign(to: \.timeString, on: clock)
//timer.connect()


//class LoadingUI {
//    var isSuccess: Bool = false {
//        didSet {print(isSuccess)}
//    }
//    var text: String = "" {
//        didSet {print(text)}
//    }
//}

/// 我们不想让订阅行为反复发 生 (比如上例中订阅时会发生网络请求)，而是想要共享这个 Publisher 的话，使用 share() 将它转变为引用类型的 class。
//let dataTaskPublisher = URLSession.shared .dataTaskPublisher(for: URL(string: "https://httpbin.org/get?foo=bar")!).share()
//
//let isSuccess = dataTaskPublisher .map { data, response -> Bool in
//    guard let httpRes = response as? HTTPURLResponse else {
//        return false
//    }
//    return httpRes.statusCode == 200 }
//    .replaceError(with: false)
//let latestText = dataTaskPublisher .map{data,_ in data}
//    .decode(type: Response.self, decoder: JSONDecoder())
//    .compactMap { $0.args?.foo }
//    .replaceError(with: "")
//let ui = LoadingUI()
//var token1 = isSuccess.assign(to: \.isSuccess, on: ui)
//var token2 = latestText.assign(to: \.text, on: ui)
/*
1. 对于需要 connect 的 Publisher，在 connect 后需要保存返回的 Cancellable，
并在合适的时候调用 cancel() 以结束事件的持续发布。
2. 对于 sink 或 assign 的返回值，一般将其存储在实例的变量中，等待属性持有 者被释放时一同自动取消。不过，你也完全可以在不需要时提前释放这个变量 或者明确地调用 cancel() 以取消绑定。
3. 对于 1 的情况，也完全可以将 Cancellable 作为参数传递给 AnyCancellable 的初始化方法，将它包装成为一个可以自动取消的对象。这样一来，1 将被转 换为 2 的情况。
*/

/// debounce 防抖   Publisher 在接收到第一个值后，并不是立即将它发布出 去，而是会开启一个内部计时器，当一定时间内没有新的事件来到，再将这个值进行 发布
//let searchText = PassthroughSubject<String, Never>()
//let debounceCheck = check("Debounce") {
//    searchText
//        .debounce(for: .seconds(1), scheduler: RunLoop.main)
//}
//let throttleCheck = check("Debounce") {
//    searchText
//        .throttle(for: .seconds(1), scheduler: RunLoop.main, latest: false)
//}
//delay(0) { searchText.send("S") }
//delay(0.1) { searchText.send("Sw") }
//delay(0.2) { searchText.send("Swi") }
//delay(1.3) { searchText.send("Swif") }
//delay(1.4) { searchText.send("Swift") }

