//
//  FCRMenuTitleCV.swift
//  Luncheon
//
//  Created by Arshiya on 1/23/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FCRMenuTitleCV: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.semanticContentAttribute = .forceRightToLeft

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
