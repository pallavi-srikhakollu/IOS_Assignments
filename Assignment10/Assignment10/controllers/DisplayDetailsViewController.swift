
import Foundation
import UIKit

class DisplayDetailsViewController: UIViewController{
    
    @IBOutlet weak var labelMinimumTemperature: UILabel!
    @IBOutlet weak var labelMaximumTemperature: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    var weatherInformation = WeatherInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = weatherInformation.name
        labelHumidity.text = weatherInformation.humidity.description
        labelMaximumTemperature.text = weatherInformation.minimumTemperature.description
        labelMinimumTemperature.text = weatherInformation.maximumTemperature.description
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
}