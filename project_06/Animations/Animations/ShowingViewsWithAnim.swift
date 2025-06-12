//
//  ShowingViewsWithAnim.swift
//  Animations
//
//  Created by Oliver Brettmer on 2025. 06. 10..
//

import SwiftUI

struct ShowingViewsWithAnim: View {
    @State private var isVisible = true
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isVisible.toggle()
                }
            }
            
            if isVisible {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ShowingViewsWithAnim()
}
