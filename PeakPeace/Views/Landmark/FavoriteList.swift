//
//  LandmarkList.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/16/24.
//

import SwiftUI

struct FavoriteList: View {
    
    @EnvironmentObject var vm: LandmarkViewModel
    
    var body: some View {
        NavigationView {
            List {
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
    FavoriteList()
        .environmentObject(LandmarkViewModel())
}
