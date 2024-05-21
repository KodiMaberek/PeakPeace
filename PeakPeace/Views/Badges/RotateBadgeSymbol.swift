//
//  RotateBadge.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle)
    }
}

#Preview {
    RotateBadgeSymbol(angle: Angle(degrees: 8))
}
