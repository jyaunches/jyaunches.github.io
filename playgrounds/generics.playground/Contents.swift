

class Link<T>: Sequence, IteratorProtocol {
    let value: T
    private let nextLink: Link<T>?
    
    init(_ value: T, next: Link<T>?){
        self.value = value
        self.nextLink = next
    }
    
    func next() -> Link<T>? {
        return nextLink
    }
}

let elementFour = Link(4, next: nil)
let elementThree = Link(3, next: elementFour)
let elementTwo = Link(2, next: elementThree)
let elementOne = Link(1, next: elementTwo)






