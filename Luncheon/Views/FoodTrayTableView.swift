//
//  FoodTrayTableView.swift
//  Luncheon
//
//  Created by arshiya on 10/7/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodTrayTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.layer.cornerRadius = 16
        self.rowHeight = 78
//        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
        debugPrint("asdsfsd")
    }
}
