//
//  DropDownMenu.swift
//  Luncheon
//
//  Created by arshiya on 10/6/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class DropDownMenu: UIView {
    
    private let titleLabel:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.semanticContentAttribute = .forceRightToLeft
        l.font = UIFont(name: UIFont.BYekan.fontName, size: 20)
        l.numberOfLines = 1
        l.contentMode = .right
        l.text = "عنوان"
        l.textColor = .luncheonDarkBalck
        return l
    }()
    
    private let explandArrow:UIButton = {
        var eA = UIButton(frame: .zero)
        eA.translatesAutoresizingMaskIntoConstraints = false
        var image = UIImage(named: "expand")?.withRenderingMode(.alwaysTemplate)
        eA.setBackgroundImage(image, for: .normal)
        eA.tintColor = .luncehonLogoText
        eA.addTarget(self, action: #selector(expandArrowTapped), for: .touchUpInside)
        return eA
    }()
    
    private let items:FoodTrayTableView = {
        var i = FoodTrayTableView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.rowHeight = 78
        i.dataSource = i.self
        i.allowsSelection = false
        return i
    }()
    
    private var isItemsOpen:Bool = false
    private var height = NSLayoutConstraint()
    
    init(frame: CGRect,title:String) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.layer.cornerRadius = 16
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // add titleLabel
        self.addSubview(titleLabel)
        titleLabel.text = title
        setupTitleLabel()
        
        // add expland arrow
        self.addSubview(explandArrow)
        setupExpandArrow()
        
        self.addSubview(items)
        adddItemTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            //            titleLabel.heightAnchor.constraint(equalToConstant: 25 ),
        ])
    }
    private func setupExpandArrow()  {
        debugPrint("setupArrowButtton")
        NSLayoutConstraint.activate([
            explandArrow.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            explandArrow.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            explandArrow.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            explandArrow.widthAnchor.constraint(equalToConstant: 20),
            explandArrow.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        
    }
    private func adddItemTableView(){
        NSLayoutConstraint.activate([
            items.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            items.centerXAnchor.constraint(equalTo: self.centerXAnchor ),
            items.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
        
        height = items.heightAnchor.constraint(equalToConstant: 0)
        
    }
    @objc private func expandArrowTapped()  {
        debugPrint("arrowButttonTappedd")
        if isItemsOpen{
            UIView.animate(withDuration: 0.25, animations: {
                self.explandArrow.transform = CGAffineTransform(rotationAngle: 0)
            })
            isItemsOpen = !isItemsOpen
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseIn, animations:{
               self.items.center.y -= self.items.frame.height/2
                self.items.layoutIfNeeded()
                
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.25, animations: {
                self.explandArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
            isItemsOpen = !isItemsOpen
            
            NSLayoutConstraint.deactivate([height])
            height.constant = 5 * 78
            NSLayoutConstraint.activate([height])
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseIn, animations:{
                self.layoutIfNeeded()
                //self.items.center.y += self.items.frame.height/2
            }, completion: nil)
        }
    }
}
