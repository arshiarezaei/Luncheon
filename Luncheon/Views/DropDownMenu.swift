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
    
    private var isOpen:Bool = false
    
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
    @objc private func expandArrowTapped()  {
        debugPrint("arrowButttonTappedd")
        if isOpen{
            UIView.animate(withDuration: 0.25, animations: {
                self.explandArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
            isOpen = !isOpen
        }else{
            UIView.animate(withDuration: 0.25, animations: {
                self.explandArrow.transform = CGAffineTransform(rotationAngle: 0)
            })
            isOpen = !isOpen
        }
        
      
    }
}
