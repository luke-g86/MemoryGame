//
//  CollectionViewCell.swift
//  MemoryGame
//
//  Created by Lukasz on 07/07/2019.
//  Copyright © 2019 Lukasz. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let maxWidth = UIScreen.main.bounds.width
    let maxHeight = UIScreen.main.bounds.height
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
          view.layer.cornerRadius = 5
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.clipsToBounds = true
        return view
    }()

    
    lazy var cellLayer: CALayer = {
        let transition = UIView.AnimationOptions.transitionFlipFromLeft
        let layer = CALayer()
        
        
        return layer
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "card"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        
        return image
    }()
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                self.layer.zPosition = self.isSelected ? 1 : -1
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.4, y: 1.4) : CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        definieLayerLayout()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        cellView.addSubview(imageView)
        addSubview(cellView)
        
    
        cellView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func definieLayerLayout() {
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 5
        
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false
    }
    
}
