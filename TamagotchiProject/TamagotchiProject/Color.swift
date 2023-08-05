//
//  Color.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

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
