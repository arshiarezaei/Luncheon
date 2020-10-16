//
//  Sample User.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

struct SampleUser {
    static private var isLoggedIn:Bool = false
    static private var username:String?
    static private var name:String?
    static private var lastName:String?
    static private var credit:Int?
    static private var password:String?
    static private var code:Int = 0
    static public var phone:String?
    static var getCode:Int {
        get{
            return code
        }
    }
    static var fullName :String {
        get{
            return name! + lastName!
        }
    }
    static var getCredit:Int {
        return self.credit != nil ? self.credit! : 0
    }
    static func newUser(username:String,name:String,lastname:String,password:String){
        self.username = username
        self.lastName = lastname
        self.name = name
        self.password = password
        self.credit = 0
    }
    static func login(username:String,password:String)->Bool{
        if self.username == username , self.password == password {
            self.isLoggedIn = true
            NotificationCenter.default.post(name: .userProfileRecevied, object: nil)
            return true
        }
        return false
    }
    static func logout(){
        self.isLoggedIn = false
        self.username = nil
        self.name = nil
        self.lastName = nil
        self.password = nil
        self.credit = nil
        self.phone = nil
    }
    static func generateCode()->Int{
        self.code = Int.random(in: 10000..<100000)
        return code
    }
    
}
