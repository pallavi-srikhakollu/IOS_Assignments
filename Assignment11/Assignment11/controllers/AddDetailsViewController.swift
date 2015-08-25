
import Foundation
import UIKit

let keysForPerson = ["firstName","contactNo"]
let keysForOrganisation = ["organisationName", "location"]
var valuesForKeys = Array<String>()
var dictionaryToinsert = Dictionary<String,AnyObject>()
var count :Int!
class AddDetailsViewController: UIViewController{
    
    @IBOutlet weak var textFieldContactNoOrLocation: UITextField!
    @IBOutlet weak var labelFirstNameOrOrganisationName: UILabel!
    @IBOutlet weak var textFieldFirstNameOrOrganisationName: UITextField!
    @IBOutlet weak var labelContactNoOrLocation: UILabel!
    var friendsOrOrganisation : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(friendsOrOrganisation == true){
            labelFirstNameOrOrganisationName.text = "First Name"
            labelContactNoOrLocation.text = "Contact No"
        }
        else{
            labelFirstNameOrOrganisationName.text = "Organisation Name"
            labelContactNoOrLocation.text = "Location"
            
        }
    }
    //Mark : Custom functions
    
    func createDicitonaryFromValue(keys:Array<String> , values:Array<String>) -> Dictionary<String,AnyObject>{
        count = 0
        for info in values{
            
            dictionaryToinsert[keys[count]] = info
            count = count+1
        }
        
        return dictionaryToinsert
        
    }
    
    func alertMessage(title:String , message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //Mark : button actions
    
    @IBAction func buttonAddDetails(sender: AnyObject) {
        
        if(textFieldFirstNameOrOrganisationName.text == "")
        {
            alertMessage("Empty field", message: " Enter " + labelFirstNameOrOrganisationName.text!)
        }
        else if(textFieldContactNoOrLocation.text == ""){
            alertMessage("Empty field", message: " Enter " + labelContactNoOrLocation.text!)
            
        }
        else{
            valuesForKeys.append(textFieldFirstNameOrOrganisationName.text)
            valuesForKeys.append(textFieldContactNoOrLocation.text)
            
            
            if(friendsOrOrganisation == true){
                
                dictionaryToinsert = createDicitonaryFromValue(keysForPerson, values: valuesForKeys)
                insertInEntity("Person", dataPairsTosave: dictionaryToinsert)
                
            }
                
            else{
                
                dictionaryToinsert = createDicitonaryFromValue(keysForOrganisation, values: valuesForKeys)
                insertInEntity("Organisation", dataPairsTosave: dictionaryToinsert)
                
            }
            
            self.navigationController?.popViewControllerAnimated(false)
        }
    }
    
    
}