//
//  Extention FCRMenuTitleCVDataSource.swift
//  Luncheon
//
//  Created by Arshiya on 1/23/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

extension FCRMenuTitleCV:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let m:Int = (parentViewController as! FoodCourtVC).currentRestaurant
//        debugPrint(" \(m)")
        return SampleRestaurantManager.restaurats[m].menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuTitle", for: indexPath) as! FCRMenuTitleCollectionViewCell
        let m:Int = (parentViewController as! FoodCourtVC).currentRestaurant
    cell.setupContent(menuTitle: SampleRestaurantManager.restaurats[m].menus[indexPath.item].persianName)
        cell.backgroundColor = .whiteBackgroud
        return cell
    }
    
    
}
