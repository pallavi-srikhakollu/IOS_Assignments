
import Foundation
import UIKit


class FetchDetailsViewController: UIViewController{
    var dataFromURL : NSMutableData? = nil
    var activityIndicator  : UIActivityIndicatorView!
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
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0, 320, 568) ) as UIActivityIndicatorView
        activityIndicator.backgroundColor =  UIColor(white: 1.0 , alpha: 1)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
    }
    // MARK: - fetch Details function
    
    @IBAction func buttonFetchDetails(sender: UIButton) {
        
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string:API_URL)
        request.HTTPMethod = "GET"
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        dataFromURL = NSMutableData()
        connection.start()
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
    }
    
    func alertMessage(title:String , message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK :- Parsing function
    
    func parseJsonDataToDictonary (){
        var error: NSErrorPointer=nil
        if let weatherResult = (NSJSONSerialization.JSONObjectWithData(dataFromURL!, options: NSJSONReadingOptions.MutableContainers, error: error) as? NSMutableDictionary)
        {
            
            
            weatherInfo.name = weatherResult ["name"] as! String
            var temperatureInfo: Dictionary<String, AnyObject>
            
            temperatureInfo = weatherResult["main"] as! Dictionary
            
            weatherInfo.minimumTemperature = temperatureInfo ["temp_min"] as! Float
            
            weatherInfo.maximumTemperature = temperatureInfo ["temp_max"] as! Float
            weatherInfo.humidity = temperatureInfo ["humidity"] as! Float
        }
        else{
            alertMessage("Connection error", message: "something went wrong")
        }
        
    }

    // MARK: - URLConnection
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        
        self.dataFromURL!.appendData(data)
            
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError){
        
        alertMessage("Connection Fail", message: "Connection failed due to bad URl")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!)
    {
        
        
        let displayDetailsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DisplayDetailsViewController")
            as! DisplayDetailsViewController
        
            parseJsonDataToDictonary()
            
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            displayDetailsViewController.weatherInformation = weatherInfo
            
            self.navigationController!.pushViewController(displayDetailsViewController, animated: false)
        
    }
    
    
    
}