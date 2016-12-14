//: Playground - noun: a place where people can play

import UIKit

//----------------------------------------------------------------

var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}
print(evens)

//----------------------------------------------------------------

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
evens = Array(1...10).filter(isEven)
print(evens)

//----------------------------------------------------------------

evens = Array(1...10).filter { $0 % 2 == 0 }
print(evens)

//----------------------------------------------------------------

func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
    var result = [T]()
    for i in source {
        if predicate(i) {
            result.append(i)
        }
    }
    return result
}

evens = myFilter(source: Array(1...10), predicate: isEven)
print(evens)

//----------------------------------------------------------------

var evenSum = Array(1...10)
    .filter {
        (number) in number % 2 == 0
}.reduce(0) { (total, number) in total + number }

print(evenSum)

//----------------------------------------------------------------

extension Array {
    func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
        var current = seed
        for item in self {
            current = combiner(current, item as! T)
        }
        return current
    }
}

let numbers = Array(1...10).filter { $0 % 2 == 0 }
    .myReduce(seed: 0) {(total, number) in total + number}
print(numbers)

