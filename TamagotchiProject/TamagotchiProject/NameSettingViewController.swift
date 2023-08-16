//
//  NameSettingViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class NameSettingViewController: UIViewController {

    

    
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var newNameSaveBarButtonItem: UIBarButtonItem!
    
    // var newDefaultsName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTextField()
    }
    
    
    

    // 새이름 지정
    @IBAction func newNameSaveBarButtonClicked(_ sender: UIBarButtonItem) {
        
        
        guard let newNickname = newNameTextField.text else {
            return
        }
        // 새로운 이름으로 저장
        //UserDefaults.standard.set(newNickname, forKey: "nickName")
        UserDefaultsHelper.standard.nickname = newNickname
        
        newNameTextField.text = ""
        
        navigationController?.popViewController(animated: true)
    }
    
    func configureNavigationBar() {
        
        navigationItem.title = "\(UserDefaultsHelper.standard.nickname)님 이름 정하기"
        newNameSaveBarButtonItem.title = "저장"
    }
    
    func configureTextField() {

        newNameTextField.text = "\(UserDefaultsHelper.standard.nickname)"
        newNameTextField.placeholder = "\(UserDefaultsHelper.standard.nickname)님 이름을 알려주세요!"
    }
    
}
