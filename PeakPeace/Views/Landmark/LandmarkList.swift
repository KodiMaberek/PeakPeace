//
//  LandmarkList.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/16/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var vm: LandmarkViewModel
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Favorites only", isOn: $vm.showingFavorite)
                    .tint(.amber)
                ForEach(vm.filterLandmark) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Landmarks")
            .animation(.easeIn, value: vm.filterLandmark)
        }
        .onAppear {
            vm.retrieve()
        }
    }
}

#Preview {
    LandmarkList()
        .environmentObject(LandmarkViewModel())
}
