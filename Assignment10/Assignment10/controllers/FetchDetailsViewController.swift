
import Foundation
import UIKit


class FetchDetailsViewController: UIViewController{
    var dataFromURL : NSMutableData? = nil
    var activityIndicator  : UIActivityIndicatorView!
    var weatherInfo = WeatherInfo()
    let API_URL = "http://api.openweathermap.org/data/2.5/weather?q=London,uk"
    let labelOk = "OK"
     let keyName = "name"
    let keyMain = "main"
    let keyTemp_Min = "temp_min"
    let keyTemp_Max = "temp_max"
    let keyHumidity = "humidity"
    let alertTitleError = "Connection error"
    let alertTileFail = "Connection Fail"
    let alertMessageError = "something went wrong"
    let alertMessageFail = "Connection failed due to bad URl"
    
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
        alert.addAction(UIAlertAction(title: labelOk, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK :- Parsing function
    
    func parseJsonDataToDictonary (){
        var error: NSErrorPointer=nil
        if let weatherResult = (NSJSONSerialization.JSONObjectWithData(dataFromURL!, options: NSJSONReadingOptions.MutableContainers, error: error) as? NSMutableDictionary)
        {
            
            
            weatherInfo.name = weatherResult [keyName] as! String
            var temperatureInfo: Dictionary<String, AnyObject>
            
            temperatureInfo = weatherResult[keyMain] as! Dictionary
            
            weatherInfo.minimumTemperature = temperatureInfo [keyTemp_Min] as! Float
            
            weatherInfo.maximumTemperature = temperatureInfo [keyTemp_Max] as! Float
            weatherInfo.humidity = temperatureInfo [keyHumidity] as! Float
        }
        else{
            alertMessage(alertTitleError, message: alertMessageError)
        }
        
    }

    // MARK: - URLConnection
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        
        self.dataFromURL!.appendData(data)
            
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError){
        
        alertMessage(alertTileFail, message: alertMessageFail)
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