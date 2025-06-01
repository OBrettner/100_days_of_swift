//
//  ContentView.swift
//  WeSplit
//
//  Created by Oliver Brettmer on 2025. 05. 20..
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPersentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var finalCheckAmount: Double {
        let peopleCount = Double(numberOfPeople + 2)
            let tipSelection = Double(tipPersentage)

            let tipValue = checkAmount / 100 * tipSelection
            let grandTotal = checkAmount + tipValue
            let amountPerPerson = grandTotal / peopleCount

            return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPersentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(finalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .foregroundStyle(tipPersentage == 0 ? .red : .primary)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
