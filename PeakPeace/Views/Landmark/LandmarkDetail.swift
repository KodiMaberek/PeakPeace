//
//  LandmarkDetail.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var vm: LandmarkViewModel
    
    var landmark: Landmark
    
    var indexLandmark: Int {
        vm.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
                .clipShape(.rect(cornerRadius: 10), style: FillStyle())
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $vm.landmarks[indexLandmark].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.padding(.horizontal, 3)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                    .padding(.bottom, 3)
                Text(landmark.description)
                    .padding(.horizontal, 3)
            }
            .navigationTitle("\(landmark.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: vm.landmarks) { oldValue in
            vm.saveData()
        }
    }
}

#Preview {
    let landmarks: [Landmark] = loadData("landmarkData.json")
    return LandmarkDetail(landmark: landmarks[0])
        .environmentObject(LandmarkViewModel())
}
