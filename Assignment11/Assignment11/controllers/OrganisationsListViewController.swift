

import Foundation
import UIKit
var arrayOfOrganisations : NSArray!
var organisation = Organisation()
class OrganisationsListViewController: UIViewController {
    
    @IBOutlet weak var tableViewOrganisationList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(animated: Bool) {
        
        arrayOfOrganisations = fetchAllRecordsFromEntity("Organisation")
        
        tableViewOrganisationList.reloadData()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK :- tableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(arrayOfOrganisations.count)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell! =
        tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if (cell == nil)
        {
            organisation.organisationName = arrayOfOrganisations.objectAtIndex(indexPath.row) .valueForKey("organisationName") as! String
            organisation.location = arrayOfOrganisations.objectAtIndex(indexPath.row) .valueForKey("location") as! String
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: cellIdentifier)
            cell.textLabel?.text = organisation.organisationName
            cell.detailTextLabel?.text = organisation.location
            
            
        }
        return cell
        
    }
    
    
    //MARK :- custom functions
    
    @IBAction func buttonAddDetailsAction(sender: AnyObject) {
        
        let addDetailsViewController
        = self.storyboard!.instantiateViewControllerWithIdentifier("AddDetailsViewController")
            as! AddDetailsViewController
        addDetailsViewController.friendsOrOrganisation = false
        self.navigationController!.pushViewController(addDetailsViewController, animated: true)
        
        
        
    }
}

