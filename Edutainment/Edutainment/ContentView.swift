//
//  ContentView.swift
//  Edutainment
//
//  Created by Oliver Brettmer on 2025. 06. 12..
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var currentMultTable = 5
    @State private var numberOfQuestions = 5
    @State private var currentQuestion = 1
    @State private var points = 0
    @State private var multiplyer = Int.random(in: 1...10)
    @State private var alertVisible = false
    
    @State private var answer = 1
    
    var numberOptions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            List {
                if(!isPlaying) {
                    Section {
                        Stepper("Multiplication Table: \(currentMultTable)", value: $currentMultTable, in: 2...12)
                        Picker("Number of questions: ", selection: $numberOfQuestions) {
                            ForEach(numberOptions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    Section {
                        Button("PLAY!") {
                            startGame()
                        }
                    }
                } else {
                    Section {
                        Text("Question: \(currentQuestion) \\ \(numberOfQuestions)")
                        Text("Points: \(points)")
                    }
                    Section {
                        Text("How Much is \(currentMultTable) x \(multiplyer)")
                        Picker("The Answer is: ", selection: $answer) {
                            ForEach(0..<121) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.wheel)
                        Button("PICK!") {
                            submitAnswer()
                        }
                    }
                }
            }
            .navigationTitle("Edutainment")
        }
        .alert("Game Ended", isPresented: $alertVisible) {
            Button("Ok") {
                
            }
        } message: {
            Text("You got \(points) \\ \(numberOfQuestions) right")
        }
    }
    
    func startGame() {
        isPlaying = true
        generateQuestion()
        points = 0
        currentQuestion = 1
    }
    
    func endGame() {
        isPlaying = false
        alertVisible = true
    }
    
    func submitAnswer() {
        if answer == currentMultTable * multiplyer {
            points += 1
        }
        
        if currentQuestion == numberOfQuestions {
            endGame()
            return
        }
        
        currentQuestion += 1
        generateQuestion()
    }
    
    func generateQuestion() {
        multiplyer = Int.random(in: 1...10)
    }
}

#Preview {
    ContentView()
}
