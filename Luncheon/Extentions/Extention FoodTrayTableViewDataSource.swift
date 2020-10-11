//
//  Extention FoodTrayTableViewDataSource.swift
//  Luncheon
//
//  Created by arshiya on 10/7/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit


extension FoodTrayTableView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("FoodTrayTableViewDataSourcee numberOfRowsInSection")
        return SampleFoodTray.foodTray[index]!.count
//        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        debugPrint("FoodTrayTableViewDataSourcee cellforRowAt")
        let c = FoodTrayTableViewCell()
        let foodId = SampleFoodTray.foodTray[index]![indexPath.item].foodId
        let foodName = SampleRestaurantManager.restaurats[index].food[foodId].persianName
        let price = SampleRestaurantManager.restaurats[index].food[foodId].price
        let count = SampleFoodTray.foodTray[index]![indexPath.item].count
        let discount = SampleRestaurantManager.restaurats[index].food[foodId].discountAmount
        let finalPrice =  price - discount
        c.setupCellContent(foodName: foodName, foodPrice:finalPrice , count: count)
//        c.textLabel?.text = "food \(indexPath.row)"
        return c as UITableViewCell
    }
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        debugPrint("FoodTrayTableViewDataSourcee dequeueReusableCell")
        let c = UITableViewCell()
        c.textLabel?.text = "food \(indexPath.row)"
        return c
    }
}
