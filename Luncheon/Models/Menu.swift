//
//  Menu.swift
//  Luncheon
//
//  Created by Arshiya on 1/16/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Menu {
    
    let id:UInt
    private let name:String
    private let persianName:String
    private let commision:Double
    private var foods:[Food]!
    
    internal init(id: UInt, name: String, persianName: String, commision: Double) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.commision = commision
    }
    
    internal init(json:JSON) {
        self.id = json["id"].uInt!
        self.name = json["name"].string!
        self.persianName = json["persianName"].string!
        self.commision = json["commission"].double!
    }
    
    internal init(dic : [String:Any]){
        self.id = dic["id"] as! UInt
        self.name = dic["name"] as! String
        self.persianName = dic["persianName"] as! String
        self.commision = dic["commission"] as! Double
    }
}
