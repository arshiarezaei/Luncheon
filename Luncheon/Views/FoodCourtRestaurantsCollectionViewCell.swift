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
        return rl
    }()
    
    private let retaurantNameLabel:UILabel = {
        let rnl = UILabel(frame: .zero)
        rnl.textAlignment = .center
        rnl.font = UIFont.BYekan
        rnl.contentMode = .center
        return rnl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
