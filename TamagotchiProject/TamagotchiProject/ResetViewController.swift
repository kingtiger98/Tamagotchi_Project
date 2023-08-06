//
//  ResetViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/6/23.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet var backView: UIView!
    
    @IBOutlet weak var resetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    
    
    // 배경뷰 불투명하게
    func configureView() {
        backView.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha: 0.3)
        resetView.backgroundColor =  Color.background.UIcolor
        resetView.layer.cornerRadius = 5
        resetView.layer.masksToBounds = true
    }
    
}
