//
//  ContentView.swift
//  RockPaperSisors
//
//  Created by Oliver Brettmer on 2025. 06. 01..
//

import SwiftUI

struct ContentView: View {
    var moves = ["Rock", "Paper", "Sisors"]
    @State private var currentChoice = ""
    @State private var shoudWin = Bool.random()
    @State private var currentMove = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var rounds = 0
    
    @State private var isGameOver = false
    
    var body: some View {
        VStack {
            Text("The player should \(shoudWin ? "win" : "loose") the next round")
                .bold()
            HStack {
                ForEach(moves, id: \.self) { move in
                    Button {
                        currentChoice = move
                        buttonCicked()
                    } label: {
                        Text(move)
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                }
            }
            Text("Current: \(moves[currentMove])")
                .bold()
                .font(.title)
        }
        .padding()
        .alert("Score: \(score)", isPresented: $isGameOver) {
            Button("Restart") {
                restart()
            }
        } message: {
            Text("Better luck next time!")
        }
    }
    
    func restart() {
        score = 0
        currentMove = Int.random(in: 0...2)
        shoudWin.toggle()
        rounds  = 0
    }
    
    func buttonCicked() {
        let current = moves[currentMove]
        
        if current == currentChoice {
            score -= 1
        }
        
        else if current == "Rock" {
            if shoudWin && currentChoice == "Paper" {
                score += 1;
            }
            else if !shoudWin && currentChoice == "Sisors" {
                score += 1;
            } else {
                score -= 1
            }
        }
        
        else if current == "Paper" {
            if shoudWin && currentChoice == "Sisors" {
                score += 1;
            }
            else if !shoudWin && currentChoice == "Rock" {
                score += 1;
            } else {
                score -= 1
            }
        }
        
        else if current == "Sisors" {
            if shoudWin && currentChoice == "Rock" {
                score += 1;
            }
            else if !shoudWin && currentChoice == "Paper" {
                score += 1;
            } else {
                score -= 1
            }
        }
        
        currentMove = Int.random(in: 0...2)
        shoudWin.toggle()
        rounds += 1
        
        if rounds == 10 {
            isGameOver = true
        }
    }
}

#Preview {
    ContentView()
}
