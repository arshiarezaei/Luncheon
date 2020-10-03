//
//  FCRestaurantManager.swift
//  Luncheon
//
//  Created by Arshiya on 1/20/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct FoodCourtManager {
    
    private static var _fCRestaurants:[FCRestaurant]? 
    
    static var fCRestaurants:[FCRestaurant]?{
        get{
            if _fCRestaurants?.count != 0 {
                return _fCRestaurants
            }
            else{
                return nil
            }
        }
    }
    
    static var countOfRestaurants:Int{
        get{
            if let count = _fCRestaurants?.count{
                return count
            }
            return 0
        }
    }
    
    static private func jsonToFCRestaurantsArray (josn:JSON){
        let array = (josn.array)!
//        var fcr:[FCRestaurant] = []
        var a = 0
        _fCRestaurants=[]
        for res in array{
            let rest = FCRestaurant(json: res)
//            fcr.append(rest)
            _fCRestaurants?.append(rest)
            let obj = ["fcres":rest,"index":a] as [String : Any]
            NotificationCenter.default.post(name: .updateFCRestaurantsNameCell, object: obj)
            a += 1
        }
//        self._fCRestaurants = fcr
    }
    
    static func getRestaurantsOfAFC() {
        Network.getRestaurantsOfaFoodCourt(){ json in
            debugPrint("FoodCourtManager")
            jsonToFCRestaurantsArray(josn: json!)
            
        }
    }
    
    static func getARestaurant(index:Int)->FCRestaurant?{
        return self._fCRestaurants?[index]
    }
}
