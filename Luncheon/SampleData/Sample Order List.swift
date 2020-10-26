//
//  Sample Order List.swift
//  Luncheon
//
//  Created by arshiya on 10/26/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

struct SampleOrderList {
    
    static private var orderList:[SampleOrder] = [SampleOrder]()
    static public var countOfOrders:Int{
        get{
            return orderList.count
        }
    }
    static subscript (orderIndex:Int)->SampleOrder {
        return orderList[orderIndex]
    }
    
    static func addOrder(newOrder:SampleOrder){
        orderList.append(newOrder)
    }
}
