//
//  Extention NewUserInformationsVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/20/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

extension NewUserInformationsVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        debugPrint("extension NewUserInformationsVC textFieldShouldReturn")
        if let nextTF = textField.superview?.viewWithTag(textField.tag + 1) {
            nextTF.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false
    }
    
}
