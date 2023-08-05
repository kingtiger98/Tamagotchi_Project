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

    
    @IBAction func newNameSaveBarButtonClicked(_ sender: UIBarButtonItem) {
            
    }
    
    func configureNavigationBar() {
        navigationItem.titleView?.tintColor = .red
        navigationItem.title = "\(UserName.name.rawValue)님 이름 정하기"
        newNameSaveBarButtonItem.title = "저장"
    }
    
    func configureTextField() {
        //newNameTextField.textColor = .black
        newNameTextField.text = UserName.name.rawValue
        newNameTextField.placeholder = "대장님 이름을 알려주세요!"
    }
    
}
