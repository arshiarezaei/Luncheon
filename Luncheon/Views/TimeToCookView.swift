//
//  TimeToCookView.swift
//  Luncheon
//
//  Created by arshiya on 9/19/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class TimeToCookView: UIView {
    private let remainedTimeLabel:UILabel = {
        let rtl = UILabel(frame: .zero)
        rtl.translatesAutoresizingMaskIntoConstraints = false
        rtl.text = "زمان باقی مانده"
        rtl.font = UIFont(name: UIFont.BYekanName, size: 15)
        rtl.textColor = .gray
        rtl.textAlignment = .right
        return rtl
    }()
    private let timerValue:UILabel = {
        let rtl = UILabel(frame: .zero)
        rtl.translatesAutoresizingMaskIntoConstraints = false
        rtl.text = "00:00"
        rtl.font = UIFont(name: UIFont.BYekanName, size: 15)
        rtl.textColor = .gray
        rtl.textAlignment = .right
        return rtl
    }()
    private var runCount:Int!
    private var timer:Timer?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        
        // add remainedTimeLabel
        self.addSubview(remainedTimeLabel)
        setupRemainedTimeLabel()
        
        // add timerValue
        self.addSubview(timerValue)
        setupTimerValue()
        
        //MARK: prototype
        NotificationCenter.default.addObserver(self, selector: #selector(startTimer), name: .orderConfirmed, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupRemainedTimeLabel() {
        NSLayoutConstraint.activate([
            remainedTimeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            remainedTimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        ])
    }
    private func setupTimerValue() {
        NSLayoutConstraint.activate([
            timerValue.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timerValue.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        ])
    }
    
    @objc private func startTimer() {
        // MARK: prototype
        self.runCount = 15
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTime), userInfo: nil, repeats: true)
    }
    
    @objc private func startTime() {
        self.runCount -= 1
        DispatchQueue.main.async {
            let houres = self.runCount / 3600
            let minutes = (self.runCount % 3600) / 60
            let sec = (self.runCount % 3600) % 60
            //                debugPrint(String(format: "%02d:%02d:%02d",houres, minutes, sec))
            self.timerValue.text = String(format: "%2d:%2d:%2d",houres, minutes, sec)
            
        }
    }
    
    
}
