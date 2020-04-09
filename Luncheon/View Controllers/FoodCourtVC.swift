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
        layout.itemSize = CGSize(width: 56, height: 120)
        layout.minimumLineSpacing = 32
        layout.scrollDirection = .horizontal
        let fcrcv = FoodCourtRestaurantsCV(frame: .zero,collectionViewLayout:layout )
        fcrcv.translatesAutoresizingMaskIntoConstraints = false
        fcrcv.semanticContentAttribute = .forceRightToLeft
        fcrcv.contentMode = .center
        fcrcv.backgroundColor = .whiteBackgroud
        fcrcv.register(FoodCourtRestaurantsCollectionViewCell.self, forCellWithReuseIdentifier: "restauratsName")
        
        return fcrcv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodCourtManager.getRestaurantsOfAFC()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "food tray"), style: .done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.tintColor = .luncehonLogoText
        
        self.view.addSubview(foodcourtRestaurantsCV)
        setupFoodcourtRestaurantsCV()
    
        foodcourtRestaurantsCV.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    private func setupFoodcourtRestaurantsCV() {
        debugPrint("class FoodCourtVC->setupFoodcourtRestaurantsCV")
        foodcourtRestaurantsCV.dataSource = foodcourtRestaurantsCV.self

        NSLayoutConstraint.activate([
            foodcourtRestaurantsCV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            foodcourtRestaurantsCV.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            foodcourtRestaurantsCV.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            foodcourtRestaurantsCV.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
