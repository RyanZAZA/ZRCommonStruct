//
//  NodeList.swift
//  
//
//  Created by soudian on 2021/7/15.
//

import Foundation

class Node<T>{
    var next:Node?
    var value:T
    init(value:T) {
        self.value = value
    }
}

class NodeList<T>{
    var head:Node<T>?
    var tail:Node<T>?{
        return nodeAt(index: count - 1)
    }
    var count:Int = 0
    func append(value:T){
        let node = Node(value: value)
        if let _ = self.head{
            tail?.next = node
        }else{
            head = node
        }
        count = count + 1
    }
    func removeLast(){
        if count >= 2{
            let node = nodeAt(index: count - 2)
            node?.next = nil
        }else{
            head?.next = nil
        }
        count = max(count - 1, 0)
    }
    func removeFirst(){
        head = head?.next
        count = max(count - 1, 0)
    }
    func removeAll(){
        head = nil
        count = 0
    }
    func nodeAt(index:Int)->Node<T>?{
        var start = 0
        var node = head
        while node?.next != nil,start < index {
            node = node?.next
            start = start+1
        }
        return node
    }
    
    func descripetion(){
        var node = head
        print(node?.value)
        while node?.next != nil{
            node = node?.next
            print("descripetion",node?.value)
        }
    }
}
