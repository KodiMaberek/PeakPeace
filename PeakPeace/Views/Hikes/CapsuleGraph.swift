//
//  CapsuleGraph.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import SwiftUI

struct CapsuleGraph: View {
    @EnvironmentObject var vm: HikeViewModel
    var index: Int
    var color: Color
    var height: CGFloat
    var overallRange: Range<Double>
    var range: Range<Double>
    
    var heightRation: CGFloat {
        max(vm.magnitude(of: range) / vm.magnitude(of: overallRange), 0.15)
    }
    var offsetRation: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / vm.magnitude(of: overallRange))
    }
    
    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRation)
            .offset(x: 0, y: height * -offsetRation)
    }
}

#Preview {
    CapsuleGraph(index: 0, color: .blue, height: 150, overallRange: 0..<100, range: 10..<50)
        .environmentObject(HikeViewModel())
}
