//
//  UserProfile.swift
//  Luncheon
//
//  Created by Arshiya on 12/9/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit


struct UserProfile {
    static private var _profilePic:UIImage?
    static private var _name:String?
    static private var _Credit:Int?
    static private var _familyName:String?
    
    static var profilePic: UIImage{
        get {
            if let pic = self._profilePic{
                return pic
            }
            else {
                return UIImage(named: "profile")!
            }
        }
        set {
            _profilePic = newValue
        }
    }
    static var fullName: String? {
        get {
            return String("\(_name!) \(_familyName!)")
        }
    }
    static var credit: Int {
        get {
            return _Credit!
        }
        set {
            self._Credit = newValue
        }
    }
    
    init(name:String,familyName:String,credit:Int) {
        debugPrint("\(name) \(familyName)  \(credit)")
        UserProfile._name = name
        UserProfile._familyName = familyName
        UserProfile._Credit = credit
    }

}
