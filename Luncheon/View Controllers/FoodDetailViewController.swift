//
//  FoodDetailViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/20/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    private let topBar:UIView = {
        var tb = UIView(frame: .zero)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .white
        
        return tb
    }()
    
    private let foodImage:UIImageView = {
        let f = UIImageView(frame: .zero)
        f.translatesAutoresizingMaskIntoConstraints = false
        f.image = UIImage(named: "sand")
        return f
    }()
    
    
    private let menuBar:MenuBar = {
        let layout = UICollectionViewFlowLayout()
        let w = UIScreen.main.bounds.width/2
        layout.itemSize = CGSize(width: w , height: 41)
        layout.scrollDirection = .horizontal
        let fcrmt = MenuBar(frame: .zero, collectionViewLayout: layout)
        fcrmt.translatesAutoresizingMaskIntoConstraints = false
        fcrmt.isScrollEnabled = false
        // for development purpose
        fcrmt.semanticContentAttribute = .forceRightToLeft
        fcrmt.backgroundColor = .whiteBackgroud
        fcrmt.delegate = fcrmt.self
        fcrmt.dataSource = fcrmt.self
        fcrmt.register(MenuBarCell.self, forCellWithReuseIdentifier: "menuBarCell")
        return fcrmt
    }()
    
    private let rate:RateView  = {
        let r = RateView(frame: .zero)
        r.translatesAutoresizingMaskIntoConstraints = false
        return r
    }()
    
    private let ingredients:FoodIngredients = {
        var i = FoodIngredients(frame: .zero)
        i.translatesAutoresizingMaskIntoConstraints = false
        i.backgroundColor = .white
        i.layer.cornerRadius = 20
        i.layer.borderWidth = 2
        i.layer.borderColor = UIColor.luncheonGray.cgColor
        return i
    }()
    
    private lazy var topBarConstraints: [NSLayoutConstraint] = [
        topBar.topAnchor.constraint(equalTo: self.view.topAnchor),
        topBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        topBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        topBar.heightAnchor.constraint(equalToConstant: 60)
    ]
    
    private lazy var foodImageConstraints: [NSLayoutConstraint] = [
        foodImage.topAnchor.constraint(equalTo: topBar.bottomAnchor),
        foodImage.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        foodImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        foodImage.heightAnchor.constraint(equalToConstant: 155)
    ]
    
    private lazy var menuBarConstraints: [NSLayoutConstraint] = [
        menuBar.topAnchor.constraint(equalTo: foodImage.bottomAnchor),
        menuBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        menuBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        menuBar.heightAnchor.constraint(equalToConstant: 41)
    ]
    
    private lazy var rateConstraints: [NSLayoutConstraint] = [
        rate.topAnchor.constraint(equalTo: foodImage.topAnchor,constant: 16),
        rate.widthAnchor.constraint(equalToConstant: 48),
        rate.leftAnchor.constraint(equalTo: foodImage.leftAnchor,constant: 16),
        rate.heightAnchor.constraint(equalToConstant: 24)
    ]
    
    private lazy var ingredientsConstraints:[NSLayoutConstraint] = [
        ingredients.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 32),
        ingredients.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ingredients.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
        ingredients.heightAnchor.constraint(equalToConstant: 80)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup self.view
        self.view.backgroundColor = .whiteBackgroud
        // setup other subviews
        self.view.addSubview(topBar)
        NSLayoutConstraint.activate(topBarConstraints)
        
        self.view.addSubview(foodImage)
        NSLayoutConstraint.activate(foodImageConstraints)
        
        self.foodImage.addSubview(rate)
        NSLayoutConstraint.activate(rateConstraints)
        rate.setRateNumber(rate: 4.7)
        
        self.view.addSubview(menuBar)
        NSLayoutConstraint.activate(menuBarConstraints)
        
        menuBar.collectionView(self.menuBar, didSelectItemAt: IndexPath(row: 0, section: 0))
    
    }
    
    func setupFoodIngredientsConstraints()  {
        debugPrint("setupFoodIngredientsConstraints")
        
        self.view.addSubview(ingredients)
        NSLayoutConstraint.activate(ingredientsConstraints)
        
    }
    
    func setupFoodCommentsConstraints() {
        debugPrint("setupsetupFoodCommentsConstraints")
        
        ingredients.removeFromSuperview()
    }
    
}
fileprivate class MenuBar:UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    private var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    fileprivate func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuBarCell", for: indexPath) as! MenuBarCell
        cell.backgroundColor = .whiteBackgroud
        if indexPath.item == 0 {
            cell.setupContent(labelText: "جزئیات غذا",numberOfComments: nil )
        }else{
            cell.setupContent(labelText: "نظرات",numberOfComments: 0)
        }
        return cell
    }
    fileprivate func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("MenuBar didselect")
        switch indexPath.item {
        case 0:
            (parentViewController as! FoodDetailViewController).setupFoodIngredientsConstraints()
        case 1 :
            (parentViewController as! FoodDetailViewController).setupFoodCommentsConstraints()
        default:
            fatalError()
        }
        
    }
}
fileprivate class MenuBarCell:UICollectionViewCell {
    
    override var isSelected: Bool {
        willSet{
            newValue ? (self.label.textColor = .luncehonLogoText) : (self.label.textColor = .luncheonGray)
        }
    }
    
    private let label:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont(name: "BYekan+", size: 15)
        l.textAlignment = .center
        l.semanticContentAttribute = .forceRightToLeft
        l.numberOfLines = 1
        l.textColor = .luncheonGray
        l.backgroundColor = .clear
        return l
    }()
    
    private lazy var labelConstraints:[NSLayoutConstraint] = [
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
    ]
    private let numberOfComments:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.cornerRadius = 12
        l.layer.masksToBounds = true
        l.textColor = .black
        l.font = UIFont(name: "BYekan+", size: 15)
        l.textAlignment = .center
        l.semanticContentAttribute = .forceLeftToRight
        l.numberOfLines = 1
        l.textColor = .white
        l.backgroundColor = .luncehonLogoText
        l.text = "۰"
        return l
    }()
    
    private lazy var numberOfCommentsConstraints:[NSLayoutConstraint] = [
        numberOfComments.rightAnchor.constraint(equalTo: label.leftAnchor,constant:-8),
        numberOfComments.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -3),
        numberOfComments.widthAnchor.constraint(equalToConstant: 24 ),
        numberOfComments.heightAnchor.constraint(equalToConstant: 24),
    ]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupContent(labelText:String,numberOfComments:Int!)  {
        label.text = labelText
        guard let  noc = numberOfComments else { return }
        self.addSubview(self.numberOfComments)
        self.numberOfComments.text = Utilities.convertToPersianNumber(number: noc)
        NSLayoutConstraint.activate(numberOfCommentsConstraints)
        
    }
  
}
