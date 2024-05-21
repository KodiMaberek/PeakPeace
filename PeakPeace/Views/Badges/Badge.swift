//
//  Badge.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import SwiftUI

struct Badge: View {
    
    var badgeSymbol: some View {
        ForEach(0..<8) { index in
            RotateBadgeSymbol(angle: .degrees(Double(index) / 8 * 360))
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbol
                    .scaleEffect(0.25, anchor: .center)
            }
        }
    }
}

#Preview {
    Badge()
}
