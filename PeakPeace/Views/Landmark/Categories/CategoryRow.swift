//
//  CategoryRow.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/22/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.subheadline)
                .padding(.leading, 10)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 2) {
                    ForEach(items) { item in
                        NavigationLink {
                            LandmarkDetail(landmark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                        .tint(.black)
                    }
                }
            }
            .frame(height: 190)
        }
    }
}

#Preview {
    let vm = LandmarkViewModel()
    return CategoryRow(categoryName: vm.landmarks[0].category.rawValue,
                       items: Array(vm.landmarks.prefix(4)))
}
