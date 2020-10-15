//
//  Sample User.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

struct SampleUser {
    static private let userName = "arshiyarezaie"
    static private let name = "ارشیا"
    static private let lastName = "رضائی هزاوه"
    static private let credit:Int = 10000
    static private let password:String = "123456"
    static private var code = "2455"
    static var getCode:String {
        get{
            let newCode = Int.random(in: 10000..<100000)
            self.code = String(newCode)
            return code
        }
    }
    static var fullName :String {
        get{
            return name + lastName
        }
    }
    static var getCredit:Int {
        return self.credit
    }
    static public func newUser(userName:String,)
    
}
