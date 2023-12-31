//
//  DetailViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    var imageContent1: String? // 1렙사진
    var imageContent2: String? // 2렙사진
    var imageContent3: String? // 3렙사진
    var imageContent4: String? // 4렙사진
    var imageContent5: String? // 5렙사진
    var imageContent6: String? // 6렙사진 _ 다마고치 선택화면
    var imageContent7: String? // 7렙사진
    var imageContent8: String? // 8렙사진
    var imageContent9: String? // 9렙사진
    
    // 선택한 다마고치의 데이터를 전달받을 변수
    var nameContens: String?
    var introduceContents: String?
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var DetailBackView: UIView!
    
    @IBOutlet weak var TamagotchiImageView: UIImageView!
    @IBOutlet weak var TamagotchiNameLabel: UILabel!
    @IBOutlet weak var TamagotchiIntroduceTextView: UITextView!
    
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 디폴트 이름 "대장" 지정***
        //UserDefaults.standard.set("대장", forKey: "nickName")
        UserDefaultsHelper.standard.nickname = "대장" // 싱글톤!***
        
        setData()
        
        configureView()
        //configureButton()
        configureButtons()
        configuerTamagochiNameLabel()
        configureTamagotchiIntroduce()
    }
    

    
    @IBAction func cancleButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    
    }
    
    // GrowViewController로 값전달***
    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        //UserDefaults.standard.set(true, forKey: "isFirstLaunch")
        UserDefaultsHelper.standard.applanch = true // 싱글톤
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: GrowViewController.reuseIdentifier) as? GrowViewController else {
            print("GrowViewController로 다운캐스팅 실패")
            return
        }
     
        // UserDefaults.standard.set(imageContent1, forKey: "TamagotchiImage")
        // UserDefaults.standard.set(nameContens, forKey: "TamagotchiName")

        // 위 2줄 싱글톤으로 ***
        guard let image = imageContent1, let name = nameContens else { return }
        UserDefaultsHelper.standard.tamagotchiimage = image
        UserDefaultsHelper.standard.tamagotchiname = name

        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: false)
    }
    
    func configureTamagotchiCollectionViewCell(row: TamagotchiState) {
        imageContent1 = row.levelOneAppearance
        imageContent2 = row.levelTwoAppearance
        imageContent3 = row.levelThreeAppearance
        imageContent4 = row.levelFourAppearance
        imageContent5 = row.levelFiveAppearance
        imageContent6 = row.levelSixAppearance
        imageContent7 = row.levelSevenAppearance
        imageContent8 = row.levelEightAppearance
        imageContent9 = row.levelNineAppearance

        nameContens = row.name
        introduceContents = row.introduce
        
        imageContent1 = row.levelOneAppearance
    }
    
    
    func setData() {
        
        guard let image = imageContent6, let name = nameContens, let introduce = introduceContents else {
            print("값을 못가져왔어요!")
            return
        }
        
        TamagotchiImageView.image = UIImage(named: "\(image)")
        TamagotchiNameLabel.text = name
        TamagotchiIntroduceTextView.text = introduce
    }
    
    
    func configureView() {
        // 배경뷰 불투명하게
        backView.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha: 0.3)
        DetailBackView.backgroundColor =  Color.background.UIcolor
        DetailBackView.layer.cornerRadius = 5
        DetailBackView.layer.masksToBounds = true
    }
    
    func configureButton(_ button: UIButton, title: String, backgroundColor: UIColor, highlightedColor: UIColor, tintColor: UIColor, borderColor: CGColor) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(.lightGray, for: .highlighted)
        button.tintColor = tintColor
        button.layer.borderWidth = 0.5
        button.layer.borderColor = borderColor
    }
    func configureButtons() {
        configureButton(cancleButton, title: "취소", backgroundColor: .systemGray6, highlightedColor: .lightGray, tintColor: Color.font.UIcolor, borderColor: Color.bound.CGcolor)
        configureButton(startButton, title: "시작하기", backgroundColor: Color.background.UIcolor, highlightedColor: .lightGray, tintColor: Color.font.UIcolor, borderColor: Color.bound.CGcolor)
    }

    func configuerTamagochiNameLabel() {
        
        TamagotchiNameLabel.font = .boldSystemFont(ofSize: 15)
        TamagotchiNameLabel.textColor = Color.font.UIcolor
        
        TamagotchiNameLabel.layer.borderWidth = 0.7
        TamagotchiNameLabel.layer.borderColor = Color.bound.CGcolor
        TamagotchiNameLabel.layer.cornerRadius = 5
        
    }
    
    func configureTamagotchiIntroduce() {
        TamagotchiIntroduceTextView.textColor = Color.font.UIcolor
    }
    
    

}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        border.backgroundColor = color.cgColor
        addSublayer(border)
    }
}
