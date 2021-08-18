//
//  RBTree.swift
//  CommonBaseDataStruct
//
//  Created by soudian on 2021/8/18.
//

import Foundation

internal enum Color {
    case Red
    case Black
}

private enum KeyMatchResult {
    case Before
    case Matching
    case After
}

indirect enum RBTree<Element: Comparable> {
    case Empty
    case Node(Color,RBTree<Element>,Element,RBTree<Element>)
    
    init() { self = .Empty }
    
    init(_ x: Element, color: Color = .Black, left: RBTree<Element> = .Empty, right: RBTree<Element> = .Empty){
        self = .Node(color, left, x, right)
    }
}

extension RBTree {
    func contains(x: Element) -> Bool {
        guard case let .Node(_,left,y,right) = self
        else { return false }
        
        if x < y { return left.contains(x: x) }
        if y < x { return right.contains(x: x) }
        return true
    }
    
    private func ins<T>(into: RBTree<T>, _ x: T) -> RBTree<T> {
        guard case let .Node(c, l, y, r) = into
        else { return RBTree(x as! Element, color: .Red) as! RBTree<T>}
        
        if x < y { return balance(c, ins(into: l, x), y as! Element, r) }
        if y < x { return balance(c, l, y as! Element, ins(into: r, x)) }
        return into
    }
    
    func balance<T>(_ c: Color, _ l: RBTree<T>, _ y: Element , _ r: RBTree<T>) -> RBTree<T> {
        return RBTree<T>()
    }
}



