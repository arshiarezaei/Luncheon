//
//  OrderStatusView.swift
//  Luncheon
//
//  Created by arshiya on 9/19/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit
enum LastOrderStatus {
    case NoOrder
    case confirmed
    case cocking
    case ready
}
class OrderStatusView: UIView {
    
    private let statusIconDimentions = (length:CGFloat(42.0),width:CGFloat(42.0))
    private var orderStaus:LastOrderStatus = .NoOrder
    private var availableWidth:CGFloat = CGFloat(0)
    
    private let orderConfirmedImage:UIImageView={
        // TODO: change icone
        var oci = UIImageView(image: UIImage(named: "confirmation"))
        oci.frame = .zero
        oci.translatesAutoresizingMaskIntoConstraints = false
        oci.tintColor = .gray
        return oci
    }()
    private let orderIsCockingImage:UIImageView = {
        // TODO: change icone
        let oici = UIImageView(image: UIImage(named: "cooking"))
        oici.translatesAutoresizingMaskIntoConstraints = false
        //        oici.image = oici.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        oici.frame = .zero
        oici.tintColor = .gray
        return oici
    }()
    
    private let orderIsReadyImage:UIImageView = {
        // TODO: change icone
        let oiri = UIImageView(image: UIImage(named: "orderIsReady"))
        oiri.translatesAutoresizingMaskIntoConstraints = false
        oiri.frame = .zero
        oiri.tintColor = .gray
        //        oiri.image = oiri.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        return oiri
    }()
    
    private let orderConfirmedLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "تایید سفارش"
        label.font = UIFont(name: UIFont.BYekanName, size: 10)
        label.textColor = .gray
        return label
    }()
    
    private let orderIsCockingLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "طبخ غذا"
        label.font = UIFont(name: UIFont.BYekanName, size: 10)
        label.textColor = .gray
        return label
    }()
    
    private let orderIsReadyLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "آماده تحویل"
        label.font = UIFont(name: UIFont.BYekanName, size: 10)
        label.textColor = .gray
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        // inter-icone space calculation
        let width = self.frame.width
        availableWidth = (width - 3 * statusIconDimentions.width)/2
        
        //add orderConfirmedImage
        self.addSubview(orderConfirmedImage)
        setupOrderConfirmedImage()
        
        // add order confirmed labed
        self.addSubview(orderConfirmedLabel)
        setupOrderConfirmedLabel()
        
        //add orderConfirmedImage
        self.addSubview(orderIsCockingImage)
        setupIsCockingImage()
        
        // add orderIsCokingLabel
        self.addSubview(orderIsCockingLabel)
        setupOrderIsCokingLabel()
        
        
        // add orderisReady
        self.addSubview(orderIsReadyImage)
        setupOrderIsReadyImage()
        
        // add orderIsReadyLabel
        self.addSubview(orderIsReadyLabel)
        setupOrderIsReadyLabel()
        
        // MARK: prototype
        NotificationCenter.default.addObserver(self, selector: #selector(changeSateToOrderConfirmed), name: .orderConfirmed, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeSateToOrderIsCocking), name: .orderIsCooking, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeSateToOrderIsReady), name: .OrderIsReady, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupOrderConfirmedImage() {
        NSLayoutConstraint.activate([
            orderConfirmedImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orderConfirmedImage.heightAnchor.constraint(equalToConstant: statusIconDimentions.width),
            orderConfirmedImage.widthAnchor.constraint(equalToConstant: statusIconDimentions.length),
            orderConfirmedImage.rightAnchor.constraint(equalTo: self.rightAnchor,constant: availableWidth),
        ])
    }
    
    private func setupIsCockingImage() {
        NSLayoutConstraint.activate([
            orderIsCockingImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orderIsCockingImage.heightAnchor.constraint(equalToConstant: statusIconDimentions.width),
            orderIsCockingImage.widthAnchor.constraint(equalToConstant: statusIconDimentions.length),
            orderIsCockingImage.rightAnchor.constraint(equalTo: orderConfirmedImage.leftAnchor, constant: availableWidth)
            
        ])
    }
    private func setupOrderIsReadyImage(){
        NSLayoutConstraint.activate([
            orderIsReadyImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orderIsReadyImage.heightAnchor.constraint(equalToConstant: statusIconDimentions.width),
            orderIsReadyImage.widthAnchor.constraint(equalToConstant: statusIconDimentions.length),
            orderIsReadyImage.rightAnchor.constraint(equalTo: orderIsCockingImage.leftAnchor, constant:availableWidth)
        ])
    }
    
    private func setupOrderConfirmedLabel() {
        NSLayoutConstraint.activate([
            orderConfirmedLabel.centerXAnchor.constraint(equalTo: orderConfirmedImage.centerXAnchor),
            orderConfirmedLabel.topAnchor.constraint(equalTo: orderConfirmedImage.bottomAnchor, constant: 4),
        ])
    }
    private func setupOrderIsCokingLabel() {
        NSLayoutConstraint.activate([
            orderIsCockingLabel.centerXAnchor.constraint(equalTo: orderIsCockingImage.centerXAnchor),
            orderIsCockingLabel.topAnchor.constraint(equalTo: orderIsCockingImage.bottomAnchor, constant: 4),
        ])
    }
    private func setupOrderIsReadyLabel(){
        NSLayoutConstraint.activate([
            orderIsReadyLabel.centerXAnchor.constraint(equalTo: orderIsReadyImage.centerXAnchor),
            orderIsReadyLabel.topAnchor.constraint(equalTo: orderIsReadyImage.bottomAnchor, constant: 4),
        ])
    }
    func changeOrderStatus(updatedStatus:LastOrderStatus) {
        switch updatedStatus {
        case .NoOrder:
            orderConfirmedImage.tintColor = .gray
            orderIsCockingImage.tintColor = .gray
            orderIsReadyImage.tintColor = .gray
        case .confirmed:
            orderConfirmedImage.tintColor = .luncehonLogoText
            orderIsCockingImage.tintColor = .gray
            orderIsReadyImage.tintColor = .gray
        case .cocking:
            orderConfirmedImage.tintColor = .gray
            orderIsCockingImage.tintColor = .luncehonLogoText
            orderIsReadyImage.tintColor = .gray
        case .ready:
            orderConfirmedImage.tintColor = .gray
            orderIsCockingImage.tintColor = .gray
            orderIsReadyImage.tintColor = .luncehonLogoText
        }
    }
    
    
    //MARK: protptype
    @objc func changeSateToOrderConfirmed(){
        debugPrint("orderSatuts changeSateToOrderConfirmed")
        orderConfirmedImage.tintColor = .luncehonLogoText
        orderConfirmedLabel.textColor = .luncehonLogoText
    }
    @objc func changeSateToOrderIsCocking(){
        debugPrint("orderSatuts changeSateToOrderIsCocking")
        orderIsCockingImage.tintColor = .luncehonLogoText
        orderIsCockingLabel.textColor = .luncehonLogoText
    }
    @objc func changeSateToOrderIsReady(){
        debugPrint("orderSatuts changeSateToOrderIsReady")
        orderIsReadyImage.tintColor = .luncehonLogoText
        orderIsReadyLabel.textColor = .luncehonLogoText
    }
}
