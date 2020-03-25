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
    let  profilePic:UIImage? = UIImage(named: "profile")
    let  name:String
    let credit:Int
    let familyName:String
    
    var fullName: String {
        return "\(name) \(familyName)"
    }
    
    
    init(name:String,familyName:String,credit:Int) {
        debugPrint("\(name) \(familyName)  \(credit)")
        self.name = name
        self.familyName = familyName
        self.credit = credit
    }

}
