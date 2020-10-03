//
//  Ingredient.swift
//  Luncheon
//
//  Created by Arshiya on 1/17/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation

struct Ingredient {

    private let id:String
    private let name:String
    private let price:UInt
    private let value:UInt8
    private let defaultValue:UInt8
    private let minValue:UInt8
    private let maxValue:UInt8
    private let calorie:UInt8
    
    internal init(id: String, name: String, price: UInt, value: UInt8, defaultValue: UInt8, minValue: UInt8, maxValue: UInt8, calorie: UInt8) {
        self.id = id
        self.name = name
        self.price = price
        self.value = value
        self.defaultValue = defaultValue
        self.minValue = minValue
        self.maxValue = maxValue
        self.calorie = calorie
    }
    
    
}
