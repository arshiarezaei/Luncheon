//
//  Extentiion OrderPaymentViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/14/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

extension OrderPaymentViewController:UITextFieldDelegate {
    @objc func keyboardWillHide(notification:NSNotification){
        debugPrint("willhide")
        scrollView.frame.origin.y = 0
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        scrollView.becomeFirstResponder()
        discountTextField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !discountTextField.text!.isEmpty {
            useDiscountCodeButton.isEnabled = true
            useDiscountCodeButton.alpha = 1
        }
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        useDiscountCodeButton.isEnabled = false
        useDiscountCodeButton.alpha = 0.4
        return true
    }
}
