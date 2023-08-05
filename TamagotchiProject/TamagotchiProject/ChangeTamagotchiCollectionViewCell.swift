//
//  ChangeTamagotchiCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class ChangeTamagotchiCollectionViewCell: UICollectionViewCell {

    static let identifier = "ChangeTamagotchiCollectionViewCell"

    
    @IBOutlet weak var changeTamagotchiImageView: UIImageView!
    
    
    @IBOutlet weak var changeTamagotchiNameLabel: UILabel!
    
    
    
    func configureCell(row: TamagotchiState){
        print("뭐가 문제니")
        changeTamagotchiNameLabel.layer.borderColor = Color.bound.CGcolor
        changeTamagotchiNameLabel.layer.borderWidth = 1
        changeTamagotchiNameLabel.layer.cornerRadius = 5
        changeTamagotchiNameLabel.font = .boldSystemFont(ofSize: 13)
        changeTamagotchiNameLabel.textColor = Color.font.UIcolor
        
        changeTamagotchiImageView.image = UIImage(named: row.appearance)
        changeTamagotchiNameLabel.text = row.name

    }
    
    
    
    
}
