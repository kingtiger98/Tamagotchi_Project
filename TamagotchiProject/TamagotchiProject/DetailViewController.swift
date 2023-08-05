//
//  DetailViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var imageContens: String?
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
    
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "GrowViewController") as? GrowViewController else {
            print("GrowViewController로 다운캐스팅 실패")
            return
        }
                
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: false)
    }
    
    func configureCell(row: TamagotchiState) {
        imageContens = row.appearance
        nameContens = row.name
        introduceContents = row.introduce
    }
    
    
    func setData() {
        
        guard let image = imageContens, let name = nameContens, let introduce = introduceContents else {
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

        
        cancleButton.layer.addBorder(edge: .top, color: Color.font.UIcolor, thickness: 0.5)
        cancleButton.layer.borderColor = Color.font.CGcolor

        startButton.layer.addBorder(edge: .top, color: Color.font.UIcolor, thickness: 0.5)
        startButton.layer.borderColor = Color.font.CGcolor
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
