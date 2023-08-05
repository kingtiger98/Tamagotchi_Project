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
    
    var appearance1: String {
        switch self {
        case .green:
            return "1-1"
        case .orange:
            return "2-1"
        case .pink:
            return "3-1"
        case .preparing:
            return "noImage"
        }
    }
    
    var appearance2: String {
        switch self {
        case .green:
            return "1-2"
        case .orange:
            return "2-2"
        case .pink:
            return "3-2"
        case .preparing:
            return "noImage"
        }
    }
    
    var appearance3: String {
        switch self {
        case .green:
            return "1-3"
        case .orange:
            return "2-3"
        case .pink:
            return "3-3"
        case .preparing:
            return "noImage"
        }
    }
    
    var appearance4: String {
        switch self {
        case .green:
            return "1-4"
        case .orange:
            return "2-4"
        case .pink:
            return "3-4"
        case .preparing:
            return "noImage"
        }
    }
    
    var appearance5: String {
        switch self {
        case .green:
            return "1-5"
        case .orange:
            return "2-5"
        case .pink:
            return "3-5"
        case .preparing:
            return "noImage"
        }
    }
    
    var appearance6: String {
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
    
    var appearance7: String {
        switch self {
        case .green:
            return "1-7"
        case .orange:
            return "2-7"
        case .pink:
            return "3-7"
        case .preparing:
            return "noImage"
        }
    }
    
    var appearance8: String {
        switch self {
        case .green:
            return "1-8"
        case .orange:
            return "2-8"
        case .pink:
            return "3-8"
        case .preparing:
            return "noImage"
        }
    }
    
    
    var appearance9: String {
        switch self {
        case .green:
            return "1-9"
        case .orange:
            return "2-9"
        case .pink:
            return "3-9"
        case .preparing:
            return "noImage"
        }
    }
    
}

struct TamagotchiState{
    var name: String
    var introduce: String
    var levelOneAppearance: String
    var levelTwoAppearance: String
    var levelThreeAppearance: String
    var levelFourAppearance: String
    var levelFiveAppearance: String
    var levelSixAppearance: String
    var levelSevenAppearance: String
    var levelEightAppearance: String
    var levelNineAppearance: String

}

struct TamagotchiList{
    var tamagotchi: [TamagotchiState] =
        [
            TamagotchiState(name: Tamagotchi.green.rawValue,
                            introduce: Tamagotchi.green.introduce,
                            levelOneAppearance: Tamagotchi.green.appearance1,
                            levelTwoAppearance: Tamagotchi.green.appearance2,
                            levelThreeAppearance: Tamagotchi.green.appearance3,
                            levelFourAppearance: Tamagotchi.green.appearance4,
                            levelFiveAppearance: Tamagotchi.green.appearance5,
                            levelSixAppearance: Tamagotchi.green.appearance6,
                            levelSevenAppearance: Tamagotchi.green.appearance7,
                            levelEightAppearance: Tamagotchi.green.appearance8,
                            levelNineAppearance: Tamagotchi.green.appearance9),
            
            TamagotchiState(name: Tamagotchi.orange.rawValue,
                            introduce: Tamagotchi.orange.introduce,
                            levelOneAppearance: Tamagotchi.orange.appearance1,
                            levelTwoAppearance: Tamagotchi.orange.appearance2,
                            levelThreeAppearance: Tamagotchi.orange.appearance3,
                            levelFourAppearance: Tamagotchi.orange.appearance4,
                            levelFiveAppearance: Tamagotchi.orange.appearance5,
                            levelSixAppearance: Tamagotchi.orange.appearance6,
                            levelSevenAppearance: Tamagotchi.orange.appearance7,
                            levelEightAppearance: Tamagotchi.orange.appearance8,
                            levelNineAppearance: Tamagotchi.orange.appearance9),
            
            TamagotchiState(name: Tamagotchi.pink.rawValue,
                            introduce: Tamagotchi.pink.introduce,
                            levelOneAppearance: Tamagotchi.pink.appearance1,
                            levelTwoAppearance: Tamagotchi.pink.appearance2,
                            levelThreeAppearance: Tamagotchi.pink.appearance3,
                            levelFourAppearance: Tamagotchi.pink.appearance4,
                            levelFiveAppearance: Tamagotchi.pink.appearance5,
                            levelSixAppearance: Tamagotchi.pink.appearance6,
                            levelSevenAppearance: Tamagotchi.pink.appearance7,
                            levelEightAppearance: Tamagotchi.pink.appearance8,
                            levelNineAppearance: Tamagotchi.pink.appearance9),
            
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9),
            
            TamagotchiState(name: Tamagotchi.preparing.rawValue,
                            introduce: Tamagotchi.preparing.introduce,
                            levelOneAppearance: Tamagotchi.preparing.appearance1,
                            levelTwoAppearance: Tamagotchi.preparing.appearance2,
                            levelThreeAppearance: Tamagotchi.preparing.appearance3,
                            levelFourAppearance: Tamagotchi.preparing.appearance4,
                            levelFiveAppearance: Tamagotchi.preparing.appearance5,
                            levelSixAppearance: Tamagotchi.preparing.appearance6,
                            levelSevenAppearance: Tamagotchi.preparing.appearance7,
                            levelEightAppearance: Tamagotchi.preparing.appearance8,
                            levelNineAppearance: Tamagotchi.preparing.appearance9)
        ]
}






