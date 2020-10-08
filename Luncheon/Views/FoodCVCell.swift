//
//  FoodCVCell.swift
//  Luncheon
//
//  Created by Arshiya on 1/24/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FoodCVCell: UICollectionViewCell {
    
    private let foodImage:UIImageView = {
        let fi = UIImageView(frame: .zero)
        fi.translatesAutoresizingMaskIntoConstraints = false
        
        return fi
    }()
    
    private let foodRateView:RateView = {
        let rv = RateView(frame: .zero)
        rv.translatesAutoresizingMaskIntoConstraints = false
        rv.alpha = 0.7
        return rv
        
    }()
    
    private let foodNameLabel:UILabel = {
        let fnl = UILabel(frame: .zero)
        fnl.translatesAutoresizingMaskIntoConstraints = false
        fnl.textColor = .black
        fnl.font = UIFont(name: "BYekan+", size: 15)
        fnl.textAlignment = .right
        fnl.semanticContentAttribute = .forceRightToLeft
        fnl.numberOfLines = 1
        return fnl
    }()
    private let foodDescriptionLabel:UILabel = {
        let fdl = UILabel(frame: .zero)
        fdl.translatesAutoresizingMaskIntoConstraints = false
        fdl.textColor = .luncheonGray
        fdl.textAlignment = .right
        fdl.font = UIFont(name: "BYekan+", size: 11)
        fdl.semanticContentAttribute = .forceRightToLeft
        fdl.numberOfLines = 1
        return fdl
    }()
    
    private let foodPriceLabel:UILabel = {
        let fpl = UILabel(frame: .zero)
        fpl.translatesAutoresizingMaskIntoConstraints = false
        fpl.textColor = .luncheonGray
        fpl.font = UIFont(name: "BYekan+", size: 15)
        fpl.textAlignment = .right
        fpl.semanticContentAttribute = .forceLeftToRight
        //        fpl.layer.borderColor = UIColor.black.cgColor
        //        fpl.layer.borderWidth = 2
        return fpl
    }()
    
    private let foodPriceAfterDiscountLabel:UILabel = {
        let fdpl = UILabel(frame: .zero)
        fdpl.translatesAutoresizingMaskIntoConstraints = false
        fdpl.textAlignment = .right
        fdpl.semanticContentAttribute = .forceLeftToRight
        fdpl.font = UIFont(name: "BYekan+", size: 15)
        fdpl.textColor = .luncheonGray
        return fdpl
        
    }()
    
    
    private let plusBuuton:UIButton = {
        let pb = UIButton(frame: .zero)
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.setImage(UIImage(named: "plus"), for: .init())
        pb.imageView?.contentMode = .scaleAspectFill
        return pb
    }()
    
    private let minusButton : UIButton = {
        let mb = UIButton(frame: .zero)
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setImage(UIImage(named: "minus"), for: .init())
        return mb
    }()
    
    private let orderedCountLabel:UILabel = {
        let odl = UILabel(frame: .zero)
        odl.translatesAutoresizingMaskIntoConstraints = false
        odl.font = UIFont(name: "BYekan+", size: 15)
        odl.textAlignment = .center
        odl.semanticContentAttribute = .forceLeftToRight
        odl.textColor = .black
        odl.adjustsFontSizeToFitWidth = true
        odl.numberOfLines = 1
        
        return odl
    }()
    private var orderedCount :Int = 0
    private var discountAmount:Int = 0
    private var foodID:Int = -1
    private lazy var foodPriceLabelInitialLayout:[NSLayoutConstraint] = [
        foodPriceLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodDescriptionLabel.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        foodPriceLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
        foodPriceLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.055, constant: 15)
    ]
    
    
    
    private lazy var plusButtonInitialLayoutSetup:[NSLayoutConstraint] = [
        plusBuuton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        plusBuuton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant:-8),
        //        plusBuuton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.11, constant: 0),
        //        plusBuuton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.09, constant: 0),
        plusBuuton.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 20),
        plusBuuton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 20),
        
    ]
    private lazy var plusButtonLayoutAfterbeingTapped:[NSLayoutConstraint] = [
        plusBuuton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        plusBuuton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: orderedCountLabel.safeAreaLayoutGuide.leadingAnchor, constant:0),
        //        plusBuuton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.11, constant: 0),
        //        plusBuuton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.09, constant: 0),
        plusBuuton.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 20),
        plusBuuton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 20),
    ]
    
    private lazy var minusButtonInitialLayoutSetup:[NSLayoutConstraint] = [
        minusButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        //                minusButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.11, constant: 0),
        //                minusButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),// multiplier: 0.09, constant: 0),
        minusButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 20),
        minusButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 20),
        minusButton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -4)
        
    ]
    private lazy var orderedCountLabelLayout:[NSLayoutConstraint] = [
        orderedCountLabel.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: plusBuuton.safeAreaLayoutGuide.centerYAnchor, constant:-3),
        orderedCountLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 17),
        orderedCountLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: minusButton.safeAreaLayoutGuide.leadingAnchor,constant: 0),
        orderedCountLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: plusBuuton.safeAreaLayoutGuide.trailingAnchor,constant: 0),
        orderedCountLabel.safeAreaLayoutGuide.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)
    ]
    private lazy var foodPriceAfterDiscountInitialLayout:[NSLayoutConstraint] =  [
        foodPriceAfterDiscountLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodDescriptionLabel.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        foodPriceAfterDiscountLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: foodPriceLabel.safeAreaLayoutGuide.trailingAnchor, constant: 4),
        foodPriceAfterDiscountLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,multiplier: 0.055, constant: 15),
    ]
    private lazy var foodPriceAfterDiscountLabelLayoutAfterTappingPlusButton:[NSLayoutConstraint] =  [
        foodPriceAfterDiscountLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodDescriptionLabel.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        foodPriceAfterDiscountLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 4),
        foodPriceAfterDiscountLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,multiplier: 0.055, constant: 15),
    ]
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        
        
        self.addSubview(foodImage)
        setupFoodImage()
        
        self.addSubview(foodRateView)
        setupFoodRateView()
        
        self.addSubview(foodNameLabel)
        setupFoodNameLabel()
        
        self.addSubview(foodDescriptionLabel)
        setupFoodDescriptionLabel()
        
        self.addSubview(foodPriceLabel)
        NSLayoutConstraint.activate(foodPriceLabelInitialLayout)
        //        setupFoodPriceLabel()
        
        self.addSubview(foodPriceAfterDiscountLabel)
        setupfoodPriceAfterDiscountLabel()
        
        self.addSubview(plusBuuton)
        setupPlusButton()
        
        
        
        
        
//        setupCell(foodName: "اسم غذا", foodDescription: "این غذا شامل توضیحات خاصی نمی باشد", foodPrice: 20000, discountAmount: 0, foodRate: 4.2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(foodName:String , foodDescription:String,foodPrice:Int,discountAmount:Int!,foodImage:UIImage=UIImage(named: "food")!,foodRate:Double,foodId:Int) {
        let foodPriceInPersinaNumberFormate :String = Utilities.convertToPersianNumber(number: Double(foodPrice)) + "ت"
        self.foodNameLabel.text = foodName
        self.foodPriceLabel.text = foodPriceInPersinaNumberFormate
        self.foodDescriptionLabel.text = foodDescription
        self.foodImage.image = foodImage
        self.discountAmount = discountAmount
        self.foodID = foodId
        
        if let fpad = discountAmount ,fpad != 0 {
            let fpadInPersianNumberFormat:String = Utilities.convertToPersianNumber(number: Double(fpad))
            self.foodPriceAfterDiscountLabel.text = fpadInPersianNumberFormat + "ت"
            self.foodPriceLabel.text?.removeLast()
            let attributedString = NSMutableAttributedString(string: foodPriceInPersinaNumberFormate)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            foodPriceLabel.font = UIFont(name: "BYekan+", size:11)
            self.foodPriceLabel.attributedText = attributedString
        }
        foodRateView.setRateNumber(rate: foodRate)
        
    }
    
    private func setupFoodRateView() {
        NSLayoutConstraint.activate([
            foodRateView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodImage.safeAreaLayoutGuide.topAnchor, constant: 8),
            foodRateView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            foodRateView.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.31)
        ])
        
        
    }
    
    
    private func setupFoodImage()  {
        NSLayoutConstraint.activate([
            foodImage.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            foodImage.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            foodImage.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            foodImage.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.5),
        ])
    }
    private func setupFoodNameLabel() {
        NSLayoutConstraint.activate([
            foodNameLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodImage.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            foodNameLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            foodNameLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            foodNameLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 10),
            
        ])
    }
    private func setupFoodDescriptionLabel()  {
        NSLayoutConstraint.activate([
            foodDescriptionLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodNameLabel.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            foodDescriptionLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            foodDescriptionLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            foodDescriptionLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06, constant: 12),
        ])
    }
    //    private func setupFoodPriceLabel() {
    //        NSLayoutConstraint.activate([
    //            foodPriceLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodDescriptionLabel.safeAreaLayoutGuide.bottomAnchor,constant: 0),
    //            foodPriceLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
    //            foodPriceLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.055, constant: 15)
    //        ])
    //    }
    private func setupfoodPriceAfterDiscountLabel() {
        NSLayoutConstraint.activate(foodPriceAfterDiscountInitialLayout)
    }
    
    private func setupPlusButton() {
        plusBuuton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate(plusButtonInitialLayoutSetup)
        
    }
    
    private func setupMinusButton()  {
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
    }
    @objc private func plusButtonTapped() {
        debugPrint("plusButton tapped")
        orderedCount += 1
        if discountAmount != 0 {
            foodPriceLabel.removeFromSuperview()
        }
        if orderedCount == 1{
            NSLayoutConstraint.deactivate(plusButtonInitialLayoutSetup)
            self.addSubview(orderedCountLabel)
            self.addSubview(minusButton)
            setupMinusButton()
            NSLayoutConstraint.activate(minusButtonInitialLayoutSetup)
            NSLayoutConstraint.activate(orderedCountLabelLayout)
            NSLayoutConstraint.activate(plusButtonLayoutAfterbeingTapped)
            
            NSLayoutConstraint.deactivate(foodPriceAfterDiscountInitialLayout)
            NSLayoutConstraint.activate(foodPriceAfterDiscountLabelLayoutAfterTappingPlusButton)
            
            
        }
        orderedCountLabel.text = Utilities.convertToPersianNumber(number: orderedCount)
        // update food tray
        let resId = (parentViewController as! FoodCourtVC).currentRestaurant
//        let menuId = (parentViewController as! FoodCourtVC).currentMenu
//        debugPrint("r \(resId)    m \(menuId)  f \(self.foodID) ")
        SampleFoodTray.updateFoodTray(resId: resId, foodId: foodID, count: orderedCount)
        debugPrint(SampleFoodTray.foodTray)
    }
    
    @objc private func minusButtonTapped(){
        debugPrint("minuseButtonTapped")
        orderedCount -= 1
        
        if orderedCount>0{
            orderedCountLabel.text = Utilities.convertToPersianNumber(number: orderedCount)
        }
        else if orderedCount==0{
            minusButton.removeFromSuperview()
            orderedCountLabel.removeFromSuperview()
            NSLayoutConstraint.deactivate(plusButtonLayoutAfterbeingTapped)
            NSLayoutConstraint.activate(plusButtonInitialLayoutSetup)
            NSLayoutConstraint.deactivate(foodPriceAfterDiscountLabelLayoutAfterTappingPlusButton)
            self.addSubview(foodPriceLabel)
            NSLayoutConstraint.activate(foodPriceLabelInitialLayout)
            NSLayoutConstraint.activate(foodPriceAfterDiscountInitialLayout)
        }
        let resId = (parentViewController as! FoodCourtVC).currentRestaurant
//        let menuId = (parentViewController as! FoodCourtVC).currentMenu
        SampleFoodTray.updateFoodTray(resId: resId, foodId: foodID, count: orderedCount)
        debugPrint(SampleFoodTray.foodTray)
    }
}
