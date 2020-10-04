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
        SampleRestaurant(id: 1, persianName: "مک دونالد", rate: 4.8, logo: UIImage(named: "Mc donald")!, menus:mcdonaldMenu),
        SampleRestaurant(id: 2, persianName: "ساب وی", rate: 4.8, logo: UIImage(named: "subway")!, menus: []),
        SampleRestaurant(id: 3, persianName: "پیتزا هات", rate: 4.8, logo: UIImage(named: "pizza hut")!, menus: []),
        SampleRestaurant(id: 4, persianName: "استار باکس", rate: 4.8, logo: UIImage(named: "starbucks")!, menus: []),
        SampleRestaurant(id: 5, persianName: "برگر کینگ", rate: 4.0, logo: UIImage(named: "BK")!, menus: []),
    ]
    private static let mcdonaldMenu:[SampleMenu] = [
        SampleMenu(id: 1, persianName: "پیتزا", foods: []),
        SampleMenu(id: 2, persianName: "برگر", foods: []),
        SampleMenu(id: 3, persianName: "سوخاری", foods: []),
        SampleMenu(id: 4, persianName: "نوشیدنی", foods: []),
        SampleMenu(id:5, persianName: "پیش غذا", foods: []),
    ]
}

