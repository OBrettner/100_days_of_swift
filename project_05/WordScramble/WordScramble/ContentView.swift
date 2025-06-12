//
//  ContentView.swift
//  WordScramble
//
//  Created by Oliver Brettmer on 2025. 06. 06..
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var errorVisible = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    Text("Your score is: \(score)")
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $errorVisible) {
                Button("Ok") {}
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("Restart game") {
                    restartGame()
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 2 else { return }
        
        guard answer != rootWord.lowercased() else {
            wordError(title: "Not Original", message: "The Word was not original")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Not Original", message: "The Word was not original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Not Possible", message: "The answer is not possible.")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Not Real", message: "WTF is this?")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += answer.count
        
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                let allWords = startWords.split(separator: "\n")
                rootWord = String(allWords.randomElement() ?? "silkworm")
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func restartGame() {
        withAnimation {
            usedWords.removeAll()
        }
        newWord = ""
        score = 0
        startGame()
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        errorVisible = true
    }
}

#Preview {
    ContentView()
}
