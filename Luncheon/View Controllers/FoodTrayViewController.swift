//
//  FoodTrayViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/5/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodTrayViewController: UIViewController {

    private let closeButton:UIButton = {
       var cb =  UIButton(frame: .zero)
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setImage(UIImage(named: "close"), for: .normal)
        cb.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        return cb
    }()
    private let luncheonLogo:UIImageView = {
        var logo = UIImageView(image: UIImage(named: "Luncheon logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let foodtrayLabel:UILabel = {
        var ftb = UILabel(frame: .zero)
        ftb.translatesAutoresizingMaskIntoConstraints = false
        ftb.semanticContentAttribute = .forceRightToLeft
        ftb.contentMode = .center
        ftb.textColor = .luncheonDarkBalck
        ftb.font = UIFont(name: UIFont.BYekan.fontName, size: 30)
        ftb.text = "سینی غذا"
        return ftb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        
        // close button
        self.view.addSubview(closeButton)
        setupCloseButton()

        // luncheon logo
        self.view.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        // foodtray lable
        self.view.addSubview(foodtrayLabel)
        setupFoodTrayLabel()
        

    }
    
    private func setupCloseButton() {
        NSLayoutConstraint.activate([
            closeButton.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 29),
            closeButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 29),
            closeButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16),
        ])
    }
    private func setupLuncheonLogo() {
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 40),
            luncheonLogo.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 40),
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            luncheonLogo.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
        ])
    }
    private func setupFoodTrayLabel() {
        NSLayoutConstraint.activate([
            foodtrayLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            foodtrayLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    @objc func closeButtonTapped(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
