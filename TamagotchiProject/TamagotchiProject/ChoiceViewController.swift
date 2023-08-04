//
//  ViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/4/23.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    var tamagochiInfo: TamagotchiList = TamagotchiList()
    
    @IBOutlet weak var TamagotchiCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TamagotchiCollectionView.delegate = self
        TamagotchiCollectionView.dataSource = self
        
        
        // register
        let nib = UINib(nibName: "TamagotchiCollectionViewCell", bundle: nil)
        TamagotchiCollectionView.register(nib, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.identifier)
        
        
        configureNavigationBar()
        configureTamagotchiCollectionView()
        
        configureFlowLayout()
        
        
        
    }
    
    func configureNavigationBar() {
        navigationItem.title = "다마고치 선택하기"
        navigationController?.navigationBar.backgroundColor = Color.background.UIcolor
    }
    
    func configureTamagotchiCollectionView() {
        TamagotchiCollectionView.backgroundColor = Color.background.UIcolor

    }
    
}

extension ChoiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagochiInfo.tamagotchi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = TamagotchiCollectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.identifier, for: indexPath) as? TamagotchiCollectionViewCell else {
            print("TamagotchiCollectionViewCell로 다운캐스팅 실패")
            return UICollectionViewCell()
        }
        
        cell.TamagotchiImageView.image = UIImage(named: tamagochiInfo.tamagotchi[indexPath.row].appearance)
        cell.TamagotchiNameLabel.text = tamagochiInfo.tamagotchi[indexPath.row].name
        
        cell.TamagotchiNameLabel.layer.borderColor = Color.bound.CGcolor
        cell.TamagotchiNameLabel.layer.borderWidth = 1
        cell.TamagotchiNameLabel.layer.cornerRadius = 5
        cell.TamagotchiNameLabel.font = .boldSystemFont(ofSize: 13)
        cell.TamagotchiNameLabel.textColor = Color.font.UIcolor
        
        
        
        return cell
    }
    
    func configureFlowLayout(){
        
        let layout = UICollectionViewFlowLayout()
        // let width = UIScreen.main.bounds.size.width
        let spacing: CGFloat = 20
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: 0, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        TamagotchiCollectionView.collectionViewLayout = layout
        
    }
    
}

