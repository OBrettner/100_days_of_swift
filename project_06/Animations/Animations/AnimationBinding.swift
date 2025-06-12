//
//  AnimationBinding.swift
//  Animations
//
//  Created by Oliver Brettmer on 2025. 06. 09..
//

import SwiftUI

struct AnimationBinding: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            Spacer()
            
            Button("Tap me!") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
        .padding()
    }
}

#Preview {
    AnimationBinding()
}
