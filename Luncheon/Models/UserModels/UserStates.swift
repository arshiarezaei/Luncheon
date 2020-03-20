//
//  UserStates.swift
//  Luncheon
//
//  Created by Arshiya on 12/9/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation

enum UserStates :Equatable {
    case LoggedIn(UserProfile)
    case LoggedOut
    
    static var currentState:UserStates = .LoggedOut
    
    
    static func changeStateToLogin() {
        var profile : UserProfile?
        Network.getCurrentUserProfile{
            (json,error) in
            if let _ = json {
                let name = json?["name"].string
                let familyName = json?["familyName"].string
                let credit = json?["balance"].int
                profile = UserProfile(name: name!, familyName: familyName!, credit: credit!)
                currentState = .LoggedIn(profile!)
                print(profile!)
                NotificationCenter.default.post(name: .userLoggedIn, object: profile)
            }
            else{
                debugPrint("UserStates->changeStateToLogin else")
            }
        }
        
    }
    static func changeStateToLoggedOut() {
        currentState = .LoggedOut
    }
    static func == (lhs: UserStates, rhs: UserStates) -> Bool {
        switch (lhs,rhs) {
        case (.LoggedOut , .LoggedOut ):
            return true
        default:
            return false
        }
    }
}



