//
//  ViewController.swift
//  scheduleScrape
//
//  Created by Joseph Speakman on 4/25/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
// , UITableViewDelegate, UITableViewDataSource

import UIKit
import Kanna

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var storenumber = [String]()
    var shifttime = [String!]()
    var shiftdate = [String!]()
    var dateicon = [String!]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var webViewContainer: UIView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        let mon0store = defaults.string(forKey: "monday0store")
        let tue0store = defaults.string(forKey: "tues0store")
        let wed0store = defaults.string(forKey: "wed0store")
        let thu0store = defaults.string(forKey: "thur0store")
        let fri0store = defaults.string(forKey: "fri0store")
        let sat0store = defaults.string(forKey: "sat0store")
        let sun0store = defaults.string(forKey: "sun0store")
        storenumber = [mon0store!, tue0store!, wed0store!, thu0store!, fri0store! , sat0store!, sun0store!]
        let mon0time = defaults.string(forKey: "monday0time")
        let tue0time = defaults.string(forKey: "tues0time")
        let wed0time = defaults.string(forKey: "wed0time")
        let thur0time = defaults.string(forKey: "thur0time")
        let fri0time = defaults.string(forKey: "fri0time")
        let sat0time = defaults.string(forKey: "sat0time")
        let sun0time = defaults.string(forKey: "sun0time")
        shifttime = [mon0time, tue0time, wed0time, thur0time, fri0time, sat0time,  sun0time]
        dateicon = ["MONDAY" , "TUESDAY", "WEDNESDAY" , "THURSDAY", "FRIDAY" , "SATURDAY ","SUNDAY"]
        super.viewDidLoad()

    }
    func webViewDidStartLoad(_ : UIWebView) {
        print("LOAD START")
        
    }

    
    //    //TABLE VIEW CODE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "layout", for: indexPath) as! ScheduleTableViewCell
        let row = indexPath.row
        cell.shiftStore.text = storenumber[row]
        cell.shiftTime.text = shifttime[row]
        cell.DayNumber.image = UIImage(named:self.dateicon[indexPath.row])
        //        cell.attractionImage.image = UIImage(named: attractionImages[row])
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reloadTableView(_ sender: Any) {
        tableView.reloadData()
    }
    
    @IBAction func showWebView(_ sender: Any) {
        if webViewContainer.isHidden == true {
            webViewContainer.isHidden = false
        } else {
            webViewContainer.isHidden = true
        }
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
        tableView.reloadData()
    }
    
}
