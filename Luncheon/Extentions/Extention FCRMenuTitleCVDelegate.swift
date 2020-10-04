//
//  Extention .swift
//  Luncheon
//
//  Created by arshiya on 10/4/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import Foundation
import UIKit

extension FCRMenuTitleCV:UICollectionViewDelegate{
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
