
import UIKit
import SwiftyJSON
import Alamofire
import MBProgressHUD
// protocol movieData {
//    func userInformation(movies : JSON);
// }
class ViewController: UIViewController {
    
   
    @IBOutlet weak var hiddenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var storeJSON : JSON? = nil
//    var delegate : movieData? = nil;
    
    @IBOutlet weak var DirectorField: UITextField!
    @IBOutlet weak var ActorField: UITextField!
    @IBOutlet weak var movieName: UILabel!
    
    
    func getJson(apiToContact: String, parameters: Parameters ) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(apiToContact, parameters: parameters).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
        
                    self.storeJSON = JSON(value)
                    
                    
                    print(self.storeJSON!)
                    self.hiddenLabel.text = self.storeJSON?[0]["show_title"].stringValue
                    
                    //self.delegate?.userInformation(movies: json);

                    
                    let randomInt = arc4random_uniform(UInt32((self.storeJSON?.count)!))
                    self.movieName.text = self.storeJSON?[Int(randomInt)]["show_title"].stringValue
                    self.performSegue(withIdentifier: "toWheel", sender: self)
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
       
        
    }
   
    @IBAction func Search(_ sender: Any) {
        let apiToContact = "http://netflixroulette.net/api/api.php"
        
        var parameters: Parameters = [ : ]
        if DirectorField.text != nil{
            parameters["director"] = DirectorField.text
        }
        if ActorField.text != nil{
            parameters["actor"] = ActorField.text
        }
        
        if (ActorField.text == "" && DirectorField.text == ""){
            movieName.text = "Please enter an actor or director."
        }
        

        
        
       getJson(apiToContact: apiToContact, parameters: parameters )
        
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWheel"{
            let motionMovement : WheelViewController = segue.destination as! WheelViewController
            motionMovement.testString = (storeJSON?[0]["show_title"].stringValue)!
            
            
        }
    }
   
   
    
}
 
