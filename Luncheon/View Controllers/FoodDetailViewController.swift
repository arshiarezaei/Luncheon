//
//  FoodDetailViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/20/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    private let foodImage:UIImageView = {
        let f = UIImageView(frame: .zero)
        f.translatesAutoresizingMaskIntoConstraints = false
        return f
    }()
    
    private let menuBar:MenuBar = {
        let mb = MenuBar(frame: .zero)
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.register(MenuBarCell.self, forCellWithReuseIdentifier: "menuBarCell")
        
        mb.dataSource = mb.self
        mb.delegate   = mb.self
        
        return mb
    }()
    
    private lazy var foodImageConstraints: [NSLayoutConstraint] = [
        foodImage.topAnchor.constraint(equalTo: self.view.topAnchor),
        foodImage.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        foodImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        foodImage.heightAnchor.constraint(equalToConstant: 400)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(foodImage)
        NSLayoutConstraint.activate(foodImageConstraints)
        
        
        
        
    }
    

    
}
fileprivate class MenuBar:UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
fileprivate class MenuBarCell:UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
