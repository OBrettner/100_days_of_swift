import Cocoa

let fileName = "paris.jpeg"
let bool = fileName.hasSuffix(".jpeg")

let number = 120
print(number.isMultiple(of: 3))

let goodDog = true
let gameOver = false
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var isRunning = false
isRunning.toggle()
print(isRunning)


let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number2 = 11
let missionMessage = "Apollo " + String(number) + " landed on the moon."
