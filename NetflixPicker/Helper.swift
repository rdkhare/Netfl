//
//  Helper.swift
//  NetflixPicker
//
//  Created by Willie Jiang on 7/5/17.
//  Copyright © 2017 Willie Jiang. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func makeCircle() {
        // Assumes image is a square
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.layer.masksToBounds = true
    }
    
    func makeCircleWithBorderColor(color: UIColor, width: CGFloat) {
        self.makeCircle()
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
}
