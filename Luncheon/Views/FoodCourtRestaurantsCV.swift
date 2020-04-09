//
//  FoodCourtRestaurantsCV.swift
//  Luncheon
//
//  Created by Arshiya on 1/17/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FoodCourtRestaurantsCV: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        NotificationCenter.default.addObserver(self, selector: #selector(updateContent(notif:)) , name: .updateFCRestaurantsNameCell, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func updateContent(notif:Notification) {
        let index:Int = (notif.object as! [String:Any])["index"] as! Int
        let indPath = IndexPath(item: index, section: 0)
        let fcRestName = FoodCourtManager.getARestaurant(index: index)!._persianName
        (self.cellForItem(at: indPath) as! FoodCourtRestaurantsCollectionViewCell).updateContent(fcrestaurantName: fcRestName)
    }
    
}
