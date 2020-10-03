//
//  FCRestaurant.swift
//  Luncheon
//
//  Created by Arshiya on 1/15/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct FCRestaurant {
    
    private let id:String
    private let name:String
    private let persianName:String
    private let rate:Double
    private let rateCount:Int
    private let menus:[Menu]
    private let state = "ACTIVE"
    
    var _menu: [Menu] {
        return self.menus
    }
    
    var _persianName: String {
        get {
            self.persianName
            
        }
    }
    
    
    internal init(id: String, name: String, persianName: String, rate: Double, rateCount: Int, menus: [Menu]) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.rate = rate
        self.rateCount = rateCount
        self.menus = menus
    }
    init(json:JSON) {
        self.id = json["id"].string!
        self.name = json["name"].string!
        self.persianName = json["persianName"].string!
        if let rate = json["rate"].double{
            self.rate = rate
        }else{
            self.rate = 0
        }
        if let rateCount = json["rate"].int{
            self.rateCount = rateCount
        }else{
            self.rateCount = 0
        }
        var resmenu:[Menu] = []
        if let menus = json["menus"].arrayObject {
            for menu in menus {
                if menu is [String:Any]{
                    let m = Menu(dic: menu as! [String:Any] )
                    resmenu.append(m)
                }
            }
        }
        self.menus = resmenu

    }

}
