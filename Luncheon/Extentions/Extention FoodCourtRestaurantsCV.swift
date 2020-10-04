//
//  Extention FoodCourtRestaurantsCV.swift
//  Luncheon
//
//  Created by Arshiya on 1/17/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

extension FoodCourtRestaurantsCV:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return FoodCourtManager.countOfRestaurants
        return SampleRestaurantManager.restaurats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restauratsName", for: indexPath) as! FoodCourtRestaurantsCollectionViewCell
        // sample data 
        cell.updateContent(fcrestaurantName:SampleRestaurantManager.restaurats[indexPath.item].persianName,fCRestaurantLogo: SampleRestaurantManager.restaurats[indexPath.item].logo)
        
        // real data
        //        cell.backgroundColor = .red
        //        debugPrint("indexPath \(indexPath.item) section \(indexPath.section) count \(FoodCourtManager.countOfRestaurants)")
        //        if indexPath.item <= (FoodCourtManager.countOfRestaurants-1) && indexPath.section == 0{
        //            debugPrint("if")
        //            if let name = FoodCourtManager.getARestaurant(index: indexPath.item)?._persianName {
        //                cell.updateContent(fcrestaurantName: name)
        //            }
        //        }else{
        //            cell.updateContent(fcrestaurantName: "اسم رستوران")
        //        }
        return cell
    }
    
}
