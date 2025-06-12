//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oliver Brettmer on 2025. 05. 27..
//

import SwiftUI

struct FlagImage: View {
    var countryName: String
    
    var body: some View {
        Image(countryName)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var flagTapped = 0
    
    @State private var roundsLeft = 8
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped = number
                            
                            flagTapped(number)
                        } label: {
                            FlagImage(countryName: countries[number])
                        }
                        .rotationEffect(Angle.degrees(flagTapped == number ? 360 : 0))
                        .opacity(flagTapped == number ? 1.0 : 0.25)
                        .scaleEffect(flagTapped == number ? 1.0 : 0.85)
                        .animation(.easeIn, value: flagTapped)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                Text("Rounds Left: \(roundsLeft)")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Restart Game", action: restartGame)
        } message: {
            Text("The game is over your score is: \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
        }
        
        if roundsLeft == 1 {
            if score < 4 {
                scoreTitle = "Stupid!"
            } else {
                scoreTitle = "Well donne!"
            }
            showingScore = true
        } else {
            askQuestion()
        }
        
    }
    
    func restartGame() {
        score = 0
        roundsLeft = 9
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        roundsLeft -= 1
    }
}

#Preview {
    ContentView()
}
