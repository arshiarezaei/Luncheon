//
//  Sample Invoice.swift
//  Luncheon
//
//  Created by arshiya on 10/15/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

struct SampeInvoice {
    public static var total:Int = 0
    public static var packaging:Int = 0
    public static var delivery:Int = 0
    public static var discount:Int  {
        get {
            return total/10
        }
    }
    public static var tax: Int {
        get {
            return total/10
        }
    }
    public static var totalOrder:Int {
        get{
            return total + tax + packaging + delivery - discount
        }
    }
}
