//
//  Stack.swift
//  
//
//  Created by soudian on 2021/7/15.
//

import Foundation
//import NodeList

struct StackByArray<T>{
    var array = [T]()
    
    mutating func push(value:T){
        array.append(value)
    }
    @discardableResult
    mutating func pop()->T?{
        if array.count > 0{
            let last = array.last
            array.removeLast()
            return last
        }
        return nil
    }
}

struct StackByNodeList<T>{
    var list = NodeList<T>()
    
    mutating func push(value:T){
        list.append(value: value)
    }
    @discardableResult
    mutating func pop()->T?{
        let value = list.tail?.value
        list.removeLast()
        return value
    }
}
