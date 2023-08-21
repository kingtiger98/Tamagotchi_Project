//
//  FeedButton.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/21/23.
//

import UIKit

class FeedButton: UIButton{
    
    // 연산 프로퍼티
    @IBInspectable //***
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
    
}
