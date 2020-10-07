//
//  Extention FoodTrayTableViewDataSource.swift
//  Luncheon
//
//  Created by arshiya on 10/7/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit


extension FoodTrayTableView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return SampleFoodTray.restaurantsInFoodTray
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell()
        c.textLabel?.text = "food \(indexPath.row)"
        return UITableViewCell()
    }
//    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
//        <#code#>
//    }
}
