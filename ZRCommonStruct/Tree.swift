//
//  NodeTree.swift
//  CommonBaseDataStruct
//
//  Created by soudian on 2021/8/18.
//

import Foundation

public class Tree {
    public var val: Int
    public var child: Array<Tree>?
    public init(_ val: Int) {
        self.val = val
    }
}

public class BinaryTree {
    public var value: Int
    public var left: BinaryTree?
    public var right: BinaryTree?
    public init(_ value: Int) {
        self.value = value
    }
    
    func min() -> BinaryTree? {
        if(left == nil) {
            if(right == nil) {
                return nil
            }else{
                return right
            }
        }else{
            if(left == nil) {
                return left
            }else{
                return left!.value > right!.value ? left : right
            }
        }
    }
    
}

public class BinarySearchTree: BinaryTree {
    public private(set) var root: BinaryTree?
    
    //插入
    public func insert(_ value: Int) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryTree?, value: Int) -> BinaryTree {
        guard let node = node else {
            return BinaryTree(value)
        }
        
        if value < node.value {
            node.left = insert(from: node.left, value: value)
        } else {
            node.right = insert(from: node.right, value: value)
        }
        
        return node
    }
    
    //查询
    func contains(_ value: Int) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.left
            } else {
                current = node.right
            }
        }
        return false
    }
    
    public func remove(_ value: Int) {
        
    }
    
    private func remove(node: BinaryTree?, value: Int) -> BinaryTree? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.left == nil && node.right == nil {
                return nil
            }
            if node.left == nil {
                return node.right
            }
            if node.right == nil {
                return node.left
            }
            node.value = node.right!.min()!.value //存疑
            node.right = remove(node: node.right, value: node.value)
            
        } else if value < node.value {
            node.left = remove(node: node.left, value: value)
        } else {
            node.right = remove(node: node.right, value: value)
        }
        
        return node
    }
}

// 遍历
func traversal(_ root: BinaryTree?) -> [Int] {
    var result = [Int]()
    if root != nil {
        helper(root!, &result)
    }
    return result
}

//前序
func helper(_ root: BinaryTree, _ result: inout [Int]) {
    // 中
    result.append(root.value)
    // 左
    if root.left != nil {
        helper(root.left!, &result)
    }
    // 右
    if root.right != nil {
        helper(root.right!, &result)
    }
}

// 计算树的最大深度
func maxDepth(_ root: BinaryTree?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}

// 判断一颗二叉树是否为二叉查找树
func isValidBST(_ root: BinaryTree?) -> Bool {
    return helper(root, nil, nil)
}

private func helper(_ node: BinaryTree?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else {
        return true
    }
    // 所有右子节点都必须大于根节点
    if let min = min, node.value <= min {
        return false
    }
    // 所有左子节点都必须小于根节点
    if let max = max, node.value >= max {
        return false
    }
    
    return helper(node.left, min, node.value) && helper(node.right, node.value, max)
}

func levelOrder(root: BinaryTree?) -> [[Int]] {
    var res = [[Int]]()
    // 用数组来实现队列
    var queue = [BinaryTree]()
    
    if let root = root {
        queue.append(root)
    }
    
    while queue.count > 0 {
        let size = queue.count
        var level = [Int]()
        
        for _ in 0 ..< size {
            let node = queue.removeFirst()
            
            level.append(node.value)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        res.append(level)
    }
    
    return res
}

