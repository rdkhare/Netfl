//
//  WheelViewController.swift
//  NetflixPicker
//
//  Created by Willie Jiang on 7/5/17.
//  Copyright © 2017 Willie Jiang. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
class WheelViewController: UIViewController{
    @IBOutlet weak var wheel: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        wheel.makeCircle();
        wheel.backgroundColor = UIColor.cyan;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
