//
//  OrderPaymentViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class OrderPaymentViewController: UIViewController {
    
    internal var scrollView:UIScrollView = {
        var sv  = UIScrollView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .whiteBackgroud
        return sv
    }()
    internal let discountTextField:UITextField = {
        var dtf = UITextField(frame: .zero)
        dtf.translatesAutoresizingMaskIntoConstraints = false
        dtf.semanticContentAttribute = .forceLeftToRight
        dtf.placeholder = "- - - - - - "
        dtf.layer.cornerRadius = 16
        dtf.layer.borderWidth = 2
        dtf.layer.borderColor = UIColor.whiteBorder.cgColor
        dtf.textAlignment = .center
        dtf.clearButtonMode = .always
        dtf.returnKeyType = .done
        return dtf
    }()
    
    internal let useDiscountCodeButton:UIButton = {
        var udcb = UIButton(frame: .zero)
        udcb.translatesAutoresizingMaskIntoConstraints = false
        udcb.layer.cornerRadius = 20
        udcb.layer.borderWidth = 2
        udcb.layer.borderColor = UIColor.luncehonLogoText.cgColor
        udcb.titleLabel?.textAlignment = .center
        udcb.addTarget(self, action: #selector(useDiscountCodeButtonTapped), for: .touchUpInside)
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.luncehonLogoText]
        let title = NSAttributedString(string: "اعمال کد تخفیف", attributes: fontAttributes as [NSAttributedString.Key : Any])
        udcb.setAttributedTitle(title, for: .normal)
        udcb.isEnabled = false
        udcb.alpha = 0.4
        return udcb
    }()
    
    private let payOrderfromCredit:PayOrderFromCreditView = {
        var pofc = PayOrderFromCreditView(frame: .zero)
        pofc.translatesAutoresizingMaskIntoConstraints = false
        pofc.layer.cornerRadius = 16
        pofc.layer.borderWidth = 2
        pofc.layer.borderColor = UIColor.whiteBorder.cgColor
        pofc.backgroundColor = .white
        return pofc
    }()
    
    private let invoiceTVC = InvoiceTableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .whiteBackgroud
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addSubview(self.scrollView)
        setupScrollView()
        
        
        // add payOrderfromCredit
        scrollView.addSubview(payOrderfromCredit)
        setupPayOrderfromCreditConstraints()
        
        addChild(invoiceTVC)
        scrollView.addSubview(invoiceTVC.view)
        invoiceTVC.didMove(toParent: self)
        setupInvoiceTVC()
        
        scrollView.addSubview(discountTextField)
        setupDiscountTextFieldConstraints()
        
        scrollView.addSubview(useDiscountCodeButton)
        setupUseDiscountCodeButtonConstraints()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugPrint("sss")
        self.scrollView.becomeFirstResponder()
        discountTextField.resignFirstResponder()
    }
    private func setupScrollView(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupPayOrderfromCreditConstraints() {
        NSLayoutConstraint.activate([
            payOrderfromCredit.widthAnchor.constraint(equalTo: scrollView.widthAnchor,multiplier: 0.9),
            payOrderfromCredit.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            payOrderfromCredit.heightAnchor.constraint(equalToConstant: 100),
            payOrderfromCredit.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 32),
        ])
    }
    
    private func setupInvoiceTVC() {
        invoiceTVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            invoiceTVC.view.topAnchor.constraint(equalTo: payOrderfromCredit.bottomAnchor,constant: 32),
            invoiceTVC.view.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            invoiceTVC.view.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.9),
            invoiceTVC.view.heightAnchor.constraint(equalToConstant:CGFloat(invoiceTVC.tableView.numberOfRows(inSection: 0))*invoiceTVC.tableView.rowHeight),
            //            invoiceTVC.view.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        ])
    }
    private func setupDiscountTextFieldConstraints() {
        discountTextField.delegate = self
        NSLayoutConstraint.activate([
            discountTextField.topAnchor.constraint(equalTo: invoiceTVC.view.bottomAnchor,constant: 32),
            discountTextField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            discountTextField.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.9),
            discountTextField.heightAnchor.constraint(equalToConstant:36),
            
        ])
    }
    private func setupUseDiscountCodeButtonConstraints(){
        NSLayoutConstraint.activate([
            useDiscountCodeButton.topAnchor.constraint(equalTo: discountTextField.bottomAnchor, constant: 16),
            useDiscountCodeButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            useDiscountCodeButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            useDiscountCodeButton.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    @objc private func useDiscountCodeButtonTapped(){
        debugPrint("useDiscountCodeButtonTapped")
    }
    @objc func keyboardWillShow(notification:NSNotification){
        debugPrint("willshow")
        if self.view.frame.origin.y == 0 {
            self.scrollView.frame.origin.y -= 170
        }
    }    

}

