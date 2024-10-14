//
//  IntermediaryModels.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}

//
//struct Order: Codable {
//    var menuItems: [MenuItem]
//    init(menuItems: [MenuItem] = []) {
//        self.menuItems = menuItems
//    }
//}
//
