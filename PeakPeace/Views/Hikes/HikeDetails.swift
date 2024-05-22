//
//  HikeDetails.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import SwiftUI

struct HikeDetails: View {
    var hike: Hike
    @State var dataToShow = \Hike.Observations.elevation
    
    var button = [
        ("Elevation", \Hike.Observations.elevation),
        ("Heart rate", \Hike.Observations.heartRate),
        ("Pace", \Hike.Observations.pace)
    ]
    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            
            HStack(spacing: 25) {
                ForEach(button, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundStyle(value.1 == dataToShow
                                             ? .gray
                                             : .accentColor)
                    }
                }
            }
        }
    }
}

#Preview {
    let vm = HikeViewModel().hikes[0]
    return HikeDetails(hike: vm)
        .environmentObject(HikeViewModel())
}
