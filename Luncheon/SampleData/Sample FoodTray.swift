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
    public static var OrderPrice:Int{
        get{
            var price:Int  = 0
            foodTray.forEach{
                restaurantId , foods in
                foods.forEach{
                    foodId,count in
                    price += (SampleRestaurantManager.restaurats[restaurantId].food[foodId].price - SampleRestaurantManager.restaurats[restaurantId].food[foodId].discountAmount) * count
                }
            }
//            debugPrint(price)
            return price
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
                    if foodTray[resId]!.isEmpty {
//                        debugPrint("empty")
                        foodTray.removeValue(forKey: resId)
//                        debugPrint(foodTray)
                    }
                }else{
                    foodTray[resId]![index].count = count
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
    
    static func  getNumberOfFoods(resID:Int,foodId:Int) -> Int {
        guard let foods = foodTray[resID] else {return 0}
        for (fId,count) in foods {
            if fId == foodId {
                return count
            }
        }
        return 0
    }
}
