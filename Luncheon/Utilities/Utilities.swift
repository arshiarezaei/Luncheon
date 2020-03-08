//
//  Utilities.swift
//  Luncheon
//
//  Created by Arshiya on 12/17/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    
//    private static var _mobileNumber:String?
//    static var mobileNumber:String?{
//        get{
//            return _mobileNumber
//        }
//        set{
//            guard let  mn = phoneNumberValidation(phoneNumber: newValue!) else { return  }
//            _mobileNumber = mn
//        }
//    }
//    
    
    public static func phoneNumberValidation(phoneNumber:String) -> String? {
        // this function checks that phoneNumber only contains numbers and then convert persian numbers to english
        var mn:String? = ""
        for char in phoneNumber {
            if !(char.isNumber){
                return nil
            }
            mn!.append(char)
        }
        return mn
    }
}
