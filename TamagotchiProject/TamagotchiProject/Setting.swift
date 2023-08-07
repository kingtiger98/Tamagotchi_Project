//
//  Setting.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

enum Setting: Int, CaseIterable {
    
    case nameSet = 0
    case tamagotchiSet
    case dataSet
    
    
    var image: String {
        switch self {
        case .nameSet:
            return "pencil"
        case .tamagotchiSet:
            return "moon.fill"
        case .dataSet:
            return "repeat"
        }
    }
    
    var setting: String {
        switch self {
        case .nameSet:
            return "내 이름 설정하기"
        case .tamagotchiSet:
            return "다마고치 변경하기"
        case .dataSet:
            return "데이터 초기화"
        }
    }
    
    var subTitle: String {
        switch self {
        case .nameSet:
            return "\(String(describing: UserDefaults.standard.string(forKey: "nickName") ?? "대장"))"
        case .tamagotchiSet:
            return ""
        case .dataSet:
            return ""
        }
    }
    
    
    
}
