//Class

import Foundation

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var personInfo = Person(name: "Adrian", age: 27)
print("\(personInfo.name) tiene \(personInfo.age) años")
