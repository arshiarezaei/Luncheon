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
        debugPrint("FoodTrayTableViewDataSourcee numberOfRowsInSection")
//        return SampleFoodTray.foodTray[0]!.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        debugPrint("FoodTrayTableViewDataSourcee cellforRowAt")
        let c = UITableViewCell()
        c.textLabel?.text = "food \(indexPath.row)"
        return c
    }
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        debugPrint("FoodTrayTableViewDataSourcee dequeueReusableCell")
        let c = UITableViewCell()
        c.textLabel?.text = "food \(indexPath.row)"
        return c
    }
}
