//
//  ContentView.swift
//  Chalange
//
//  Created by Oliver Brettmer on 2025. 05. 22..
//

import SwiftUI

struct ContentView: View {
    @State private var unitValue = 0.0
    @State private var inputType = "°C"
    @State private var outputType = "°F"
    
    var inputUnitType: UnitTemperature {
        switch inputType {
        case "°C":
            return UnitTemperature.celsius
        case "°F":
            return UnitTemperature.fahrenheit
        default:
            return UnitTemperature.kelvin
        }
    }
    
    var outputUnitType: UnitTemperature {
        switch outputType {
        case "°C":
            return UnitTemperature.celsius
        case "°F":
            return UnitTemperature.fahrenheit
        default:
            return UnitTemperature.kelvin
        }
    }
    
    var outputValue: Double {
        let temp = Measurement(value: unitValue, unit: inputUnitType)
        return temp.converted(to: outputUnitType).value
    }
    
    @FocusState private var isFocused
    
    let temperatureTypes = ["°C", "°F", "K"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input type") {
                    Picker("Input Type", selection: $inputType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Output type") {
                    Picker("Input Type", selection: $outputType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Input value") {
                    TextField("Temperature", value: $unitValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                Section("Output value") {
                    Text("\(outputValue.formatted()) \(outputType)")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
