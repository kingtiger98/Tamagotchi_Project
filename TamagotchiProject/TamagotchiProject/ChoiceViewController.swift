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
        TamagotchiCollectionView.register(nib, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.reuseIdentifier)
        
        
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
        
        let row: TamagotchiState = tamagochiInfo.tamagotchi[indexPath.row]
        
        guard let cell = TamagotchiCollectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.reuseIdentifier, for: indexPath) as? TamagotchiCollectionViewCell else {
            print("TamagotchiCollectionViewCell로 다운캐스팅 실패")
            return UICollectionViewCell()
        }

        cell.configureTamagotchiLsit(row: row)
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let row: TamagotchiState = tamagochiInfo.tamagotchi[indexPath.row]
        
        // 준비중인 다마고치 선택시 실행
        if row.name == "준비중이에요" {
            let alert = UIAlertController(title: "다른 다마고치를 선택해주세요!", message: "준비중인 다마고치입니다.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "돌아가기", style: .default)
            alert.addAction(ok)
            
            present(alert, animated: true)
        }
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.reuseIdentifier) as? DetailViewController else {
            print("DetailViewController로 다운캐스팅 실패")
            return
        }
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        
        vc.configureTamagotchiCollectionViewCell(row: row)

        present(vc, animated: true)
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

