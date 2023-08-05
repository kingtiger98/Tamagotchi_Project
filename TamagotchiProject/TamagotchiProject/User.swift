//
//  User.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit



enum UserName: String{
    case name = "대장"
}

struct NicknameChanger{
    
    var firstNickName = "대장"
    
    var newNickName: String {
        get{
            return firstNickName
        }
        set {
            firstNickName = newValue
            print("원래 닉네임이 변경되었습니다. 새로운 닉네임: \(newValue)")
        }
    }
}

