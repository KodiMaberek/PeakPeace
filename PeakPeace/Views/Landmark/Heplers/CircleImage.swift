//
//  CircleImage.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.bridesmaid, lineWidth: 3)
            }
            .shadow(color: .gray, radius: 7)
    }
}
