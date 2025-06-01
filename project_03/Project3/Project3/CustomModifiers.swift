//
//  CustomModifiers.swift
//  Project3
//
//  Created by Oliver Brettmer on 2025. 05. 31..
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermark(_ text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct CustomModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
        
        Color.blue
            .frame(width: 200, height: 300)
            .watermark("Thingy")
    }
}

#Preview {
    CustomModifiers()
}
