//
//  Food.swift
//  Luncheon
//
//  Created by Arshiya on 1/16/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation

struct Food {
    
    private let id:String
    private let name:String
    private let persianName:String
    private let rate:UInt8
    private let menuId:UInt
    private let basePrice:UInt
    private let price:UInt
    private let discountPercent:Float
    private let discountAmount:Float
    private let ingredients:[Ingredient]
    private let calorie:Int
    
    internal init(id: String, name: String, persianName: String, rate: UInt8, menuId: UInt, basePrice: UInt, price: UInt, discountPercent: Float, discountAmount: Float, ingredients: [Ingredient], calorie: Int) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.rate = rate
        self.menuId = menuId
        self.basePrice = basePrice
        self.price = price
        self.discountPercent = discountPercent
        self.discountAmount = discountAmount
        self.ingredients = ingredients
        self.calorie = calorie
    }
}
