//
//  UserProfile.swift
//  Luncheon
//
//  Created by Arshiya on 12/9/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit


struct UserProfile {
    private static var _profilePic:UIImage?
    private static var _name:String?
    static var profilePic: UIImage{
        get {
            if let pic = self._profilePic{
                return pic
            }
            else {
                return UIImage(named: "profile")!
            }
        }
        set {
            _profilePic = newValue
        }
    }
    static var name: String? {
        get {
            return _name
        }
        set {
            self._name = newValue
        }
    }

}
