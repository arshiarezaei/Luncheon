//
//  Sample Order.swift
//  Luncheon
//
//  Created by arshiya on 10/26/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

struct SampleOrder {
    
    private let orderStatus:OrderStatus
    private let orderNo:Int
    private let items : [Int:[(foodId:Int,count:Int)]]
    
    public  var OrderPrice:Int{
        get{
            var price:Int  = 0
            items.forEach{
                restaurantId , foods in
                foods.forEach{
                    foodId,count in
                    price += (SampleRestaurantManager.restaurats[restaurantId].food[foodId].price - SampleRestaurantManager.restaurats[restaurantId].food[foodId].discountAmount) * count
                }
            }
            return price
        }
    }
    
    init(status:OrderStatus,orderNo:Int,items:[Int:[(foodId:Int,count:Int)]]) {
        self.orderStatus = status
        self.orderNo = orderNo
        self.items = items
    }
    
    
    subscript(index: Int) -> Int {
        get {
            if let count = items[index]?.count {
                return count
            }
            return 0
        }
    }
 
}

enum OrderStatus {
    case confirmed
    case cocking
    case ready
    case delivered
}
