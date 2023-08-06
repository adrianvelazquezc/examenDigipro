import Foundation

//Structure

struct Person {
    var name: String
    var age: Int
}

var personInfo = Person(name: "Adrian", age: 27)
print("\(personInfo.name) tiene \(personInfo.age) años")
