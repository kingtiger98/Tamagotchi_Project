//
//  SettingViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingTableView.delegate = self
        settingTableView.dataSource = self

        navigationItem.title = "설정"
        navigationItem.backBarButtonItem?.title = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}





extension SettingViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = settingTableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.imageView?.image = UIImage(systemName: Setting.allCases[indexPath.row].image)
        cell.imageView?.tintColor = Color.font.UIcolor
        
        cell.textLabel?.text = Setting.allCases[indexPath.row].setting
        cell.textLabel?.font = .boldSystemFont(ofSize: 13)
        cell.textLabel?.textColor = Color.font.UIcolor
        
        cell.detailTextLabel?.text = Setting.allCases[indexPath.row].subTitle
        // 이름 변경하기 옆에 작게 내 이름 뜨게해야대***
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            guard let vc1 = storyboard?.instantiateViewController(withIdentifier: "NameSettingViewController") as? NameSettingViewController else {
                return
            }
            navigationController?.pushViewController(vc1, animated: true)
        } else if indexPath.row == 1 {
            
            // 1.
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            // 2.
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ChoiceViewController") as! ChoiceViewController
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
            
            
            
            
        } else if indexPath.row == 2 {
         
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResetViewController") as? ResetViewController else {
                return
            }
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overCurrentContext
            
            present(vc, animated: true)
            
        }

    }
    
    

    
    
    func resetData() {
        
        let alter = UIAlertController(title: "데이터 초기화!", message: "정말 다시 처음부터 시작하실 건가욥?", preferredStyle: .alert)
        
        let cancle = UIAlertAction(title: "아니!", style: .cancel)
        let okay = UIAlertAction(title: "웅", style: .default)
        
        alter.addAction(cancle)
        alter.addAction(okay)
        
        present(alter, animated: true)
        
    }
    
}
