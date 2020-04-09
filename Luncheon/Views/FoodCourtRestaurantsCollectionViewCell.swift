//
//  FoodCourtRestaurantsCollectionViewCell.swift
//  Luncheon
//
//  Created by Arshiya on 1/17/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FoodCourtRestaurantsCollectionViewCell: UICollectionViewCell {
    
    private let restaurantLogo:UIImageView = {
        let rl = UIImageView(frame: .zero)
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.image = UIImage(named: "food court")
        rl.image? = (rl.image?.withRenderingMode(.alwaysTemplate))!
//        rl.contentMode = .scaleAspectFit
        rl.tintColor = .luncehonLogoText
        return rl
    }()
    
    private let restaurantNameLabel:UILabel = {
        let rnl = UILabel(frame: .zero)
        rnl.translatesAutoresizingMaskIntoConstraints = false
        rnl.textAlignment = .center
        rnl.font = UIFont.BYekan
        rnl.contentMode = .center
        rnl.text = "اسم رستوران"
        return rnl
    }()
    
    override var isSelected: Bool {
        didSet{
            setNeedsDisplay()
        }
    }

    private let unselecetedModeColor : UIColor = .lightGray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(restaurantLogo)
        setupRestaurantLogo()
        
        addSubview(restaurantNameLabel)
        setupRestaurantNameLabel()
    
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        restaurantNameLabel.textColor = isSelected ? UIColor.luncehonLogoText: self.unselecetedModeColor
        restaurantLogo.tintColor = isSelected ? UIColor.luncehonLogoText : self.unselecetedModeColor

    }
    private func setupRestaurantLogo(){
        
        NSLayoutConstraint.activate([
            restaurantLogo.topAnchor.constraint(equalTo: self.topAnchor,constant: 8 ),
            restaurantLogo.widthAnchor.constraint(equalTo: self.widthAnchor),
            restaurantLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            restaurantLogo.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    private func setupRestaurantNameLabel()  {
        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: restaurantLogo.bottomAnchor, constant: 8),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: restaurantLogo.centerXAnchor),
        ])
    }
    
    func updateContent(fcrestaurantName:String) {
        debugPrint("notif received ")
        self.restaurantNameLabel.text = fcrestaurantName
        
    }
    
}
