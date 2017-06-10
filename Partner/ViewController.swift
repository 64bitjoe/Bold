//
//  ViewController.swift
//  scheduleScrape
//
//  Created by Joseph Speakman on 4/25/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
// , UITableViewDelegate, UITableViewDataSource

import UIKit
import PullToRefresh
import SCLAlertView

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    // CONTSTANTS
    let refresher = PullToRefresh()
    var dateFormatter = DateFormatter()
    var storenumber = [String!]()
    var shifttime = [String!]()
    var shiftdate = [String!]()
    var dateicon = [String!]()
    var datelabel = [String!]()
    
    //IMPORTS
    @IBOutlet weak var tableView: UITableView!
    
    //ON VIEW FIRST LOAD
    override func viewDidLoad() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(vc!, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
         super.viewDidLoad()
        let defaults = UserDefaults.standard
        datelabel = [defaults.string(forKey: "monday0date"), defaults.string(forKey: "tues0date"), defaults.string(forKey: "wed0date"), defaults.string(forKey: "thur0date"), defaults.string(forKey: "fri0date"), defaults.string(forKey: "sat0date"), defaults.string(forKey: "sun0date"), defaults.string(forKey: "monday1date"), defaults.string(forKey: "tues1date"), defaults.string(forKey: "wed1date"), defaults.string(forKey: "thur1date"), defaults.string(forKey: "fri1date"), defaults.string(forKey: "sat1date"), defaults.string(forKey: "sun1date") ]
        storenumber = [defaults.string(forKey: "monday0store"), defaults.string(forKey: "tues0store"), defaults.string(forKey: "wed0store"), defaults.string(forKey: "thur0store"), defaults.string(forKey: "fri0store"),  defaults.string(forKey: "sat0store"),  defaults.string(forKey: "sun0store"), defaults.string(forKey: "monday1store"), defaults.string(forKey: "tues1store"), defaults.string(forKey: "wed1store"), defaults.string(forKey: "thur1store"), defaults.string(forKey: "fri1store"),  defaults.string(forKey: "sat1store"),  defaults.string(forKey: "sun1store")]

        shifttime = [defaults.string(forKey: "monday0time"), defaults.string(forKey: "tues0time"), defaults.string(forKey: "wed0time"), defaults.string(forKey: "thur0time"), defaults.string(forKey: "fri0time"), defaults.string(forKey: "sat0time"),  defaults.string(forKey: "sun0time"), defaults.string(forKey: "monday1time"), defaults.string(forKey: "tues1time"), defaults.string(forKey: "wed1time"), defaults.string(forKey: "thur1time"), defaults.string(forKey: "fri1time"), defaults.string(forKey: "sat1time"),  defaults.string(forKey: "sun1time")]
        dateicon = ["MONDAY" , "TUESDAY", "WEDNESDAY" , "THURSDAY", "FRIDAY" , "SATURDAY","SUNDAY", "MONDAY" , "TUESDAY", "WEDNESDAY" , "THURSDAY", "FRIDAY" , "SATURDAY","SUNDAY"]
    }



    
    //    //TABLE VIEW CODE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.addPullToRefresh(refresher) {


            self.alertTest()

        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "layout", for: indexPath) as! ScheduleTableViewCell
        let row = indexPath.row
        cell.shiftStore.text = storenumber[row]
        cell.shiftTime.text = shifttime[row]
        cell.DayNumber.image = UIImage(named:self.dateicon[indexPath.row])
        cell.dateLabel.text = datelabel[row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBAction func reloadTableView(_ sender: Any) {
        tableView.reloadData()
    }



    /// UPDATE SCHEDULE ALERT ACTION SHEET
    func alertTest () {
    
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
    
            showCloseButton: false
            
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton("YES"){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(vc!, animated: true, completion: nil)
        }
        alertView.addButton("NO") {
            print("NOT GOING ANYWHER!")
            
        }
        alertView.showWait("Update Schedule?", subTitle: "Are You Sure? This will Erase Schedule Listed. You will be Propted to login again.")
    }
    @IBAction func goHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
    }
    
 }
