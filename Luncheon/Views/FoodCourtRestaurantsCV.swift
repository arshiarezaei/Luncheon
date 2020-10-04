//
//  FoodCourtRestaurantsCV.swift
//  Luncheon
//
//  Created by Arshiya on 1/17/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FoodCourtRestaurantsCV: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        NotificationCenter.default.addObserver(self, selector: #selector(updateContent(notif:)) , name: .updateFCRestaurantsNameCell, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let y = bounds.maxY - 1
        let minX = bounds.minX
        let maxX = bounds.maxX
        let lineColor = UIColor(red: 236/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        context.setStrokeColor(lineColor)
        context.setLineWidth(2.0)
        context.move(to: CGPoint(x: minX, y: y))
        context.addLine(to: CGPoint(x: maxX, y: y))
        context.strokePath()

    }
    @objc private func updateContent(notif:Notification) {
        assertionFailure("foodcourtrestaurantCV.swift updateContent")
//        let index:Int = (notif.object as! [String:Any])["index"] as! Int
//        let indPath = IndexPath(item: index, section: 0)
//        let fcRestName = FoodCourtManager.getARestaurant(index: index)!._persianName
//        (self.cellForItem(at: indPath) as! FoodCourtRestaurantsCollectionViewCell).updateContent(fcrestaurantName: fcRestName)
    }
    
}
