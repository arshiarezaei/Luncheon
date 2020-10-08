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
    let rate:Double
    let price:UInt
    let discountAmount:Float
    let ingredients:[Ingredient]
    let image:UIImage

    
    internal init(id: Int, persianName: String, rate: Double,price: UInt, discountAmount: Float, ingredients: [Ingredient], calorie: Int,image:UIImage) {
        self.id = id
        self.persianName = persianName
        self.rate = rate
        self.price = price
        self.discountAmount = discountAmount
        self.ingredients = ingredients
        self.image = image
    }
}
