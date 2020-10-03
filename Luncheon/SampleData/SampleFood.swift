//
//  SampleFood.swift
//  Luncheon
//
//  Created by arshiya on 10/3/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit


struct SampleFood {
    
    let id:Int
    let persianName:String
    let rate:UInt8
    let price:UInt
    let discountAmount:Float
    let ingredients:[Ingredient]

    
    internal init(id: Int, persianName: String, rate: UInt8,price: UInt, discountAmount: Float, ingredients: [Ingredient], calorie: Int) {
        self.id = id
        self.persianName = persianName
        self.rate = rate
        self.price = price
        self.discountAmount = discountAmount
        self.ingredients = ingredients
    }
}
