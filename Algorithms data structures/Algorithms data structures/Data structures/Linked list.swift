//
//  Linked list.swift
//  Algorithms data structures
//
//  Created by Slobodianiuk Oleksandr on 05.07.2024.
//

import Foundation

class LinkedList<T> {

    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?

    init() { self.head = nil; self.tail = nil }
    
    func first() -> T? { return head?.value }

    func last() -> T? { return tail?.value }

    func add(value: T) {
        let newNode = LinkedListNode(value: value)
        if let tailNode = tail {
            tailNode.nextNode = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func remove(value: T) where T: Equatable {
        var previousNode: LinkedListNode<T>?
        var currentNode = head

        while currentNode != nil {
            if currentNode?.value == value {
                if let previous = previousNode {
                    previous.nextNode = currentNode?.nextNode
                } else {
                    head = currentNode?.nextNode
                }

                if currentNode?.nextNode == nil {
                    tail = previousNode
                }
                return
            }

            previousNode = currentNode
            currentNode = currentNode?.nextNode
        }
    }

    func removeLast() {
        
        guard var currentNode = head else { return }

        if currentNode.nextNode == nil {
            head = nil
            tail = nil
            return
        }

        var previousNode: LinkedListNode<T>?
        while let next = currentNode.nextNode {
            previousNode = currentNode
            currentNode = next
        }

        previousNode?.nextNode = nil
        tail = previousNode
    }
}

// Node:

class LinkedListNode<T> {
    var value: T
    var nextNode: LinkedListNode<T>?

    init(value: T, nextNode: LinkedListNode<T>? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}
