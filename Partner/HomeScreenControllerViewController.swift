//
//  HomeScreenControllerViewController.swift
//  
//
//  Created by Joseph Speakman on 6/4/17.
//
//

import UIKit
import SCLAlertView

class HomeScreenControllerViewController: UIViewController , UITableViewDelegate, UITableViewDataSource /* cellDelegate */{
@IBOutlet weak var tableView: UITableView!
    
    var actions = [String]()
    var cellbackground = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cellbackground = [#imageLiteral(resourceName: "Schedule"), #imageLiteral(resourceName: "Coffee Passport"), #imageLiteral(resourceName: "Partner Hub") , #imageLiteral(resourceName: "About")]
        actions = ["Shedule", "Coffee Passport", "Partner Hub", "About"]
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    //TABLE VIEW CODE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HSCell", for: indexPath) as! HomeTableViewCell
        let row = indexPath.row
        cell.action.text = actions[row]
//        cell.cellDelegate = self
        cell.cellback.image = cellbackground[row]
        cell.indexPath = indexPath
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Schedule Tapped")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "View")
            self.present(vc!, animated: false, completion: nil)

        }  else if indexPath.row == 1 {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "coffeePassportVC")
            self.present(vc!, animated: false, completion: nil)
            
        } else if indexPath.row == 2 {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PartnerHubVC")
            self.present(vc!, animated: false, completion: nil)
        }
        else if indexPath.row == 3 {
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                
                showCloseButton: true
                
            )
            let alertView = SCLAlertView(appearance: appearance)
            alertView.showNotice("Soon!", subTitle: "Working on it!")
            // let vc = self.storyboard?.instantiateViewController(withIdentifier: "about")
            // self.present(vc!, animated: false, completion: nil)
            
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
