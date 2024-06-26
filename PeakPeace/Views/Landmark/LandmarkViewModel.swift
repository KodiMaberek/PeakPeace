//
//  LandmarkViewModel.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import Foundation
import SwiftUI

final class LandmarkViewModel: ObservableObject {
    @AppStorage("landmarks") var modelData: Data?
    @Published var landmarks: [Landmark] = loadData("landmarkData.json")
    @Published var showingFavorite = true
    @Published var showingCategoryList = false
    @Published var selectCategoryName: String? 
    var filterLandmark: [Landmark] {
        landmarks.filter { landmark in
            (!showingFavorite || landmark.isFavorite)
        }
    }
    
    var category: [String : [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
    
    var featured: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    func saveData() {
        let encoded = try? JSONEncoder().encode(landmarks)
        modelData = encoded
    }
    
    func retrieve() {
        guard let savedData = modelData else {return}
        
        do {
            let decoded = try JSONDecoder().decode([Landmark].self, from: savedData)
            landmarks = decoded
        } catch {
            print("Something wrong")
        }
    }
}
