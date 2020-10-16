//
//  Sample Order.swift
//  Luncheon
//
//  Created by arshiya on 10/16/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

struct SampleOrder {
    public static var orderInProcessing:Bool = false {
        didSet{
        }
        willSet{
            if newValue == true {
                debugPrint("fire Timer")
            }
        }
    }
    public static let timeToCock:Int = 15
    static private var OrderNo:Int = 0
    static var getOrderNo:Int {
        get{
            return OrderNo
        }
    }
    static func generateOrderNo()->Int{
        self.OrderNo = Int.random(in: 10000..<100000)
        return OrderNo
    }
}
