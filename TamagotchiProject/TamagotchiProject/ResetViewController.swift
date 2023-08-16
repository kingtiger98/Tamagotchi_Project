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
    
    
    @IBOutlet weak var noResetButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureButton()
        
    }
    
    
    @IBAction func noResetButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        // 모든 모달 뷰 컨트롤러를 해제
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
        
        // UserDefaults 초기화
        // UserDefaults.standard.set(0, forKey: Food.rice.count)
        // UserDefaults.standard.set(0, forKey: Food.water.count)
        UserDefaultsHelper.standard.ricecount = 0
        UserDefaultsHelper.standard.watercount = 0
        
        // 새로운 뷰 컨트롤러 표시
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ChoiceViewController") as? ChoiceViewController else {
            return
        }
        
        vc.navigationItem.title = "다마고치 선택하기"
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        UIApplication.shared.windows.first?.rootViewController?.present(nav, animated: true)
    }

    
    
    // 배경뷰 불투명하게
    func configureView() {
        backView.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha: 0.3)
        resetView.backgroundColor =  Color.background.UIcolor
        resetView.layer.cornerRadius = 5
        resetView.layer.masksToBounds = true
    }
 
    
    func configureButton() {
        noResetButton.setTitle("아니!", for: .normal)
        resetButton.setTitle("웅!", for: .normal)

        noResetButton.setTitleColor(.lightGray, for: .highlighted)
        resetButton.setTitleColor(.lightGray, for: .highlighted)

        noResetButton.tintColor = Color.font.UIcolor
        resetButton.tintColor = Color.font.UIcolor

        noResetButton.backgroundColor = .systemGray6
        resetButton.backgroundColor = Color.background.UIcolor
    }
}
