//
//  ViewController.swift
//  MemoryGame
//
//  Created by Lukasz on 07/07/2019.
//  Copyright © 2019 Lukasz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let cellID = "CollectionViewCell"
    lazy var game = Engine(numberOfCardsPairs: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupCollectionView()
        
    }
    
    func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 14, left: 20, bottom: 14, right: 20)
        layout.itemSize = CGSize(width: 80, height: 120)
        
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 14
        layout.scrollDirection = .horizontal
        
        let myCollectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        myCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myCollectionView.isScrollEnabled = true
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.allowsMultipleSelection = true
        myCollectionView.reloadData()
        
        view.addSubview(myCollectionView)
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        let title = UILabel(frame: CGRect.init(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height))
        title.text = String(describing: game.cards[indexPath.row].cardId)
        cell.contentView.addSubview(title)
        
        return cell
    }
    
    

    
}




