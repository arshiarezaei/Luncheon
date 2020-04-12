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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FCRFood", for: indexPath) as! FoodCVCell
        
        cell.backgroundColor = .green
        
        //just for development purpose
        cell.setupCell(foodName: "اسم غذا", foodDescription: "توضیح غذا", foodPrice: 2000, foodPriceAfterDiscount: 200)
        
        return cell
    }
    
    
}
