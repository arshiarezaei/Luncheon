//
//  Menu.swift
//  Luncheon
//
//  Created by Arshiya on 1/16/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation

struct Menu {
    
    private let id:UInt
    private let name:String
    private let persianName:String
    private let commision:UInt
    private var foods:[Food]!
    
    internal init(id: UInt, name: String, persianName: String, commision: UInt) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.commision = commision
    }
}
