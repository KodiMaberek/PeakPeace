//
//  TabViewViewModel.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/24/24.
//

import Foundation

final class TabViewViewModel: ObservableObject {
    @Published var selection: Tab = .group
    @Published var showingTabBar = true
    
    enum Tab {
        case group
        case favorites
    }
}
