//
//  Sample Notification.swift
//  Luncheon
//
//  Created by arshiya on 10/17/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation

extension Notification.Name{
    static let orderConfirmed:Notification.Name = Notification.Name("orderConfirmed")
    static let orderIsCooking:Notification.Name = Notification.Name("orderIsCooking")
    static let OrderIsReady:Notification.Name = Notification.Name("OrderIsReady")
}

