//
//  main.swift
//  Lesson 6
//
//  Created by Дмитрий on 13.12.2021.
//

import Foundation

struct Queue<T> {
    private var array = [T]()

    mutating func enqueue(_ item: T) {
        array.append(item)
    }

    mutating func dequeue() -> T? {
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }

    func filter( _ predicate: (T) -> Bool ) -> [T] {
        var result = [T]()
        for item in array {
            if predicate(item) {
                result.append(item)
            }
        }

        return result
    }

    func map<U>(_ transformPredicate: (T) -> U) -> [U] {
        var result = [U]()
        for item in array {
            let transformedItem = transformPredicate(item)
            result.append(transformedItem)
        }

        return result
    }

    subscript(index: Int) -> T? {
        guard index < array.count, index >= 0 else { return nil }
        return array[index]
    }
}


var newQueue = Queue<Int>()
newQueue.enqueue(325)
newQueue.enqueue(47)
newQueue.enqueue(34)

print(newQueue)

print(newQueue[400])

