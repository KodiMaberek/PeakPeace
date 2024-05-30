//
//  CategoryList.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/23/24.
//

import SwiftUI

struct CategoryList: View {
    @Environment(\.dismiss) var presentationMode
    @EnvironmentObject var vmTab: TabViewViewModel
    var categoryName: String
    var landmark: [Landmark]
    
    var body: some View {
        List {
            ForEach(landmark) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .hiddenTabBar(value: vmTab.showingTabBar)
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode()
                    vmTab.showingTabBar = true
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.gray)
                }
            }
        }
        
        .onAppear(perform: {
            vmTab.showingTabBar = false
        })
        .navigationTitle(categoryName)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    let vm = LandmarkViewModel()
    return CategoryList(categoryName: vm.landmarks[0].category.rawValue, landmark: Array(vm.landmarks.prefix(4)))
        .environmentObject(vm)
        .environmentObject(TabViewViewModel())
}
