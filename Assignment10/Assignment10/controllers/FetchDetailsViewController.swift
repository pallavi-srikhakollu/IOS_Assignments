
import Foundation
import UIKit


class FetchDetailsViewController: UIViewController{
    var dataFromURL : NSMutableData? = nil
    var actInd  : UIActivityIndicatorView?
    var weatherInfo = WeatherInfo()
    let API_URL = "http://api.openweathermap.org/data/2.5/weather?q=London,uk"
    
    // MARK: - URLConnection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorPropertiesIntialisation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - activity indicator customization function
    
    func activityIndicatorPropertiesIntialisation()
    {
        actInd = UIActivityIndicatorView(frame: CGRectMake(0,0, 320, 568) ) as UIActivityIndicatorView
        actInd!.backgroundColor =  UIColor(white: 1.0 , alpha: 1)
        actInd!.center = self.view.center
        actInd!.hidesWhenStopped = true
        actInd!.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
    }
    // MARK: - fetch Details function
    
    @IBAction func buttonFetchDetails(sender: UIButton) {
        
        var url : String = API_URL
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        dataFromURL = NSMutableData()
        connection.start()
        view.addSubview(actInd!)
        actInd!.startAnimating()
        
        
    }
    func alertMessage(title:String , message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - URLConnection
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        
        self.dataFromURL!.appendData(data)
        println(data)
        
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError){
        
        alertMessage("Connection Fail", message: "Connection failed due to bad URl")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!)
    {
        
        
        let displayDetailsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DisplayDetailsViewController")
            as! DisplayDetailsViewController
        
            parseJsonDataToDictonary()
            
            actInd!.stopAnimating()
            displayDetailsViewController.weatherInformation = weatherInfo
            
            self.navigationController!.pushViewController(displayDetailsViewController, animated: false)
        
    }
    
    
    func parseJsonDataToDictonary (){
        var error: NSErrorPointer=nil
        var weatherResult: NSMutableDictionary = (NSJSONSerialization.JSONObjectWithData(dataFromURL!, options: NSJSONReadingOptions.MutableContainers, error: error) as? NSMutableDictionary)!
        
        weatherInfo.name = weatherResult ["name"] as! String
        var temperatureInfo: Dictionary<String, AnyObject>

        temperatureInfo = weatherResult["main"] as! Dictionary
        
        weatherInfo.minimumTemperature = temperatureInfo ["temp_min"] as! Float
        
        weatherInfo.maximumTemperature = temperatureInfo ["temp_max"] as! Float
        weatherInfo.humidity = temperatureInfo ["humidity"] as! Float
        
    }
    
}