//
//  DetailViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tamagotchiDetailAlert()

    }
    

    func tamagotchiDetailAlert() {
        
        let alert = UIAlertController(title: "nil", message: "야야", preferredStyle: .alert)
        
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let start = UIAlertAction(title: "시작하기", style: .default)
        
        alert.addAction(cancle)
        alert.addAction(start)
        
        present(alert, animated: true)
    }


}
