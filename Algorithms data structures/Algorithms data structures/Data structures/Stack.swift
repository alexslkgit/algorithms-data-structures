//
//  Stack.swift
//  Algorithms data structures
//
//  Created by Slobodianiuk Oleksandr on 05.07.2024.
//

import Foundation

class Stack<T> {
    
    private var elements: [T] = []

    func push(_ value: T) {
        elements.append(value)
    }

    func pop() -> T? {
        return elements.popLast()
    }

    func peek() -> T? {
        return elements.last
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    func count() -> Int {
        return elements.count
    }
}
