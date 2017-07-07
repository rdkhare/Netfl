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
import SwiftyJSON
import Alamofire
class WheelViewController: UIViewController{
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var wheel: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var testString = ""
    
    override func viewDidLoad() {
        
        testLabel.text = testString
        super.viewDidLoad()
        wheel.makeCircle()
        wheel.backgroundColor = UIColor.cyan
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func userInformation(movies: JSON) {
//        testLabel.text = movies[0]["show_title"].stringValue
//    }
    
}
