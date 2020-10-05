//
//  RateView.swift
//  Luncheon
//
//  Created by arshiya on 10/4/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit
@IBDesignable
class RateView: UIView {
    
     private let star:UIImageView = {
         let sv = UIImageView(frame: .zero)
         sv.translatesAutoresizingMaskIntoConstraints = false
         sv.image = UIImage(named: "star")
         sv.contentMode = .scaleAspectFill
         
         return sv
     }()
     
     private let rateNumnberLabel:UILabel = {
         let rnl = UILabel(frame: .zero)
         rnl.translatesAutoresizingMaskIntoConstraints = false
         rnl.textAlignment = .right
         rnl.font = UIFont(name: "BYekan+", size: rnl.font.pointSize)
         rnl.adjustsFontSizeToFitWidth = true
         rnl.semanticContentAttribute = .forceLeftToRight
         rnl.textColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
         return rnl
     }()
     
     
     override init(frame: CGRect) {
         super.init(frame: .zero)
         setupView()
         
     }
     
     required init?(coder: NSCoder) {
         // fatalError("init(coder:) has not been implemented")
         super.init(coder: coder)
         setupView()         
     }
     
     
     
     
     func setRateNumber(rate:Double) {
         let rateInPersinaNumber :String = Utilities.convertToPersianNumber(number: rate)
         rateNumnberLabel.text = rateInPersinaNumber
     }
     
     
     
     private func setupView() {
         self.addSubview(star)
         setupStar()
         
         self.addSubview(rateNumnberLabel)
         setupRateNumber()
         
         self.layer.cornerRadius = 12
         self.layer.masksToBounds = true
         self.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
         
     }
     private func setupStar()  {
         NSLayoutConstraint.activate([
             star.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
             star.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
             star.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 4),
             star.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: star.safeAreaLayoutGuide.heightAnchor)
             
         ])
     }
     
     private func setupRateNumber() {
         NSLayoutConstraint.activate([
             rateNumnberLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
             rateNumnberLabel.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: star.safeAreaLayoutGuide.centerYAnchor),
             rateNumnberLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: star.safeAreaLayoutGuide.trailingAnchor, constant: 3)
             
         ])
         
     }

}
