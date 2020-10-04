//
//  SampleMenu.swift
//  Luncheon
//
//  Created by arshiya on 10/3/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SampleMenu {
    
    let id:UInt
    let persianName:String
    var foods:[SampleFood]
    
    internal init(id: UInt, persianName: String,foods:[SampleFood]) {
        self.id = id
        self.persianName = persianName
        self.foods = foods
    }
    

}

