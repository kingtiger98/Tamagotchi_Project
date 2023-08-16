//
//  UserDefaultsHelper.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/16/23.
//

import UIKit

class UserDefaultsHelper {
    
    private init() { }
    
    static let standard = UserDefaultsHelper()
 
    let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case nickName
        case isFirstLaunch
        case TamagotchiImage
        case TamagotchiName
        case riceCount
        case waterCount
    }
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickName.rawValue) ?? "대장"
        }
        set {
            return userDefaults.set(newValue, forKey: Key.nickName.rawValue)
        }
    }
    
    var applanch: Bool {
        get {
            return userDefaults.bool(forKey: Key.isFirstLaunch.rawValue)
        }
        set {
            return userDefaults.set(newValue, forKey: "isFirstLaunch")
        }
    }
    
    var tamagotchiimage: String {
        get {
            return userDefaults.string(forKey: Key.TamagotchiImage.rawValue) ?? "noImage"
        }
        set {
            return userDefaults.set(newValue, forKey: Key.TamagotchiImage.rawValue)
        }
    }
    
    var tamagotchiname: String {
        get {
            return userDefaults.string(forKey: Key.TamagotchiName.rawValue) ?? "준비중입니다"
        }
        set {
            return userDefaults.set(newValue, forKey: Key.TamagotchiName.rawValue)
        }
    }
    
    var ricecount: Double {
        get {
            return userDefaults.double(forKey: Key.riceCount.rawValue)
        }
        set {
            return userDefaults.set(newValue, forKey: Key.riceCount.rawValue)
        }
    }
    
    var watercount: Double {
        get {
            return userDefaults.double(forKey: Key.waterCount.rawValue)
        }
        set {
            return userDefaults.set(newValue, forKey: Key.waterCount.rawValue)
        }
    }
    
    
    
}




