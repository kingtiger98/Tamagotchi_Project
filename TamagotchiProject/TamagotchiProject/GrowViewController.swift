//
//  GrowViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class GrowViewController: UIViewController {

    var riceTotal: Double = 0.0
    var waterTotal: Double = 0.0
    var level: Int = 0
    
    var imageContents: String?
    var nameContents: String?
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var talkBackView: UIView!
    
    @IBOutlet weak var TamagotchiTalkTextView: UITextView!
    @IBOutlet weak var TamagotchiImageView: UIImageView!
    @IBOutlet weak var TamagotchiNameLabel: UILabel!
    @IBOutlet weak var TamagotchiStateLabel: UILabel!
    
    @IBOutlet weak var riceInputTextField: UITextField!
    @IBOutlet weak var waterInputTextField: UITextField!
    
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureBackView()
        
        configuerTamagochiNameLabel()
        configureStateLabel()
        configureInputTextField()
        configureFeedingButtons()
        
        setData()
    }
    
    
    @IBAction func riceButtonClicked(_ sender: UIButton) {
                
        // 1. UserDefault에 탭한 값을 더해 저장한다.
        riceTotal = UserDefaults.standard.double(forKey: Food.rice.count) + 1.0
        print(riceTotal)

        // 2. 다시 UserDefault에 저장
        UserDefaults.standard.set(riceTotal, forKey: Food.rice.count)
        print(riceTotal)
                
        levelCalc()
        TamagotchiStateLabel.text = "LV\(level)﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"

    }
    
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        
        // 1. UserDefault에 탭한 값을 더해 저장한다.
        waterTotal = UserDefaults.standard.double(forKey: Food.water.count) + 1.0
        print(waterTotal)

        // 2. 다시 UserDefault에 저장
        UserDefaults.standard.set(waterTotal, forKey: Food.water.count)
        print(waterTotal)
        
        levelCalc()
        TamagotchiStateLabel.text = "LV\(level)﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"

    }
    
    func levelCalc() {
        
        level = Int((riceTotal / 5.0) + (waterTotal / 2.0))
        
        switch level {
        case 0..<10:
            level = 1
        case 10..<20:
            level = 1
        case 20..<30:
            level = 2
        case 30..<40:
            level = 3
        case 40..<50:
            level = 4
        case 50..<60:
            level = 5
        case 60..<70:
            level = 6
        case 70..<80:
            level = 7
        case 80..<90:
            level = 8
        case 90..<100:
            level = 10
        case 100...:
            level = 10
        default:
            level = 10
        }
        
    }
    
    
    
    
    func setData() {
        guard let image = imageContents, let name = nameContents else {
            return
        }
        
        TamagotchiImageView.image = UIImage(named: image)
        TamagotchiNameLabel.text = name
    }

    
    func configureBackView() {
        backView.backgroundColor =  Color.background.UIcolor
        talkBackView.backgroundColor = .clear
    }
    
    
    func configureNavigationBar() {
        navigationItem.title = "\(userName.name.rawValue)님의 다마고치"
    }
    
    
    func configuerTamagochiNameLabel() {
        
        TamagotchiNameLabel.font = .boldSystemFont(ofSize: 14)
        TamagotchiNameLabel.textColor = Color.font.UIcolor
        
        TamagotchiNameLabel.layer.borderWidth = 0.7
        TamagotchiNameLabel.layer.borderColor = Color.bound.CGcolor
        TamagotchiNameLabel.layer.cornerRadius = 5
        
    }
    
    
    func configureStateLabel() {
        
        TamagotchiStateLabel.textColor = Color.font.UIcolor
        TamagotchiStateLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    //*
    func configureInputTextField() {
        riceInputTextField.backgroundColor = .clear
        waterInputTextField.backgroundColor = .clear
                        
        riceInputTextField.placeholder = "밥주세용"
        waterInputTextField.placeholder = "물주세용"

        riceInputTextField.textAlignment = .center
        waterInputTextField.textAlignment = .center
        
        // riceInputTextField.borderStyle = .none
        
        // riceInputTextField.layer.borderWidth = 1
        // riceInputTextField.layer.borderColor = Color.background.CGcolor
        
        // riceInputTextField.layer.addBorder(edge: .bottom, color: Color.bound.UIcolor, thickness: 1)
    }
    
    func configureFeedingButtons() {
                
        riceButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        waterButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)

        riceButton.setTitle(" 밥먹기", for: .normal)
        waterButton.setTitle(" 물먹기", for: .normal)

        
        riceButton.tintColor = Color.font.UIcolor
        waterButton.tintColor = Color.font.UIcolor
        
        riceButton.layer.borderColor = Color.bound.CGcolor
        waterButton.layer.borderColor = Color.bound.CGcolor
        
        riceButton.layer.borderWidth = 1
        waterButton.layer.borderWidth = 1
        
        riceButton.layer.cornerRadius = 5
        waterButton.layer.cornerRadius = 5

    }
    
    
    

}

