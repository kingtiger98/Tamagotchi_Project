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
        cell.textLabel?.text = Setting.allCases[indexPath.row].setting
        cell.detailTextLabel?.text = Setting.allCases[indexPath.row].subTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            guard let vc1 = storyboard?.instantiateViewController(withIdentifier: "NameSettingViewController") as? NameSettingViewController else {
                return
            }
            navigationController?.pushViewController(vc1, animated: true)
        } else if indexPath.row == 1 {

            print("다마고치 바꾸기 구현 해야함")
            
        } else if indexPath.row == 2 {
            resetData()
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
