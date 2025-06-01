//
//  ContentView.swift
//  Project3
//
//  Created by Oliver Brettmer on 2025. 05. 31..
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            Button() {
                useRedText.toggle()
            } label: {
                Text("Use Red Text")
            }
            .foregroundStyle(useRedText ? .red : .blue)
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            
            spells // This will be a VStack with 2 Texts
            
            VStack {
                motto1
                    .foregroundStyle(.red)
                motto2
                    .foregroundStyle(.blue)
            }
            
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
