//
//  DoubleLinkedList.swift
//  Algorithms data structures
//
//  Created by Slobodianiuk Oleksandr on 05.07.2024.
//

import Foundation

class DoubleLinkedList<T> {

    private var head: DoubleLinkedListNode<T>?
    private var tail: DoubleLinkedListNode<T>?

    init() { self.head = nil; self.tail = nil }

    func first() -> T? { return head?.value }

    func last() -> T? { return tail?.value }
    
    func add(value: T) {
        let newNode = DoubleLinkedListNode(value: value)
        if let tailNode = tail {
            tailNode.nextNode = newNode
            newNode.previousNode = tailNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func remove(value: T) where T: Equatable {
        var currentNode = head

        while currentNode != nil {
            if currentNode?.value == value {
                if let previous = currentNode?.previousNode {
                    previous.nextNode = currentNode?.nextNode
                } else {
                    head = currentNode?.nextNode
                }

                if let next = currentNode?.nextNode {
                    next.previousNode = currentNode?.previousNode
                } else {
                    tail = currentNode?.previousNode
                }

                return
            }
            currentNode = currentNode?.nextNode
        }
    }

    func removeLast() {
        guard let tailNode = tail else { return }

        if let previousNode = tailNode.previousNode {
            previousNode.nextNode = nil
            tail = previousNode
        } else {
            head = nil
            tail = nil
        }
    }
}

// Node:

class DoubleLinkedListNode<T> {
    
    var value: T
    var nextNode: DoubleLinkedListNode<T>?
    var previousNode: DoubleLinkedListNode<T>?

    init(value: T, nextNode: DoubleLinkedListNode<T>? = nil, previousNode: DoubleLinkedListNode<T>? = nil) {
        self.value = value
        self.nextNode = nextNode
        self.previousNode = previousNode
    }
}
