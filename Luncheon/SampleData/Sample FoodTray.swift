//
//  Sample FoodTray.swift
//  Luncheon
//
//  Created by arshiya on 10/7/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation


struct SampleFoodTray {
    private static var foodTray : [Int:[(menuId:Int,foodId:Int,count:Int)]]  = [Int:[(Int,Int,Int)]]()
    public static var restaurantsInFoodTray:Int {
        get{
            return self.foodTray.count
        }
    }
   static subscript(index: Int) -> Int {
        get {
            if let count = foodTray[index]?.count {
                return count
            }
            return 0
        }
    }
    
    static func addNewFood(resId:Int,menuId:Int,foodId:Int,count:Int) {
        if let a = foodTray[resId]{
            var i = 0
            for item in a {
                if item.menuId == menuId && item.foodId == foodId {
                    foodTray[resId]![i].count = count
                }else{
                    foodTray[resId]!.append((menuId,foodId,count))
                }
                i += 1
            }
        }
    }
}
