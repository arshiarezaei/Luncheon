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
    static private let smsRequesText:String = "‌welcome to Luncheon, Please use the following code: \(SampleUser.generateCode()) "
    static private let userName:String = "09213975282"
    static private let password:String = "613e754"
    static private let from:String = "50001060658364"
    static private let orderPaidText = "Luncheon, Your order from TestFoodCourt paid successfully. order No: \(SampleOrder.generateOrderNo())"
    static private let orderRegisteredText = "Luncheon, Your order from TestFoodCourt registered."
    static private let orderConfirmedText = "Luncheon, Your order from TestFoodCourt confirmed."
    static private let orderIsCockingText = "Luncheon, Your order from TestFoodCourt is coocking."
    static private let orderIsReadyText = "Luncheon, Your order from TestFoodCourt is READY. Enjoy your meal. :)"
    
    static func requestSMS(to:String ) {
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":to,"from":from,"text":smsRequesText],encoder: JSONParameterEncoder.default).responseJSON{ response in
//            debugPrint("SampleNetwork Network -> requestSMS")
//            print(response)
//            switch response.result{
//            case .success :
//                debugPrint("ok")
//            case .failure:
//                debugPrint("failure")
//            }
        }
        
    }
    static func orderPaid(){
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":String(SampleUser.phone!),"from":from,"text":orderPaidText],encoder: JSONParameterEncoder.default).responseJSON{ response in
//            debugPrint("SampleNetwork Network -> requestSMS")
//            print(response)
//            switch response.result{
//            case .success :
//                debugPrint("ok")
//            case .failure:
//                debugPrint("failure")
//            }
            
        }
    }
    static func orderRegistered(){
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":String(SampleUser.phone!),"from":from,"text":orderRegisteredText],encoder: JSONParameterEncoder.default).responseJSON{ response in
        }
    }
    static func orderConfirmed(){
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":String(SampleUser.phone!),"from":from,"text":orderConfirmedText],encoder: JSONParameterEncoder.default).responseJSON{ response in
        }
    }
    static func orderIsCooking(){
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":String(SampleUser.phone!),"from":from,"text":orderIsCockingText],encoder: JSONParameterEncoder.default).responseJSON{ response in
        }
    }
    static func orderIsReady(){
        AF.request(smsRequestURLbaseURL,method: .post,parameters:["username":userName,"password":password,"to":String(SampleUser.phone!),"from":from,"text":orderIsReadyText],encoder: JSONParameterEncoder.default).responseJSON{ response in
        }
    }
}
