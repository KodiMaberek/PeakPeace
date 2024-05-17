//
//  LandmarkRow.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/16/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(.rect(cornerRadius: 7))
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.amber)
            }
        }
        .padding(.horizontal, 2)
    }
}

#Preview {
    let vm = LandmarkViewModel()
    return LandmarkRow(landmark: vm.landmarks[0])
}
