//
//  Invoice.swift
//  Luncheon
//
//  Created by arshiya on 9/24/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
class InvoiceItem {
    public static var invoiceItems = ["جمع سفارش","مالیات","بسته بندی","هزینه ارسال","تخفیف","جمع کل"]
    private let title:String
    private let value:Int
    var getTitle: String {
        return self.title
    }
    var getValue: Int {
        return  self.value
    }
    
    init(title:String,value:Int) {
        self.title = title
        self.value = value
    }
}
