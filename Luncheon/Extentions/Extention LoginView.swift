//
//  Extention UITextFieldDelegate.swift
//  Luncheon
//
//  Created by Arshiya on 12/13/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

extension LoginView:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTF = textField.superview?.viewWithTag(textField.tag + 1) {
            nextTF.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false
    }

}
