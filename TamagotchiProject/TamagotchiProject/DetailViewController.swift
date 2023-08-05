//
//  DetailViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageContent1: String? // 1렙사진
    var imageContent2: String? // 2렙사진
    var imageContent3: String? // 3렙사진
    var imageContent4: String? // 4렙사진
    var imageContent5: String? // 5렙사진
    var imageContent6: String? // 6렙사진 _ 다마고치 선택화면
    var imageContent7: String? // 7렙사진
    var imageContent8: String? // 8렙사진
    var imageContent9: String? // 9렙사진

    
    
    
    
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
        
        setData()
        
        configureView()
        configureButton()
        configuerTamagochiNameLabel()
        configureTamagotchiIntroduce()
    }
    
    @IBAction func cancleButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // GrowViewController로 값전달
    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "GrowViewController") as? GrowViewController else {
            print("GrowViewController로 다운캐스팅 실패")
            return
        }
                
        vc.imageContent1 = imageContent1
        vc.imageContent2 = imageContent2
        vc.imageContent3 = imageContent3
        vc.imageContent4 = imageContent4
        vc.imageContent5 = imageContent5
        vc.imageContent6 = imageContent6
        vc.imageContent7 = imageContent7
        vc.imageContent8 = imageContent8
        vc.imageContent9 = imageContent9
        
        vc.nameContents = nameContens
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: false)
    }
    
    func configureCell(row: TamagotchiState) {
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
    
    func configureButton() {
        cancleButton.setTitle("취소", for: .normal)
        startButton.setTitle("시작하기", for: .normal)

        cancleButton.setTitleColor(.lightGray, for: .highlighted)
        startButton.setTitleColor(.lightGray, for: .highlighted)

        cancleButton.tintColor = Color.font.UIcolor
        startButton.tintColor = Color.font.UIcolor

        cancleButton.backgroundColor = .systemGray6
        startButton.backgroundColor = Color.background.UIcolor

        
        //cancleButton.layer.addBorder(edge: .top, color: Color.font.UIcolor, thickness: 0.5)
        cancleButton.layer.borderWidth = 0.5
        cancleButton.layer.borderColor = Color.bound.CGcolor

        //startButton.layer.addBorder(edge: .top, color: Color.font.UIcolor, thickness: 0.5)
        startButton.layer.borderWidth = 0.5
        startButton.layer.borderColor = Color.bound.CGcolor
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
