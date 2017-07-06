 import UIKit
import SwiftyJSON
import Alamofire
 
// protocol movieData {
//    func userInformation(movies : JSON);
// }
class ViewController: UIViewController {
    
   
    @IBOutlet weak var hiddenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
//    var delegate : movieData? = nil;
    
    @IBOutlet weak var DirectorField: UITextField!
    @IBOutlet weak var ActorField: UITextField!
    @IBOutlet weak var movieName: UILabel!
    @IBAction func Search(_ sender: Any) {
        let apiToContact = "http://netflixroulette.net/api/api.php"
        
        var parameters: Parameters = [ : ];
        if DirectorField.text != nil{
            parameters["director"] = DirectorField.text;
        }
        if ActorField.text != nil{
            parameters["actor"] = ActorField.text;
        }
        
        if (ActorField.text == "" && DirectorField.text == ""){
            movieName.text = "Please enter an actor or director."
        }
        
        
        
        
        
        Alamofire.request(apiToContact, parameters: parameters).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    
                    print(json)
                    self.hiddenLabel.text = json.stringValue;
                    
//                        self.delegate?.userInformation(movies: json);
                    
                    
                    let randomInt = arc4random_uniform(UInt32(json.count))
                    self.movieName.text = json[Int(randomInt)]["show_title"].stringValue
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
    }
   
   
    
}
 
