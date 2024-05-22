//
//  HikeGraph.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import SwiftUI

struct HikeGraph: View {
    @EnvironmentObject var vm: HikeViewModel
    var hike: Hike
    var path: KeyPath<Hike.Observations, Range<Double>>
    
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    var body: some View {
        let data = hike.observations
        let overallRange = vm.rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        let maxMagnitude = data.map { vm.magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / vm.magnitude(of: overallRange))
      
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    CapsuleGraph(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        overallRange: overallRange,
                        range: observation[keyPath: path]
                    )
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

#Preview {
    let hike = HikeViewModel().hikes[0]
    return HikeGraph(hike: hike, path: \.elevation)
        .environmentObject(HikeViewModel())
}
