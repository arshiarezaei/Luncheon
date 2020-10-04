//
//  SampleRestaurant.swift
//  Luncheon
//
//  Created by arshiya on 10/3/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

struct SampleRestaurant {
    
    let id:Int
    let persianName:String
    let rate:Double
    let logo:UIImage
    let menus:[SampleMenu]
    
    init(id: Int, persianName: String, rate: Double, logo:UIImage, menus: [SampleMenu]) {
        self.id = id
        self.persianName = persianName
        self.rate = rate
        self.logo = logo
        self.menus = menus
    }
    
}
