//
//  Sample Network.swift
//  Luncheon
//
//  Created by arshiya on 10/15/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import Alamofire

struct SampleNetwork {
    
    static private let smsRequestURLbaseURL:URL = URL(string: "https://rest.payamak-panel.com/api/SendSMS/SendSMS")!
    static private let smsRequesText:String = "‌welcome to Luncheon, please use the following code: \(SampleUser.getCode) "
    static private let userName:String = "09213975282"
    static private let password:String = "613e754"
    static private let from:String = "50001060658364"
    
    static func requestSMS(to:String ) {
        
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":to,"from":from,"text":smsRequesText],encoder: JSONParameterEncoder.default).responseJSON{ response in
            debugPrint("SampleNetwork Network -> requestSMS")
            print(response)
            switch response.result{
            case .success :
                debugPrint("ok")
            case .failure:
                debugPrint("failure")
            }
            
            
        }
        
    }
}
