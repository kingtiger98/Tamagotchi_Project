//
//  GrowViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class GrowViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var riceTotal: Double = 0.0
    var waterTotal: Double = 0.0
    var level: Int = 0
    var appearance: String = ""
    
    var riceInputNum: Double = 1.0
    var waterInputNum: Double = 1.0

    var imageContent1: String? // 1렙사진
    var imageContent2: String? // 2렙사진
    var imageContent3: String? // 3렙사진
    var imageContent4: String? // 4렙사진
    var imageContent5: String? // 5렙사진
    var imageContent6: String? // 6렙사진
    var imageContent7: String? // 7렙사진
    var imageContent8: String? // 8렙사진
    var imageContent9: String? // 9렙사진
    
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
    
    
    @IBOutlet weak var settingBarButtonItem: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setData()

        riceTotal = defaults.double(forKey: Food.rice.count)
        waterTotal = defaults.double(forKey: Food.water.count)
        
        // 화면 시작시 저장됐던 값 보이게
        TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        imageChange()
        
        
        
        configureNavigationBar()
        configureBackView()
        
        configuerTamagochiNameLabel()
        configureStateLabel()
        configureInputTextField()
        configureFeedingButtons()
        

        
        
    }
    
    
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        
        
        if riceInputTextField.text != "" {
            riceInputNum = Double(riceInputTextField.text!)!
            riceInputTextField.text = ""
        } else {
            riceInputNum = 1
        }
        
        // 1. UserDefault에 탭한 값을 더해 저장한다.
        riceTotal = defaults.double(forKey: Food.rice.count) + riceInputNum
        print(riceTotal)

        // 2. 다시 UserDefault에 저장
        defaults.set(riceTotal, forKey: Food.rice.count)
        print(riceTotal)
        
        TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        imageChange()

    }
    
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        
        if waterInputTextField.text != "" {
            waterInputNum = Double(waterInputTextField.text!)!
            waterInputTextField.text = ""
        }  else {
            waterInputNum = 1
        }
        
        // 1. UserDefault에 탭한 값을 더해 저장한다.
        waterTotal = defaults.double(forKey: Food.water.count) + waterInputNum
        print(waterTotal)

        // 2. 다시 UserDefault에 저장
        defaults.set(waterTotal, forKey: Food.water.count)
        print(waterTotal)
        
        TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        imageChange()
    }
    
    
    
    @IBAction func settingBarButttonItemClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // 레벨 리턴
    func levelCalc() -> Int {
        
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
        
        return level
    }
    
    func imageChange() {
        switch levelCalc() {
        case 1:
            TamagotchiImageView.image = UIImage(named: imageContent1!)
        case 2:
            TamagotchiImageView.image = UIImage(named: imageContent2!)
        case 3:
            TamagotchiImageView.image = UIImage(named: imageContent3!)
        case 4:
            TamagotchiImageView.image = UIImage(named: imageContent4!)
        case 5:
            TamagotchiImageView.image = UIImage(named: imageContent5!)
        case 6:
            TamagotchiImageView.image = UIImage(named: imageContent6!)
        case 7:
            TamagotchiImageView.image = UIImage(named: imageContent7!)
        case 8:
            TamagotchiImageView.image = UIImage(named: imageContent8!)
        case 9:
            TamagotchiImageView.image = UIImage(named: imageContent9!)
        default:
            TamagotchiImageView.image = UIImage(named: imageContent9!)
        }
    }
    
    
    func setData() {
        guard let image = imageContent1, let name = nameContents else {
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
        navigationItem.title = "\(UserName.name.rawValue)님의 다마고치"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        
        settingBarButtonItem.image = UIImage(systemName: "person.circle")
        settingBarButtonItem.tintColor = Color.font.UIcolor
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

