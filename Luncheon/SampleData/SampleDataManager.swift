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
        SampleRestaurant(id: 1, persianName: "مک دونالد", rate: 4.8, logo: UIImage(named: "Mc donald")!, menus:mcdonaldMenu,food: mcDonalFood),
        SampleRestaurant(id: 2, persianName: "ساب وی", rate: 4.8, logo: UIImage(named: "subway")!, menus:subwayMenu,food: []),
        SampleRestaurant(id: 3, persianName: "پیتزا هات", rate: 4.8, logo: UIImage(named: "pizza hut")!, menus:pizzahutMenu,food: []),
        SampleRestaurant(id: 4, persianName: "استار باکس", rate: 4.8, logo: UIImage(named: "starbucks")!, menus: [],food: []),
        SampleRestaurant(id: 5, persianName: "برگر کینگ", rate: 4.0, logo: UIImage(named: "BK")!, menus: [],food: []),
    ]
    private static let mcdonaldMenu:[SampleMenu] = [
        SampleMenu(id: 1, persianName: "پیتزا", foods:mcDonalFood),
        SampleMenu(id: 2, persianName: "برگر", foods: []),
        SampleMenu(id: 3, persianName: "سوخاری", foods: []),
        SampleMenu(id: 4, persianName: "نوشیدنی", foods: []),
        SampleMenu(id:5, persianName: "پیش غذا", foods: []),
    ]
    private static let subwayMenu:[SampleMenu] = [
        SampleMenu(id: 1, persianName: "س پیتزا", foods: []),
        SampleMenu(id: 2, persianName: "س برگر", foods: []),
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
    private static let mcDonalFood:[SampleFood] = [
        SampleFood(id: 0, persianName: "دونالد برگر", rate: 5.0, price: 40000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "food")!),
        SampleFood(id: 1, persianName: "پیتزا ۱", rate: 4.6, price: 20000, discountAmount: 0, ingredients: [], calorie: 0,image: UIImage(named: "1-1-1")!),
    ]
}

