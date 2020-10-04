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
    private static let numbers = ["0":"۰","1":"۱","2":"۲","3":"۳","4":"۴","5":"۵","6":"۶","7":"۷","8":"۸","9":"۹",".":"/"]
    
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
    
    static func convertToPersianNumber(number:Double) -> String {
        var result:String = String(number)
        for (key,value) in Utilities.numbers  {
            result = result.replacingOccurrences(of: key, with: value)
        }
        return result
    }
}
