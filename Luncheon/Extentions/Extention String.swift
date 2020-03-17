//
//  Extention String.swift
//  Luncheon
//
//  Created by Arshiya on 12/27/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation

extension String{
    
    public var persianToEnglishDigits : String {
        let persianNumbers = ["۰":"0","۱":"1","۲":"2","۳":"3","۴":"4","۵":"5","۶":"6","۷":"7","۸":"8","۹":"9"]
        var number = self
        _ = persianNumbers.map { number = number.replacingOccurrences(of: $0, with: $1)}
     
        return number
    }
    
}

