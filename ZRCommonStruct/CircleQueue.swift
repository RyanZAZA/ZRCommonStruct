//
//  CircleQueue.swift
//  
//
//  Created by soudian on 2021/7/15.
//

import Foundation

class CircleQueueByArray {
    var queque: [Int]
    var size: Int
    let cap: Int
    var front: Int
    var rear: Int
    
    init(_ k: Int){
        queque = Array(repeating:0, count: k)
        size = 0
        cap = k
        front = 0
        rear = -1
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }
        
        rear = (rear + 1) % cap
        queque[rear] = value
        size += 1
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else {
            return false
        }
        front = (front + 1) % cap
        size -= 1
        return true
    }
    
    func Front() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return queque[size]
    }
    
    func Rear() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return queque[rear]
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == cap
    }
}

class CircleQueueByNodeList {
    var queque: NodeList<Any>
    var size: Int
    let cap: Int
    var front: Int
    var rear: Int
    
    init(_ k: Int){
        queque = NodeList<Any>()
        
        size = 0
        cap = k
        front = 0
        rear = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }
//        queque.insert(value, at:rear)
        rear += 1
        rear = rear % cap
        size += 1
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else {
            return false
        }
//        let node = queque.at(front)
        front += 1
        front = front % cap
        size -= 1
        return true
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == cap
    }
}
