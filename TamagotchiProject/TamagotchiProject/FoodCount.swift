//
//  FoodCount.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/6/23.
//

import Foundation

enum Food: Int {
    case rice = 0
    case water
    
    var count: String {
        switch self {
        case .rice:
            return "riceCount"
        case .water:
            return "waterCount"
        }
    }
    

    
}
