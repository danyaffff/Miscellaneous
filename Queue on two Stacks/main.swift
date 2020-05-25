import Foundation

class Stack {
    var data = [Int]()
    
    public func isEmpty() -> Bool {
        return data.count == 0
    }
    
    public func push(element: Int) {
        data.append(element)
    }
    
    public func pop() -> Int? {
        if !isEmpty() {
            return data.removeLast()
        } else {
            Swift.print("Стек пуст!")
            return nil
        }
    }
    
    public func print() {
        Swift.print(data)
    }
}

class Queue {
    var leftStack = Stack()
    var rightStack = Stack()
    
    public func push(element: Int) {
        leftStack.push(element: element)
    }
    
    public func pop() {
        if rightStack.isEmpty() {
            while !leftStack.isEmpty() {
                rightStack.push(element: leftStack.pop()!)
            }
        } else {
            _ = rightStack.pop()
        }
    }
    
    public func print() {
        while !leftStack.isEmpty() {
            rightStack.push(element: leftStack.pop()!)
        }
        
        if !rightStack.isEmpty() {
            rightStack.print()
        } else {
            Swift.print("Очередь пуста!")
        }
    }
}

var queue = Queue()

queue.push(element: 1)
queue.push(element: 2)
queue.push(element: 3)
queue.push(element: 4)

queue.print()

queue.pop()
queue.pop()

queue.print()
