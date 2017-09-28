class Link<T> {
    let value: T
    let nextLink: Link<T>?
    
    init(_ value: T, next: Link<T>?){
        self.value = value
        self.nextLink = next
    }
}

class LinkedLink<T> : Sequence, IteratorProtocol {
    var currentNode : Link<T>?
    
    init(head: Link<T>) {
        currentNode = head
    }
    
    func next() -> T? {
        if let next = currentNode?.nextLink {
            currentNode = next
            return next.value
        }
        return nil
    }
}

let elementFour = Link(4, next: nil)
let elementThree = Link(3, next: elementFour)
let elementTwo = Link(2, next: elementThree)
let elementOne = Link(1, next: elementTwo)

let linkedList = LinkedLink(head: elementOne)

for item in linkedList {
    print(item)
}

linkedList.contains(2)






