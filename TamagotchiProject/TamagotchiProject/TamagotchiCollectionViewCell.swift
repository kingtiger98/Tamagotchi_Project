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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
