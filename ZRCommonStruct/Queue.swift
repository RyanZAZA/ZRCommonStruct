//
//  Queue.swift
//  
//
//  Created by soudian on 2021/7/15.
//

import Foundation

struct QueueByArray<T>{
    var array = [T]()
    
    mutating func push(value:T){
        array.append(value)
    }
    @discardableResult
    mutating func pop()->T?{
        if array.count > 0{
            let first = array.first
            array.removeFirst()
            return first
        }
        return nil
    }
}

struct QueueByNodeList<T>{
    var list = NodeList<T>()
    
    mutating func push(value:T){
        list.append(value: value)
    }
    @discardableResult
    mutating func pop()->T?{
        let value = list.head?.value
        list.removeFirst()
        return value
    }
}
   
