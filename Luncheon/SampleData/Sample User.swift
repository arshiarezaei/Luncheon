//
//  Sample User.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

struct SampleUser {
    static let userName = "arshiyarezaie"
    static let name = "ارشیا"
    static let lastName = "رضائی هزاوه"
    static let Credit:Int = 10000
    static let password:String = "123456"
    static let code = "2455"
    static var fullName :String {
        get{
            return name + lastName
        }
    }
    
}
