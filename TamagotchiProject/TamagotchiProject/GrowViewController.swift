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

    var growImageContent1: String? // 1렙사진
    var growImageContent2: String? // 2렙사진
    var growImageContent3: String? // 3렙사진
    var growImageContent4: String? // 4렙사진
    var growImageContent5: String? // 5렙사진
    var growImageContent6: String? // 6렙사진
    var growImageContent7: String? // 7렙사진
    var growImageContent8: String? // 8렙사진
    var growImageContent9: String? // 9렙사진
    
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
                
        // 다마고치 첫 상태
        setData()

        // 화면 시작시 저장됐던 값 보이게
        stateChange()
        
        configureNavigationBar()
        configureBackView()
        configuerTamagochiNameLabel()
        configureStateLabel()
        configureInputTextField()
        configureFeedingButtons()
        
        alarm()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        settingBarButtonItem.image = UIImage(systemName: "person.circle")
        settingBarButtonItem.tintColor = Color.font.UIcolor
        navigationItem.backBarButtonItem?.title = ""
        
        // 이름 가져오기***
        navigationItem.title = "\(UserDefaultsHelper.standard.nickname)님의 다마고치"
        
        // 말풍선 바꾸기
        changeTalk()
        
        stateChange()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    
    func alarm() {
        // 앱 알람
        // 포그라운드에서 알림이 안뜨는게 디폴트! : 앱실행중
        
        // 1. 컨텐츠
        let content = UNMutableNotificationContent()
        content.title = "다마고치에게 먹이를 주세요!"
        content.body = "다마고치가 굶고 있어여,,,"
        // content.badge = 100
        
        // 2. 언제 => 알림 보내!
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // repeats을 false하면 60초 아래로 알림오는 것도 가능함

        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            print(error)
        }
    }
    
    
    func valiNumberInputError(number: String) throws -> Bool {
        
        // 빈 칸일 경우
        guard !(number.isEmpty) else {
            print("빈 값")
            throw ValidationError.emptyNumber
        }
        
        // 숫자 여부
        guard Int(number) != nil else {
            print("숫자 아냐")
            throw ValidationError.isNotNumber
        }
        
        // 숫자 범위 벗어남
        guard (Int(number)! < 0) && (Int(number)! > 99) else {
            print("숫자 범위가 안맞아")
            throw ValidationError.isOverNumber
        }
        
        return true
    }
    
    
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        
        changeTalk()
        
        guard let num = riceInputTextField.text else { return }
        
        do {
            let result = try valiNumberInputError(number: num)
        } catch {
            print("ERROR")
        }
        
        if riceInputTextField.text != "" {
            riceInputNum = Double(num) ?? 100
            riceInputTextField.text = ""
        } else {
            riceInputNum = 1
        }
        
        if riceInputNum > 99 {
            riceInputNum = 0
        }
        // 1. UserDefault에 탭한 값을 더해 저장한다.
        // riceTotal = defaults.double(forKey: Food.rice.count) + riceInputNum
        riceTotal = UserDefaultsHelper.standard.ricecount + riceInputNum
        
        // 2. 다시 UserDefault에 저장
        // defaults.set(riceTotal, forKey: Food.rice.count)
        UserDefaultsHelper.standard.ricecount = riceTotal
        
        stateChange()
        
//        changeTalk()
//
//        guard let count = riceInputTextField.text else {
//            return
//        }
//
//        if riceInputTextField.text != "" {
//            riceInputNum = Double(count) ?? 100
//            riceInputTextField.text = ""
//        } else {
//            riceInputNum = 1
//        }
//
//        if riceInputNum > 99 {
//            riceInputNum = 0
//        }
//        // 1. UserDefault에 탭한 값을 더해 저장한다.
//        // riceTotal = defaults.double(forKey: Food.rice.count) + riceInputNum
//        riceTotal = UserDefaultsHelper.standard.ricecount + riceInputNum
//
//        // 2. 다시 UserDefault에 저장
//        // defaults.set(riceTotal, forKey: Food.rice.count)
//        UserDefaultsHelper.standard.ricecount = riceTotal
//
//
//        stateChange()
    }
    
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        
        changeTalk()
        
        guard let count = waterInputTextField.text else { return }
        
        do {
            let result = try valiNumberInputError(number: count)
        } catch {
            print("ERROR")
        }
        
        if waterInputTextField.text != ""   {
            waterInputNum = Double(count) ?? 50
            waterInputTextField.text = ""
        } else {
            waterInputNum = 1
        }
        
        if waterInputNum > 49 {
            waterInputNum = 0
        }
        
        // 1. UserDefault에 탭한 값을 더해 저장한다.
        // waterTotal = defaults.double(forKey: Food.water.count) + waterInputNum
        waterTotal = UserDefaultsHelper.standard.watercount + waterInputNum
        
        // 2. 다시 UserDefault에 저장
        // defaults.set(waterTotal, forKey: Food.water.count)
        UserDefaultsHelper.standard.watercount = waterTotal
        
        stateChange()
    }
    
    
    
    @IBAction func settingBarButttonItemClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SettingViewController.reuseIdentifier) as? SettingViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    // 레벨, 밥알, 물방울, 레벨별 이미지 변경
    func stateChange() {

        riceTotal = UserDefaultsHelper.standard.ricecount
        waterTotal = UserDefaultsHelper.standard.watercount
        
        if UserDefaultsHelper.standard.tamagotchiname == Tamagotchi.green.rawValue {
            growImageContent1 = Tamagotchi.green.appearance1
            growImageContent2 = Tamagotchi.green.appearance2
            growImageContent3 = Tamagotchi.green.appearance3
            growImageContent4 = Tamagotchi.green.appearance4
            growImageContent5 = Tamagotchi.green.appearance5
            growImageContent6 = Tamagotchi.green.appearance6
            growImageContent7 = Tamagotchi.green.appearance7
            growImageContent8 = Tamagotchi.green.appearance8
            growImageContent9 = Tamagotchi.green.appearance9
        } else if UserDefaultsHelper.standard.tamagotchiname == Tamagotchi.orange.rawValue {
            growImageContent1 = Tamagotchi.orange.appearance1
            growImageContent2 = Tamagotchi.orange.appearance2
            growImageContent3 = Tamagotchi.orange.appearance3
            growImageContent4 = Tamagotchi.orange.appearance4
            growImageContent5 = Tamagotchi.orange.appearance5
            growImageContent6 = Tamagotchi.orange.appearance6
            growImageContent7 = Tamagotchi.orange.appearance7
            growImageContent8 = Tamagotchi.orange.appearance8
            growImageContent9 = Tamagotchi.orange.appearance9
        } else if UserDefaultsHelper.standard.tamagotchiname == Tamagotchi.pink.rawValue {
            growImageContent1 = Tamagotchi.pink.appearance1
            growImageContent2 = Tamagotchi.pink.appearance2
            growImageContent3 = Tamagotchi.pink.appearance3
            growImageContent4 = Tamagotchi.pink.appearance4
            growImageContent5 = Tamagotchi.pink.appearance5
            growImageContent6 = Tamagotchi.pink.appearance6
            growImageContent7 = Tamagotchi.pink.appearance7
            growImageContent8 = Tamagotchi.pink.appearance8
            growImageContent9 = Tamagotchi.pink.appearance9
        }
        
        
        switch levelCalc() {
        case 1:
            TamagotchiImageView.image = UIImage(named: growImageContent1 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 2:
            TamagotchiImageView.image = UIImage(named: growImageContent2 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 3:
            TamagotchiImageView.image = UIImage(named: growImageContent3 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 4:
            TamagotchiImageView.image = UIImage(named: growImageContent4 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 5:
            TamagotchiImageView.image = UIImage(named: growImageContent5 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 6:
            TamagotchiImageView.image = UIImage(named: growImageContent6 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 7:
            TamagotchiImageView.image = UIImage(named: growImageContent7 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 8:
            TamagotchiImageView.image = UIImage(named: growImageContent8 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        case 9:
            TamagotchiImageView.image = UIImage(named: growImageContent9 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        default:
            TamagotchiImageView.image = UIImage(named: growImageContent9 ?? "noImage")
            TamagotchiStateLabel.text = "LV\(levelCalc())﹒밥알 \(riceTotal)개﹒물방울 \(waterTotal)개"
        }
        
    }
    
    // 레벨 리턴
    func levelCalc() -> Int {
        
        level = Int((riceTotal / 5.0) + (waterTotal / 2.0))
        
        switch level {
        case 0..<20:
            level = 1
        case 20..<30:
            level = 2
        case 30..<100:
            level = level/10 + 1
        case 100...:
            level = 10
        default:
            level = 1
        }
        
        return level
    }

    
    // 말풍선 텍스트 변경***
    func changeTalk() {

        TamagotchiTalkTextView.text = [
            "\(UserDefaultsHelper.standard.nickname)님 잠자지 말고 코딩 하셔야죠 ㅎㅎ",
            "\(UserDefaultsHelper.standard.nickname)님 복습하고 잠자시나요??",
            "\(UserDefaultsHelper.standard.nickname)님 현생으로 돌아오세요",
            "코딩은 어렵지 않아요 \(UserDefaultsHelper.standard.nickname)님 복습!!"].randomElement()
    }
    
    
    // 다마고치 첫상태?
    func setData() {
        
        TamagotchiImageView.image = UIImage(named: UserDefaultsHelper.standard.tamagotchiimage)
        TamagotchiNameLabel.text = UserDefaultsHelper.standard.tamagotchiname
        
        riceTotal = UserDefaultsHelper.standard.ricecount
        waterTotal = UserDefaultsHelper.standard.watercount
        
    }

    
    func configureBackView() {
        backView.backgroundColor =  Color.background.UIcolor
        talkBackView.backgroundColor = .clear
    }
    
    
    func configureNavigationBar() {
        
        navigationItem.title = "\(UserDefaultsHelper.standard.nickname)님의 다마고치"
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

