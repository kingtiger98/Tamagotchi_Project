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
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTextField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    // 새이름 지정
    @IBAction func newNameSaveBarButtonClicked(_ sender: UIBarButtonItem) {
        
        
        guard let newNickname = newNameTextField.text else {
            return
        }
        // 새로운 이름으로 저장
        //UserDefaults.standard.set(newNickname, forKey: "nickName")
        UserDefaultsHelper.standard.nickname = newNickname
        
        // notification사용해 닉네임 역전달하기
        // 1. 역전달할 새로운 닉네임
        NotificationCenter.default.post(name: NSNotification.Name("newNickName"), object: nil, userInfo: ["nickName": newNameTextField.text!])

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
