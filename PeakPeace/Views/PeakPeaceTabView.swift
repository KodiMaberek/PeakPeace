//
//  PeakPeaceTabView.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import SwiftUI

struct PeakPeaceTabView: View {
    @State var selection: Tab = .group
    
    enum Tab {
        case group
        case list
    }
    
    var body: some View {
        TabView {
            CategoryHome()
                .tag(Tab.group)
                .tabItem {
                    Image(systemName: "rectangle.3.group")
                    Text("Group")
                }
            
            LandmarkList()
                .tag(Tab.list)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

#Preview {
    PeakPeaceTabView()
        .environmentObject(LandmarkViewModel())
}
