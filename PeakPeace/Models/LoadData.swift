//
//  LoadData.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/14/24.
//

import Foundation

func loadData<T: Codable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't pharse \(fileName) as \(T.self): \n\(error)")
    }
}
