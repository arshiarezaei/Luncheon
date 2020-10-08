//
//  Sample FoodTray.swift
//  Luncheon
//
//  Created by arshiya on 10/7/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation


struct SampleFoodTray {
     static var foodTray : [Int:[(foodId:Int,count:Int)]]  = [Int:[(Int,Int)]]()
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
    
    static func updateFoodTray(resId:Int,foodId:Int,count:Int) {
//        if let _ = foodTray[resId]{
//            debugPrint("item exists")
//            var idex:Int = 1
//            for item in foodTray[resId]! {
//                <#code#>
//            }
//        }else{
//            debugPrint("newItem")
//        }
        
//    }
        
        if let a = foodTray[resId]{
            var i = 0
            t :
            for item in a {
                if item.foodId == foodId {
                    debugPrint("if")
                    foodTray[resId]![i].count = count
                    i = 0
                    break t
                }else{
                    debugPrint("\(item.foodId)  \(foodId)")
                    foodTray[resId]!.append((foodId,count))
//                    debugPrint("i")
                    i = 0
                    break t
                }
                
            }
        } else{
            foodTray[resId] = [(foodId,count)]
        }
    }
}
