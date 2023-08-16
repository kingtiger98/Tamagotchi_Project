//
//  ReuseableProtocol.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/16/23.
//

import Foundation
import UIKit


protocol ReuseableViewProtocol {
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReuseableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

}

