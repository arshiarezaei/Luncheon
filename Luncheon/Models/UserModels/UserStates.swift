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
    
    static func changeStateToLogin(profile:UserProfile) {
        currentState = .LoggedIn(profile)
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



