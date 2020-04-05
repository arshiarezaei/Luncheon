//
//  FoodCourtVC.swift
//  Luncheon
//
//  Created by Arshiya on 1/12/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FoodCourtVC: UIViewController {
    
    let foodcourtRestaurantsCV:FoodCourtRestaurantsCV = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 40, height: 100)
        layout.scrollDirection = .horizontal
        let fcrcv = FoodCourtRestaurantsCV(frame: .zero,collectionViewLayout:layout )
        fcrcv.translatesAutoresizingMaskIntoConstraints = false
        fcrcv.semanticContentAttribute = .forceRightToLeft
        fcrcv.contentMode = .center
        fcrcv.backgroundColor = .green
        fcrcv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "restauratsName")
        return fcrcv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.getRestaurantsOfaFoodCourt()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "food tray"), style: .done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.tintColor = .luncehonLogoText
        
        self.view.addSubview(foodcourtRestaurantsCV)
        setupFoodcourtRestaurantsCV()
        
        
    }
    
    
    private func setupFoodcourtRestaurantsCV() {
        debugPrint("class FoodCourtVC->setupFoodcourtRestaurantsCV")
        foodcourtRestaurantsCV.dataSource = foodcourtRestaurantsCV.self

        NSLayoutConstraint.activate([
            foodcourtRestaurantsCV.topAnchor.constraint(equalTo: self.view.topAnchor),
            foodcourtRestaurantsCV.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            foodcourtRestaurantsCV.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            foodcourtRestaurantsCV.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor,multiplier: 0.4)
        ])
    }
    
}
