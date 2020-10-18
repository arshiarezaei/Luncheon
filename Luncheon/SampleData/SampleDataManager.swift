//
//  SampleDataManager.swift
//  Luncheon
//
//  Created by arshiya on 10/3/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import  UIKit

struct SampleRestaurantManager {
    public static let restaurats : [SampleRestaurant] = [
        SampleRestaurant(id: 1, persianName: "مک دونالد", rate: 4.8, logo: UIImage(named: "Mc donald")!, menus:mcdonaldMenu,food: mcDonald + mcDonalFoodBurger),
        SampleRestaurant(id: 2, persianName: "ساب وی", rate: 4.8, logo: UIImage(named: "subway")!, menus:subwayMenu,food:SubwayFood),
        SampleRestaurant(id: 3, persianName: "پیتزا هات", rate: 4.8, logo: UIImage(named: "pizza hut")!, menus:pizzahutMenu,food: []),
        SampleRestaurant(id: 4, persianName: "استار باکس", rate: 4.8, logo: UIImage(named: "starbucks")!, menus: [],food: []),
        SampleRestaurant(id: 5, persianName: "برگر کینگ", rate: 4.0, logo: UIImage(named: "BK")!, menus: [],food: []),
    ]
    private static let mcdonaldMenu:[SampleMenu] = [
        SampleMenu(id: 1, persianName: "پیتزا", foods:mcDonald),
        SampleMenu(id: 2, persianName: "برگر", foods: mcDonalFoodBurger),
        SampleMenu(id: 3, persianName: "سوخاری", foods: []),
        SampleMenu(id: 4, persianName: "نوشیدنی", foods: []),
        SampleMenu(id:5, persianName: "پیش غذا", foods: []),
    ]
    private static let subwayMenu:[SampleMenu] = [
        SampleMenu(id: 1, persianName: "س پیتزا", foods: []),
        SampleMenu(id: 2, persianName:   "سانودیچ", foods:SubwayFood),
        SampleMenu(id: 3, persianName: "س سوخاری", foods: []),
        SampleMenu(id: 4, persianName: "نوشیدنی", foods: []),
        SampleMenu(id:5, persianName: "پیش غذا", foods: []),
    ]
    private static let pizzahutMenu:[SampleMenu] = [
        SampleMenu(id: 1, persianName: "پیزا هات", foods: []),
        SampleMenu(id: 2, persianName: "هات برگر", foods: []),
        SampleMenu(id: 3, persianName: "هات سوخاری", foods: []),
        SampleMenu(id: 4, persianName: "نوشیدنی", foods: []),
        SampleMenu(id:5, persianName: "پیش غذا", foods: []),
    ]

    private static let SubwayFood:[SampleFood] = [
        SampleFood(id: 0, persianName: "هات داگ", rate: 5.0, price: 40000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 1, persianName: "ژامبون تنوری", rate: 4.6, price: 20000, discountAmount: 1000, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
    ]

    private static let mcDonald:[SampleFood] = [
        SampleFood(id: 0, persianName: "مرغ سخاری", rate: 5.0, price: 40000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 1, persianName: "کتف", rate: 4.6, price: 20000, discountAmount: 1000, ingredients: [], calorie: 0,image: UIImage(named: "1-1-1")!),
    ]
    private static let mcDonalFoodBurger:[SampleFood] = [
        SampleFood(id: 2, persianName: "دونالد برگر", rate: 5.0, price: 40000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 3, persianName: "دونالد برگر ويژه", rate: 4.6, price: 45000, discountAmount: 1000, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 4, persianName: "چیز برگر", rate: 3.6, price: 50000, discountAmount: 2000, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 5, persianName: "چیزبرگر ویژه", rate: 5.0, price: 55000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 6, persianName: "چیکن برگر", rate: 5.0, price: 35000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 7, persianName: "ماشروم برگر", rate: 5.0, price: 40000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
    ]
   
    private static let mcDonaldFood = mcDonald + mcDonalFoodBurger
}

