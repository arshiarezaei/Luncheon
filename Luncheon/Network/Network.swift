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
    static private let loginURL:URL = baseURL.appendingPathComponent("auth/oauth/token")
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
    
    static func newUserRegistraion(infoItems:[String:String],completion : @escaping (Error?)->Void) {
        let url :URLComponents = {
            var urlc = URLComponents(string:userRegistrationURL.absoluteString+"/")
            urlc?.queryItems = [URLQueryItem(name: "token", value:"e35bf479-b6af-4c3c-b444-eec8e5a20a9e" )]
            return urlc!
        }()
        debugPrint("url : \(url.string!)")
        print("param \(infoItems)")
        AF.request(url,method: .post,parameters:infoItems,encoder: JSONParameterEncoder.default).response{ response in
            print("raw request")
            print(String(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8) ?? "defaul value")
            print("end")
            
            print("raw respnse data")
            print(JSON(response.data!)["message"])
            print(JSON(response.data!)["errorCode"])
            
            print("ended")
            
            print("raw response")
            print(response.response as Any)
            print("ended")
            
            
            
            print(response)
        }
    }
    
    static func loginRequest(loginParameteres:[String:String],completion : @escaping (Error?)->Void){
        let authorization :HTTPHeaders = HTTPHeaders(["Authorization":"Basic YWRtaW5hcHA6cGFzc3dvcmQ="])
        var parameters = loginParameteres
        parameters["grant_type"] = "password"
        debugPrint(parameters)
        AF.request(loginURL,method: .post,parameters:parameters,encoding: URLEncoding.default,headers: authorization ).responseJSON{ response in
            switch response.result{
            case .success(let value):
                debugPrint("request successed")
                debugPrint(value as! [String:Any])
                completion(nil)
            case .failure(_):
                assertionFailure("not implemented")
                debugPrint(response.data!)
            }
            
        }
    }
    
    
    
}
