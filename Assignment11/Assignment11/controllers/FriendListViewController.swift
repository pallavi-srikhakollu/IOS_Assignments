

import Foundation

import UIKit
let cellIdentifier = "cell"
var arrayOfPersons : NSArray!
var person = Person()

class FriendListViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate  {
    
    @IBOutlet weak var tableViewFriendList: UITableView!

    //Mark: View Controller function
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.navigationBarHidden = false

    }
    
    override func viewWillAppear(animated: Bool) {
        
   arrayOfPersons = fetchAllRecordsFromEntity("Person")
    
    tableViewFriendList.reloadData()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
   //MARK :- Table view
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return(arrayOfPersons.count)
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
              
        var cell:UITableViewCell! =
        tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
               if (cell == nil)
        {
            person.firstName = arrayOfPersons.objectAtIndex(indexPath.row) .valueForKey("firstName") as! String
            person.contactNo = arrayOfPersons.objectAtIndex(indexPath.row) .valueForKey("contactNo") as! String

            println(person.firstName)
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: cellIdentifier)
             cell.textLabel?.text = person.firstName
             cell.detailTextLabel?.text = person.contactNo
        }
        
        return cell;
        
        
    }
    
    //MARK :- button click function
    
    @IBAction func buttonAddDetailsOnPress(sender: AnyObject) {
        let addDetailsViewController
        = self.storyboard!.instantiateViewControllerWithIdentifier("AddDetailsViewController")
            as! AddDetailsViewController
        addDetailsViewController.friendsOrOrganisation = true
        self.navigationController!.pushViewController(addDetailsViewController, animated: true)
        
    }

}

