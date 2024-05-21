//
//  Transition+Ext.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(insertion: move(edge: .trailing).combined(with: .opacity),
                    removal: .scale.combined(with: opacity))
    }
}
