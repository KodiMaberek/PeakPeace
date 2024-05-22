//
//  CategoryItem.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/22/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(.rect(cornerRadius: 5))
            Text(landmark.name)
        }
        .padding(.leading, 10)
    }
}

#Preview {
    let landmark: [Landmark] = loadData("landmarkData.json")
    return CategoryItem(landmark: landmark[0])
}
