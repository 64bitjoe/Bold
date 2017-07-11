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
    @IBOutlet weak var background: UIViewX!
    // CONTSTANTS
    let refresher = PullToRefresh()
    var dateFormatter = DateFormatter()
    var storenumber = [String!]()
    var shifttime = [String!]()
    var shiftdate = [String!]()
    var dateicon = [String!]()
    var datelabel = [String!]()
    var colorArray: [(color1: UIColor, color2: UIColor)] = []
    var currentColorArrayIndex = -1
    
    //IMPORTS
    @IBOutlet weak var tableView: UITableView!
    
    //ON VIEW FIRST LOAD
    override func viewDidLoad() {

        colorArray.append((color1: #colorLiteral(red: 0.6456442475, green: 0.1766524613, blue: 0.4605118632, alpha: 1), color2: #colorLiteral(red: 0.5258412361, green: 0.2297422588, blue: 0.5713472962, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5177843571, green: 0.2381471395, blue: 0.5753670931, alpha: 1), color2: #colorLiteral(red: 0.3595629334, green: 0.3395398259, blue: 0.671734333, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.3012412786, green: 0.3840449452, blue: 0.699493885, alpha: 1), color2: #colorLiteral(red: 0.1832991242, green: 0.4607815742, blue: 0.7348176837, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.1851225495, green: 0.4005402327, blue: 0.5792260766, alpha: 1), color2: #colorLiteral(red: 0.2878653407, green: 0.3467011452, blue: 0.4670861363, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.2880233526, green: 0.3428654671, blue: 0.4590970278, alpha: 1), color2: #colorLiteral(red: 0.4460355639, green: 0.3004589379, blue: 0.3407799602, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5221763253, green: 0.2722851038, blue: 0.3072229922, alpha: 1), color2: #colorLiteral(red: 0.657741487, green: 0.2311070561, blue: 0.2542709112, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.6935884356, green: 0.2097109258, blue: 0.2661354244, alpha: 1), color2: #colorLiteral(red: 0.7095819712, green: 0.1697179079, blue: 0.3290259242, alpha: 1)))
        
        transitionToColors()

        
        DispatchQueue.main.async {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launched")
        if launchedBefore  {
            print("Not first launch.")
        } else {
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                
                showCloseButton: false
                
            )

            let alertView = SCLAlertView(appearance: appearance)
            alertView.addButton("Log Me In!"){
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
                self.present(vc!, animated: true, completion: nil)
                UserDefaults.standard.set(true, forKey: "launched")
                
                let dateFormatter = DateFormatter()
                let timeFormatter = DateFormatter()
                
                dateFormatter.dateStyle = .long
                timeFormatter.timeStyle = .long
                
                
                let  dateLabel = dateFormatter.string(from: NSDate() as Date)
                let timeLabel = timeFormatter.string(from: NSDate() as Date)
                UserDefaults.standard.set(dateLabel, forKey: "datelabel")
                UserDefaults.standard.set(timeLabel, forKey: "timelabel")
            }
            alertView.showSuccess("Welcome!", subTitle: "We need to grab the schedule. Press \"Log Me in \"to Get Started!")

            
        }
         super.viewDidLoad()
        let defaults = UserDefaults.standard
        self.datelabel = [defaults.string(forKey: "monday0date"), defaults.string(forKey: "tues0date"), defaults.string(forKey: "wed0date"), defaults.string(forKey: "thur0date"), defaults.string(forKey: "fri0date"), defaults.string(forKey: "sat0date"), defaults.string(forKey: "sun0date"), defaults.string(forKey: "monday1date"), defaults.string(forKey: "tues1date"), defaults.string(forKey: "wed1date"), defaults.string(forKey: "thur1date"), defaults.string(forKey: "fri1date"), defaults.string(forKey: "sat1date"), defaults.string(forKey: "sun1date") ]
        self.storenumber = [defaults.string(forKey: "monday0store"), defaults.string(forKey: "tues0store"), defaults.string(forKey: "wed0store"), defaults.string(forKey: "thur0store"), defaults.string(forKey: "fri0store"),  defaults.string(forKey: "sat0store"),  defaults.string(forKey: "sun0store"), defaults.string(forKey: "monday1store"), defaults.string(forKey: "tues1store"), defaults.string(forKey: "wed1store"), defaults.string(forKey: "thur1store"), defaults.string(forKey: "fri1store"),  defaults.string(forKey: "sat1store"),  defaults.string(forKey: "sun1store")]

        self.shifttime = [defaults.string(forKey: "monday0time"), defaults.string(forKey: "tues0time"), defaults.string(forKey: "wed0time"), defaults.string(forKey: "thur0time"), defaults.string(forKey: "fri0time"), defaults.string(forKey: "sat0time"),  defaults.string(forKey: "sun0time"), defaults.string(forKey: "monday1time"), defaults.string(forKey: "tues1time"), defaults.string(forKey: "wed1time"), defaults.string(forKey: "thur1time"), defaults.string(forKey: "fri1time"), defaults.string(forKey: "sat1time"),  defaults.string(forKey: "sun1time")]
        self.dateicon = ["MONDAY" , "TUESDAY", "WEDNESDAY" , "THURSDAY", "FRIDAY" , "SATURDAY","SUNDAY", "MONDAY" , "TUESDAY", "WEDNESDAY" , "THURSDAY", "FRIDAY" , "SATURDAY","SUNDAY"]
        }
    }
    //   COLOR BACKGROUND
    func transitionToColors() {
        currentColorArrayIndex = currentColorArrayIndex == (colorArray.count - 1) ? 0 : currentColorArrayIndex + 1
        
        UIView.transition(with: background, duration: 3.2, options: [.transitionCrossDissolve], animations: {
            self.background.firstColor = self.colorArray[self.currentColorArrayIndex].color1
            self.background.secondColor = self.colorArray[self.currentColorArrayIndex].color2
        }) { (success) in
            self.transitionToColors()
        }
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
            kTextFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
    
            showCloseButton: true
            
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton("Yes"){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(vc!, animated: true, completion: nil)
        }
        alertView.showNotice("Update Schedule?", subTitle: "Are You Sure? This will Erase Schedule Listed. You will be Propted to login again.")
    }
    @IBAction func goHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: false, completion: nil)
    }
    @IBAction func timeUpdate(_ sender: Any) {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            
            showCloseButton: true

        )
        let alertView = SCLAlertView(appearance: appearance)
        let date = UserDefaults.standard.string(forKey: "datelabel")
        let time = UserDefaults.standard.string(forKey: "timelabel")
        alertView.showInfo("Last Update", subTitle: "Date: " + date! + " Time: " + time!)
    }
    
 }
