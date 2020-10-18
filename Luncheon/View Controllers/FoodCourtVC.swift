//
//  FoodCourtVC.swift
//  Luncheon
//
//  Created by Arshiya on 1/12/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FoodCourtVC: UIViewController {
    
    private let foodcourtRestaurantsCV:FoodCourtRestaurantsCV = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 56, height: 120)
        layout.minimumLineSpacing = 32
        layout.scrollDirection = .horizontal
        let fcrcv = FoodCourtRestaurantsCV(frame: .zero,collectionViewLayout:layout )
        fcrcv.translatesAutoresizingMaskIntoConstraints = false
        fcrcv.semanticContentAttribute = .forceRightToLeft
        fcrcv.contentMode = .center
        fcrcv.backgroundColor = .whiteBackgroud
        fcrcv.dataSource = fcrcv.self
        fcrcv.delegate = fcrcv.self
        fcrcv.register(FoodCourtRestaurantsCollectionViewCell.self, forCellWithReuseIdentifier: "restauratsName")
        
        return fcrcv
    }()
    
    private let fcrMenutitles:FCRMenuTitleCV = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 56, height: 40)
        layout.scrollDirection = .horizontal
        let fcrmt = FCRMenuTitleCV(frame: .zero, collectionViewLayout: layout)
        fcrmt.translatesAutoresizingMaskIntoConstraints = false
        // for development purpose
        fcrmt.backgroundColor = .whiteBackgroud
        fcrmt.delegate = fcrmt.self
        fcrmt.dataSource = fcrmt.self
        fcrmt.register(FCRMenuTitleCollectionViewCell.self, forCellWithReuseIdentifier: "menuTitle")
        return fcrmt
    }()
    
    private let food:FoodCV = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160 , height: 200)
        //        layout.minimumInteritemSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        let fcv = FoodCV(frame: .zero, collectionViewLayout: layout)
        fcv.translatesAutoresizingMaskIntoConstraints = false
        fcv.semanticContentAttribute = .forceRightToLeft
        fcv.register(FoodCVCell.self, forCellWithReuseIdentifier: "FCRFood")
        return fcv
    }()
    // this variable tracks currentt selected res,menu
    private var currentSelectedItem: (restaurant:Int,menu:Int) = (0,0)
    public var currentRestaurant: Int {
        get {
            currentSelectedItem.restaurant
        }
    }
    public var currentMenu: Int {
        get {
            return currentSelectedItem.menu
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodCourtManager.getRestaurantsOfAFC()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "food tray"), style: .done, target: self, action: #selector(foodTrayTapped(_:)))
        self.navigationItem.leftBarButtonItem?.tintColor = .luncehonLogoText
        
        self.view.addSubview(foodcourtRestaurantsCV)
        setupFoodcourtRestaurantsCV()
        foodcourtRestaurantsCV.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        self.view.addSubview(fcrMenutitles)
        setupFcrMenutitles()
        fcrMenutitles.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        self.view.addSubview(food)
        setupFoodCV()
        
        
    }
    
    
    private func setupFoodcourtRestaurantsCV() {
        debugPrint("class FoodCourtVC->setupFoodcourtRestaurantsCV")
        
        NSLayoutConstraint.activate([
            foodcourtRestaurantsCV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            foodcourtRestaurantsCV.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            foodcourtRestaurantsCV.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            foodcourtRestaurantsCV.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupFcrMenutitles() {
        
        NSLayoutConstraint.activate([
            fcrMenutitles.topAnchor.constraint(equalTo: foodcourtRestaurantsCV.bottomAnchor),
            fcrMenutitles.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            fcrMenutitles.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            fcrMenutitles.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupFoodCV() {
        food.backgroundColor = .whiteBackgroud
        food.dataSource = food.self
        NSLayoutConstraint.activate([
            food.topAnchor.constraint(equalTo: fcrMenutitles.bottomAnchor),
            food.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            food.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            food.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    private func showEmptyFoodTrayAlert(){
        let alert = UIAlertController(title: "خطا", message: "سینی غذا شما خالی است", preferredStyle: .alert)
        let action = UIAlertAction(title:  "متوجه شدم", style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc private func foodTrayTapped(_ sender:UIButton) {
//        debugPrint("foodtray tapped")
        if SampleFoodTray.foodTray.count == 0 {
            debugPrint("empty food tray")
            showEmptyFoodTrayAlert()
            return
        }
        self.view.window?.rootViewController?.present(FoodTrayViewController(), animated: true, completion: nil)
    }
    /// change sele
    /// - Parameter index: index of item
    func changeSeelectedRestaurant(index: Int) {
        //        debugPrint("changeSeelectedRestaurant \(index)")
        currentSelectedItem = (index,0)
        fcrMenutitles.reloadData()
        fcrMenutitles.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .init())
        food.reloadData()
    }
    func changeSeelectedMenu(index: Int) {
//        debugPrint("changeSeelectedMenu \(index)")
        currentSelectedItem.menu = index
        food.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        food.reloadData()
    }
    
}
