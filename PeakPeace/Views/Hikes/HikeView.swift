//
//  HikeView.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/21/24.
//

import SwiftUI

struct HikeView: View {
    @EnvironmentObject var vm: HikeViewModel
    var hike: Hike
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.subheadline)
                    Text(hike.formatterText)
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        vm.showingDetails.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(vm.showingDetails ? 90 : 0))
                        .scaleEffect(vm.showingDetails ? 1.5 : 1)
                        .padding()
                }
            }
            
            if vm.showingDetails {
                HikeDetails(hike: hike)
                    .transition(.moveAndFade)
            }
        }
        Spacer()
    }
}

#Preview {
    let vm = HikeViewModel().hikes[0]
    return HikeView(hike: vm)
        .environmentObject(HikeViewModel())
}
