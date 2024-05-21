//
//  Hike.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var difficulty: Int
    var distance: Double
    var observations: [Observations]
    
    static var formatter = LengthFormatter()
    
    var formatterText: String {
        Hike.formatter.string(
            fromValue: distance, unit: .kilometer)
    }
    
    struct Observations: Codable, Hashable {
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
