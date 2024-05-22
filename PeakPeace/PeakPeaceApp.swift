//
//  PeakPeaceApp.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import SwiftUI

@main
struct PeakPeaceApp: App {
    let viewModel = LandmarkViewModel()
    var body: some Scene {
        WindowGroup {
            PeakPeaceTabView()
                .environmentObject(viewModel)
        }
    }
}
