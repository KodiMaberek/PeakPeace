//
//  Animation+Ext.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import Foundation
import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}
