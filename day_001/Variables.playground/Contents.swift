import Cocoa

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebeca"
name = "George"

let character = "Player"
// This is not correct because let is constant
// character = "NPC"

// Multiple lines of string declaration
var movies = """
Spiderman
The green book
Avatar
"""

let nameLength = name.count
print(nameLength)

print(greeting.uppercased())

print(movies.hasPrefix("Spiderman"))
print(movies.hasSuffix("Avatar"))

let score = 10
let addedScore = score + 5
let negatedScore = score - 2
let multipliedScore = score * score
let dividedScore = score / 2

var counter = 10
counter += 10
counter -= 5
counter *= 2
counter /= 5

let number = 120
print(number.isMultiple(of: 3))
