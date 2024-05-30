//
//  View+Ext.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/28/24.
//

import Foundation
import SwiftUI

extension View {
    func hiddenTabBar(value: Bool) -> some View {
        self.toolbar(value ? .visible : .hidden, for: .tabBar)
    }
}
