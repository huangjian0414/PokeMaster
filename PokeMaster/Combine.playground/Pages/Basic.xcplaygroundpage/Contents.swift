import Foundation
import Combine

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


check("Merge") {
    [1:"A",2:"B",3:"C"].timerPublisher.merge(with: [4:"D",5:"E",6:"F"].timerPublisher)
}
