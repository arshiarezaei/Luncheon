//
//  Extention FoodCVDatasource.swift
//  Luncheon
//
//  Created by Arshiya on 1/24/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit


extension FoodCV:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let r:Int = (parentViewController as! FoodCourtVC).currentRestaurant
        let m  = (parentViewController as! FoodCourtVC).currentMenu
//        debugPrint(m)
        let  c = SampleRestaurantManager.restaurats[r].menus[m].foods.count 
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FCRFood", for: indexPath) as! FoodCVCell
        //just for development purpose
//        cell.setupCell(foodName: "اسم غذا", foodDescription: "توضیح غذا", foodPrice: 2000, foodPriceAfterDiscount: 200, foodRate: 4.6)
        let m:Int = (parentViewController as! FoodCourtVC).currentMenu
        let r:Int = (parentViewController as! FoodCourtVC).currentRestaurant
        let sampleFood:SampleFood = SampleRestaurantManager.restaurats[r].menus[m].foods[indexPath.item]
        let foodId:Int = SampleRestaurantManager.restaurats[r].menus[m].foods[indexPath.item].id
//        debugPrint("cell")
        cell.setupCell(foodName: sampleFood.persianName, foodDescription: "توضیح غذا", foodPrice: Int(sampleFood.price) ,discountAmount:sampleFood.discountAmount, foodImage: sampleFood.image,foodRate:sampleFood.rate,foodId:foodId)
        
        return cell
    }
    
    
}
