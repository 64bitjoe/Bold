//
//  ViewController.swift
//  scheduleScrape
//
//  Created by Joseph Speakman on 4/25/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
// , UITableViewDelegate, UITableViewDataSource

import UIKit
import Kanna
import PullToRefresh
import SCLAlertView

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    let refresher = PullToRefresh()
    var dateFormatter = DateFormatter()
    var storenumber = [String!]()
    var shifttime = [String!]()
    var shiftdate = [String!]()
    var dateicon = [String!]()
    var datelabel = [String!]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var webViewContainer: UIView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        let defaults = UserDefaults.standard
        datelabel = [defaults.string(forKey: "monday0date"), defaults.string(forKey: "tues0date"), defaults.string(forKey: "wed0date"), defaults.string(forKey: "thur0date"), defaults.string(forKey: "fri0date"), defaults.string(forKey: "sat0date"), defaults.string(forKey: "sun0date") ]
        storenumber = [defaults.string(forKey: "monday0store"), defaults.string(forKey: "tues0store"), defaults.string(forKey: "wed0store"), defaults.string(forKey: "thur0store"), defaults.string(forKey: "fri0store"),  defaults.string(forKey: "sat0store"),  defaults.string(forKey: "sun0store")]

        shifttime = [defaults.string(forKey: "monday0time"), defaults.string(forKey: "tues0time"), defaults.string(forKey: "wed0time"), defaults.string(forKey: "thur0time"), defaults.string(forKey: "fri0time"), defaults.string(forKey: "sat0time"),  defaults.string(forKey: "sun0time")]
        dateicon = ["MONDAY" , "TUESDAY", "WEDNESDAY" , "THURSDAY", "FRIDAY" , "SATURDAY","SUNDAY"]
    }



    
    //    //TABLE VIEW CODE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.addPullToRefresh(refresher) {

        //    self.downloadSchedule()
         
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


    @IBAction func clearUserDefaults(_ sender: Any) {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: "monday0time")
    defaults.removeObject(forKey: "tue0time")
    defaults.removeObject(forKey: "wed0time")
    defaults.removeObject(forKey: "thur0time")
    defaults.removeObject(forKey: "fri0time")
    defaults.removeObject(forKey: "sat0time")
    defaults.removeObject(forKey: "sun0time")
    DispatchQueue.main.async {
    self.tableView.reloadData()
    
    }
        }
    func alertTest () {
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }
    
    func downloadSchedule() {
        let alertController = UIAlertController(title: "Update Schedule?", message: "Are You Sure? This Erase All Content And Pull New Content", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            print("NO")
            self.dismiss(animated: true, completion: nil)
            }))
        alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            //segue To WebView
            
            self.dismiss(animated: true, completion: nil)
        }))

        self.present(alertController, animated: true, completion: nil)
    }
 }
