//
//  CategoryHome.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/22/24.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var vm: LandmarkViewModel
    
    var body: some View {
        
        NavigationView {
            List {
                TabView {
                    ForEach(vm.featured, id: \.id) { feature in
                        feature.image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(.rect(cornerRadius: 10))
                            .clipped()
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
                
                ForEach(vm.category.keys.sorted(), id: \.self) { name in
                    CategoryRow(categoryName: name, items: vm.category[name]!)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(LandmarkViewModel())
}
