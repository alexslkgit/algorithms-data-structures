//
//  Queue.swift
//  Algorithms data structures
//
//  Created by Slobodianiuk Oleksandr on 05.07.2024.
//

import Foundation

class Queue<T> {
    
    private var elements: [T] = []

    func enqueue(_ value: T) {
        elements.append(value)
    }

    func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }

    func peek() -> T? {
        return elements.first
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    func count() -> Int {
        return elements.count
    }
}
