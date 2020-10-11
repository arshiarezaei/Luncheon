//
//  FoodTrayTableViewCell.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodTrayTableViewCell: UITableViewCell {
    
    private let foodNameLabel:UILabel = {
        let fnl = UILabel(frame: .zero)
        fnl.translatesAutoresizingMaskIntoConstraints = false
        fnl.textColor = .black
        fnl.font = UIFont(name: "BYekan+", size: 15)
        fnl.textAlignment = .right
        fnl.semanticContentAttribute = .forceRightToLeft
        fnl.numberOfLines = 1
        return fnl
    }()
    
    private let foodPriceLabel:UILabel = {
        let fpl = UILabel(frame: .zero)
        fpl.translatesAutoresizingMaskIntoConstraints = false
        fpl.textColor = .luncheonGray
        fpl.font = UIFont(name: "BYekan+", size: 15)
        fpl.textAlignment = .right
        fpl.semanticContentAttribute = .forceLeftToRight
        //        fpl.layer.borderColor = UIColor.black.cgColor
        //        fpl.layer.borderWidth = 2
        return fpl
    }()
    
    private let plusBuuton:UIButton = {
        let pb = UIButton(frame: .zero)
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.setImage(UIImage(named: "plus"), for: .init())
        pb.imageView?.contentMode = .scaleAspectFill
        pb.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return pb
    }()
    
    private let minusButton : UIButton = {
        let mb = UIButton(frame: .zero)
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setImage(UIImage(named: "minus"), for: .init())
        mb.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return mb
    }()
    
    private let orderedCountLabel:UILabel = {
        let odl = UILabel(frame: .zero)
        odl.translatesAutoresizingMaskIntoConstraints = false
        odl.font = UIFont(name: "BYekan+", size: 20)
        odl.textAlignment = .center
        odl.semanticContentAttribute = .forceLeftToRight
        odl.textColor = .black
        odl.adjustsFontSizeToFitWidth = true
        odl.numberOfLines = 1
        
        return odl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add foodNameLabel
        self.addSubview(foodNameLabel)
        setupFoodNameLabelConstraint()
        
        
        // add foodPriceLabel 
        self.addSubview(foodPriceLabel)
        setupFoodPriceLabelConstraints()
        
        // add plusButton
        self.addSubview(plusBuuton)
        setupPlusButtonConstraints()

        // add ordered count
        self.addSubview(orderedCountLabel)
        setupOrderedCountLabelConstraints()
    
//         add minuse button
        self.addSubview(minusButton)
        setupMinusButtonConstraints()
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupFoodNameLabelConstraint() {
        NSLayoutConstraint.activate([
            foodNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            foodNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16),
        ])
    }
    private func setupFoodPriceLabelConstraints(){
        NSLayoutConstraint.activate([
            foodPriceLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor,constant: 0),
            foodPriceLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16)
        ])
    }
    private func setupPlusButtonConstraints(){
        NSLayoutConstraint.activate([
            plusBuuton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusBuuton.widthAnchor.constraint(equalToConstant: 30),
            plusBuuton.heightAnchor.constraint(equalToConstant: 30),
            plusBuuton.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 64),
        ])
    }
    private func setupMinusButtonConstraints(){
        NSLayoutConstraint.activate([
            minusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            minusButton.rightAnchor.constraint(equalTo: orderedCountLabel.leftAnchor,constant: -8),
        ])
    }
    private func setupOrderedCountLabelConstraints(){
        NSLayoutConstraint.activate([
            orderedCountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orderedCountLabel.rightAnchor.constraint(equalTo: plusBuuton.leftAnchor,constant: -8),
        ])
    }
    @objc private func plusButtonTapped(){
        assertionFailure("not implemented")
    }
    @objc private func minusButtonTapped(){
        assertionFailure("not implemented")
    }
    
    func setupCellContent(foodName:String,foodPrice:Int,count:Int) {
        foodNameLabel.text = foodName
        foodPriceLabel.text = Utilities.convertToPersianNumber(number: foodPrice)
        orderedCountLabel.text = Utilities.convertToPersianNumber(number: count)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugPrint("sss")
    }
}
