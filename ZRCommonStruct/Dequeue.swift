//
//  Dequeue.swift
//  
//
//  Created by soudian on 2021/7/15.
//

import Foundation

struct Dequeue<T> {
    private var array: [T?]
    
    private var spaceCount = 10

    private var head = 0

    init(_ spaceCount: Int = 10) {
        self.spaceCount = spaceCount
        array = [T?].init(repeating: nil, count: spaceCount)
        head = spaceCount
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return array.count - head
    }
    

    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func enqueueFront(_ element: T) {

        if head == 0{
            spaceCount *= 2
            let space = [T?].init(repeating: nil, count: spaceCount)
            array.insert(contentsOf: space, at: 0)
            head = spaceCount
        }
        head -= 1
        array.insert(element, at: head)
    }
    
    mutating func dequeue() -> T? {

        guard !isEmpty, let element = array[head] else { return nil }
        array[head] = nil
        head += 1
        

        if head >= spaceCount*2 {
            let amountToRemove = spaceCount + spaceCount/2
            array.removeFirst(amountToRemove)
            head -= amountToRemove
            spaceCount /= 2
        }
        return element
    }
    

    mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }

    func peekFront() -> T? {
        return array.first ?? nil
    }

    func peekBack() -> T? {
        return array.last ?? nil
    }
}
