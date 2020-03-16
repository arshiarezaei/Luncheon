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
    
    static private let baseURL:URL = URL(string: "http://81.31.168.254:8080")!
    static private let requestSMSURL:URL = baseURL.appendingPathComponent("auth/users/sms")
    static private var id:String? //one time token
    
    static  var clientNumber:String?
    
    static func requesteSMS(clientNumber:String , completion : @escaping (Error?)->Void){
        let parameter = ["clientNumber": clientNumber]
        AF.request(requestSMSURL,method: .post,parameters: parameter ).responseJSON{ response in
            switch response.result{
            case .success(_):
                self.clientNumber = clientNumber
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func validatingSMS(code:String , completion : @escaping (Error?)->Void){
        //        let parameter = ["clientNumber": clientNumber,"code":code]
        let q = [URLQueryItem(name: "clientId", value: self.clientNumber),URLQueryItem(name: "code", value: code)]
        let url :URLComponents = {
            var urlc = URLComponents(string: requestSMSURL.absoluteString)
            urlc?.queryItems = q
            return urlc!
        }()
        debugPrint("inam az url \(url)")
        AF.request(url,method: .put).responseJSON{ response in
            switch response.result{
            case .success(let value):
//                debugPrint("request sucess")
                if let re = value as? [String:Any] {
                    self.id = re["id"] as? String
//                    debugPrint("this is one time token = \(self.id!)")
                }
                completion(nil)
            case .failure(let error):
//                debugPrint("request failed \(error)")
                completion(error)
            }
        }
    }
    
    
    
}
