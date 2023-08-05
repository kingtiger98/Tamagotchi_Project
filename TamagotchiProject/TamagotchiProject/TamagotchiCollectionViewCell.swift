//
//  TamagotchiCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/4/23.
//

import UIKit

class TamagotchiCollectionViewCell: UICollectionViewCell {

    static let identifier = "TamagotchiCollectionViewCell"
    
    @IBOutlet weak var TamagotchiImageView: UIImageView!
    @IBOutlet weak var TamagotchiNameLabel: UILabel!

    
    func configureCell(row: TamagotchiState){
        TamagotchiImageView.image = UIImage(named: row.levelSixAppearance)
        TamagotchiNameLabel.text = row.name
        
        TamagotchiNameLabel.layer.borderColor = Color.bound.CGcolor
        TamagotchiNameLabel.layer.borderWidth = 1
        TamagotchiNameLabel.layer.cornerRadius = 5
        TamagotchiNameLabel.font = .boldSystemFont(ofSize: 13)
        TamagotchiNameLabel.textColor = Color.font.UIcolor
    }
    
    
}
