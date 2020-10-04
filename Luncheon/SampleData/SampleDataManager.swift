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
        SampleRestaurant(id: 1, persianName: "مک دونالد", rate: 4.8, logo: UIImage(named: "Mc donald")!, menus: []),
        SampleRestaurant(id: 2, persianName: "ساب وی", rate: 4.8, logo: UIImage(named: "subway")!, menus: []),
        SampleRestaurant(id: 3, persianName: "پیتزا هات", rate: 4.8, logo: UIImage(named: "pizza hut")!, menus: []),
        SampleRestaurant(id: 4, persianName: "استار باکس", rate: 4.8, logo: UIImage(named: "starbucks")!, menus: []),
    ]
}
