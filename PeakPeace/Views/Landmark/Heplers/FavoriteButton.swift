//
//  FavoriteButton.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/17/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    @State var animationAmoint = 1.0
    
    var body: some View {
        Button(action: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                isSet.toggle()
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
            if isSet {
                animationAmoint -= 0.15
            } else {
                animationAmoint += 0.35
            }
            
        }, label: {
            ZStack {
                Circle()
                    .foregroundStyle(isSet ? .white : .gray)
                    .overlay {
                        if isSet {
                            Circle().stroke(.bridesmaid, lineWidth: 1)
                        }
                    }
                    .frame(width: 23, height: 23)
                    .offset(y: 0.5)
                Image(systemName: isSet ? "star.fill" : "star")
                    .foregroundStyle(isSet ? .amber : .white)
                    .scaleEffect(animationAmoint)
                    .animation(.spring(duration: 0.9), value: animationAmoint)
            }
        })
        .tint(.white)
        .onChange(of: animationAmoint) { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    animationAmoint = 1.0
                }
            }
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
