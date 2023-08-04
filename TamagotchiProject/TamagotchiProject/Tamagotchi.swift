//
//  Tamagotchi.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

enum Tamagotchi: String {
    case green = "따끔따끔 다마고치"
    case orange = "방실방실 다마고치"
    case pink = "반짝반짝 다마고치"
    case preparing = "준비중이에요"
    
    var appearance: String {
        switch self {
        case .green:
            return "1-6"
        case .orange:
            return "2-6"
        case .pink:
            return "3-6"
        case .preparing:
            return "noImage"
        }
    }
}

enum Color {
    case background
    case font
    case bound
    
    var UIcolor: UIColor {
        switch self {
        case .background:
            return UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        case .font:
            return UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        case .bound:
            return UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        }
    }
    
    var CGcolor: CGColor {
        switch self {
        case .background:
            return CGColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        case .font:
            return CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        case .bound:
            return CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        }
    }
    
}

struct TamagotchiState{
    var appearance: String
    var name: String
    var level: Int = 1
    var riceCount: Int = 0
    var waterCount: Int = 0
}

struct TamagotchiList{
    var tamagotchi: [TamagotchiState] = [TamagotchiState(appearance: Tamagotchi.green.appearance, name: Tamagotchi.green.rawValue),
                                         TamagotchiState(appearance: Tamagotchi.orange.appearance, name: Tamagotchi.orange.rawValue), TamagotchiState(appearance: Tamagotchi.pink.appearance, name: Tamagotchi.pink.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue), TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue) ]
}
