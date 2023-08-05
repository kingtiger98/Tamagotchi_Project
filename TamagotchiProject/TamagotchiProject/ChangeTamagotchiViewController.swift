//
//  ChangeTamagotchiViewController.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/5/23.
//

import UIKit

class ChangeTamagotchiViewController: UIViewController {

    var changetamagochiInfo: TamagotchiList = TamagotchiList()

    @IBOutlet weak var changeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeCollectionView.delegate = self
        changeCollectionView.dataSource = self
        
        // register
        let nib = UINib(nibName: "ChangeTamagotchiCollectionViewCell", bundle: nil)
        changeCollectionView.register(nib, forCellWithReuseIdentifier: ChangeTamagotchiCollectionViewCell.identifier)
        
        configureNavigationBar()
        configureTamagotchiCollectionView()
        
        configureFlowLayout()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "다마고치 선택하기"
        navigationController?.navigationBar.backgroundColor = Color.background.UIcolor
    }
    
    func configureTamagotchiCollectionView() {
        changeCollectionView.backgroundColor = Color.background.UIcolor

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
        
        changeCollectionView.collectionViewLayout = layout
        
    }
    


}


extension ChangeTamagotchiViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return changetamagochiInfo.tamagotchi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row: TamagotchiState = changetamagochiInfo.tamagotchi[indexPath.row]
        
        guard let cell = changeCollectionView.dequeueReusableCell(withReuseIdentifier: ChangeTamagotchiCollectionViewCell.identifier, for: indexPath) as? ChangeTamagotchiCollectionViewCell else {
            print("ChangeTamagotchiCollectionViewCell로 다운캐스팅 실패")
            return UICollectionViewCell()
        }

        cell.configureCell(row: row)
        return cell
    }
    
    
    
    
}
