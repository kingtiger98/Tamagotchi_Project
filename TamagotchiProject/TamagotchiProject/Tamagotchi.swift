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
    
    var introduce: String {
        switch self {
        case .green:
            return "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:)"
        case .orange:
            return "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실!"
        case .pink:
            return "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~"
        case .preparing:
            return "진로 고민중입니다,,,"
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
    var introduce: String
    var level: Int = 1
    var riceCount: Int = 0
    var waterCount: Int = 0
}

struct TamagotchiList{
    var tamagotchi: [TamagotchiState] = [TamagotchiState(appearance: Tamagotchi.green.appearance, name: Tamagotchi.green.rawValue, introduce: Tamagotchi.green.introduce),
                                         TamagotchiState(appearance: Tamagotchi.orange.appearance, name: Tamagotchi.orange.rawValue, introduce: Tamagotchi.orange.introduce),
                                         TamagotchiState(appearance: Tamagotchi.pink.appearance, name: Tamagotchi.pink.rawValue, introduce: Tamagotchi.pink.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce),
                                         TamagotchiState(appearance: Tamagotchi.preparing.appearance, name: Tamagotchi.preparing.rawValue, introduce: Tamagotchi.preparing.introduce)
    ]
}
