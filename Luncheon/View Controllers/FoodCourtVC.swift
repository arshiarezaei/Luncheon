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
    
    let fcrMenutitles:FCRMenuTitleCV = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 56, height: 40)
        layout.scrollDirection = .horizontal
        let fcrmt = FCRMenuTitleCV(frame: .zero, collectionViewLayout: layout)
        fcrmt.translatesAutoresizingMaskIntoConstraints = false
        // for development purpose
        fcrmt.backgroundColor = .whiteBackgroud
        fcrmt.register(FCRMenuTitleCollectionViewCell.self, forCellWithReuseIdentifier: "menuTitle")
        return fcrmt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodCourtManager.getRestaurantsOfAFC()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "food tray"), style: .done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.tintColor = .luncehonLogoText
        
        self.view.addSubview(foodcourtRestaurantsCV)
        setupFoodcourtRestaurantsCV()
        foodcourtRestaurantsCV.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        self.view.addSubview(fcrMenutitles)
        setupFcrMenutitles()
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
    
    private func setupFcrMenutitles() {
        fcrMenutitles.dataSource = fcrMenutitles.self
        NSLayoutConstraint.activate([
            fcrMenutitles.topAnchor.constraint(equalTo: foodcourtRestaurantsCV.bottomAnchor),
            fcrMenutitles.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            fcrMenutitles.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            fcrMenutitles.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
