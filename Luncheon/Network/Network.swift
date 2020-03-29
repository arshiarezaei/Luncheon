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
    static private let APIs:URL = baseURL.appendingPathComponent("api/api/v1/")
    static private let userRegistrationURL:URL  = APIs.appendingPathComponent("users")
    static private let currentUserProfile:URL = userRegistrationURL.appendingPathComponent("me")
    static private let paymentBaseURL:URL = APIs.appendingPathComponent("payments")
    static private let icreaseCreditURL:URL = paymentBaseURL.appendingPathComponent("request")
    
    static private let loginURL:URL = baseURL.appendingPathComponent("auth/oauth/token")
    static private var id:String? //one time token
    
    static private var accessToken:String?
    static private var userID:String?
    
    static private var authorizationHeader:HTTPHeaders {
        get{
            return HTTPHeaders(["Authorization":"Bearer \(accessToken!)"])
        }
    }
    static private let authorization :HTTPHeaders = HTTPHeaders(["Authorization":"Basic YWRtaW5hcHA6cGFzc3dvcmQ="])
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
        debugPrint("this is \(url)")
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
    
    static func newUserRegistraion(infoItems:[String:String],completion : @escaping (Bool,String?)->Void) {
        let url :URLComponents = {
            var urlc = URLComponents(string:userRegistrationURL.absoluteString+"/")
            urlc?.queryItems = [URLQueryItem(name: "token", value: self.id! )]
            return urlc!
        }()
        debugPrint("url : \(url.string!)")
        print("param \(infoItems)")
        AF.request(url,method: .post,parameters:infoItems,encoder: JSONParameterEncoder.default).response{ response in
            //            print("raw request")
            //            print(String(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8) ?? "defaul value")
            //            print("end")
            //
            //            print("raw respnse data")
            //            print(JSON(response.data!)["message"])
            //            print(JSON(response.data!)["errorCode"])
            //
            //            print("ended")
            //
            //            print("raw response")
            //            print(response.response as Any)
            //            print("ended")
            //            print(response)
            
            switch response.result{
            case .success(_):
                debugPrint("request succeeded")
                if response.response?.statusCode != 201 {
                    completion(false,JSON(response.data!)["message"].string!)
                }
                
            case .failure(_):
                print("raw respnse data")
                print(JSON(response.data!)["message"])
                print(JSON(response.data!)["errorCode"])
                let message = JSON(response.data!)["message"].string!
                completion(false,message)
            }
            
            
        }
    }
    
    static func loginRequest(loginParameteres:[String:String],completion : @escaping (Int?)->Void){
        
        var parameters = loginParameteres
        parameters["grant_type"] = "password"
        debugPrint(parameters)
        AF.request(loginURL,method: .post,parameters:parameters,encoding: URLEncoding.default,headers: authorization)
            .responseJSON{ response in
                
                switch response.result{
                case .success(let value):
                    debugPrint("request successed")
                    self.accessToken = ((value as! [String:Any])["access_token"]! as? String)!
                    self.userID = ((value as! [String:Any])["userId"]! as? String)!
                    UserStates.changeStateToLogin()
                    completion(nil)
                case .failure:
                    debugPrint("failor \(String(describing: response.response!.statusCode))")
                    completion(response.response?.statusCode)
                }
                
        }
    }
    
    static func getCurrentUserProfile(completion: @escaping (JSON?,Error?)->Void ){
        AF.request(currentUserProfile,headers: authorizationHeader).responseJSON{ response in
            print(response)
            switch response.result{
            case .success(let value):
                if let data = value as? [String:Any] {
                    let json = JSON(data)
                    debugPrint("current User")
                    completion(json,nil)
                }
            case .failure(let error):
                print("error ocurred in getCurrentUserProfile")
                completion(nil,error)
                
            }
        }
    }
    
    
    static func userloggedOut(){
        self.id = nil
        self.accessToken = nil
        self.clientNumber = nil
        self.userID = nil
    }
    
    static func increaseCredit(amount:Int,completion: @escaping (String?)->Void ) {
        
        AF.request(icreaseCreditURL,method: .post,parameters:["amount":amount],encoder: JSONParameterEncoder.default,headers: authorizationHeader).responseJSON{ response in
            debugPrint("class Network -> increasecredit")
            print(response)
            switch response.result{
            case .success(let value):
                if let data = value as? [String:Any] {
                    let json = JSON(data)
                    let url = json["url"].string!
                    let token = json["token"].string!
                    let finlaUrl = url+"?RefId="+token
                    debugPrint("\(finlaUrl)")
                    completion(finlaUrl)
//                    debugPrint("tokrn \(token)")
                }
            case .failure:
                debugPrint("failure")
            }
            
            
        }
        
    }
    
    
    
    
}
