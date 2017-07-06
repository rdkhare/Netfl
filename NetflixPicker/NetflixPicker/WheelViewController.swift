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
    
    var testString = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wheel.makeCircle()
        wheel.backgroundColor = UIColor.cyan
        testLabel.text = testString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func userInformation(movies: JSON) {
//        testLabel.text = movies[0]["show_title"].stringValue
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWheel"{
            //let vc : ViewController = segue.destination as! ViewController;
            let motionMovement : WheelViewController = segue.destination as! WheelViewController
            motionMovement.testString = testLabel.text!
            
            
        }
    }
}
