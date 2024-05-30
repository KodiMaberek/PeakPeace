//
//  PeakPeaceTabView.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import SwiftUI

struct PeakPeaceTabView: View {
    @EnvironmentObject var vm: TabViewViewModel
    
    var body: some View {
        TabView {
            CategoryHome()
                .tag(TabViewViewModel.Tab.group)
                .tabItem {
                    Image(systemName: "rectangle.3.group")
                    Text("Group")
                }
            
            FavoriteList()
                .tag(TabViewViewModel.Tab.favorites)
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
        .hiddenTabBar(value: vm.showingTabBar)
        .toolbar(vm.showingTabBar ? .visible : .hidden, for: .tabBar)
        .onAppear {
            vm.showingTabBar = true
        }
    }
}

#Preview {
    PeakPeaceTabView()
        .environmentObject(TabViewViewModel())
        .environmentObject(LandmarkViewModel())
}
