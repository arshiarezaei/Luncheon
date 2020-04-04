//
//  FCRestaurant.swift
//  Luncheon
//
//  Created by Arshiya on 1/15/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation

struct FCRestaurant {

    private let id:String
    private let name:String
    private let persianName:String
    private let rate:UInt8?
    private let rateCount:Int
    private let menus:[Menu]
    private let state = "ACTIVE"
    
    internal init(id: String, name: String, persianName: String, rate: UInt8?, rateCount: Int, menus: [Menu]) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.rate = rate
        self.rateCount = rateCount
        self.menus = menus
    }
    
}
