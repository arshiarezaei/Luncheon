//
//  Network.swift
//  Luncheon
//
//  Created by Arshiya on 12/27/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Network {
    
    static let baseURL:URL = URL(string: "http://81.31.168.254:8080")!
    static let requestSMS:URL = baseURL.appendingPathComponent("auth/users/sms")
    
    static func RequesteSMS(phoneNumber:String , completion : @escaping (Error?)->Void){
        let parameter = ["clientNumber": phoneNumber]
        AF.request(requestSMS,method: .post,parameters: parameter ).responseJSON{ response in
            switch response.result{
            case .success(_):
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
