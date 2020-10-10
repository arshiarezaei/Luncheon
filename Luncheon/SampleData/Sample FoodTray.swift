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
//        debugPrint("****")
//        debugPrint(foodTray)
        guard let orderedFoods = foodTray[resId] else { return foodTray[resId] = [(foodId,count)]}
//        debugPrint("for")
        for (index,_) in orderedFoods.enumerated(){
//            debugPrint("inside for")
            if foodTray[resId]![index].foodId == foodId{
//                debugPrint(" \(index)  \(foodTray[resId]![index].foodId)  \(foodId)")
                if count == 0 {
                    foodTray[resId]!.remove(at: index)
                }else{
                    foodTray[resId]![index].count = count
//                    debugPrint(foodTray[resId]![index])
//                    debugPrint("-----")
                }
 
                return
            }
        }
//        debugPrint("not exists")
        foodTray[resId]!.append((foodId,count))
//        debugPrint(foodTray)
//        debugPrint("-----")
//        debugPrint("****")
        //        debugPrint("-------")
        ////               debugPrint(res)
        //        debugPrint("----")
        //        debugPrint("----")
    }
    
}
