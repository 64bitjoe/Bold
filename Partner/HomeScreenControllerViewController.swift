//
//  HomeScreenControllerViewController.swift
//  
//
//  Created by Joseph Speakman on 6/4/17.
//
//

import UIKit
import SCLAlertView
import ConfettiView

class HomeScreenControllerViewController: UIViewController , UITableViewDelegate, UITableViewDataSource /* cellDelegate */{
    @IBOutlet weak var background: UIViewX!
    @IBOutlet weak var cV: UIView!
    
@IBOutlet weak var tableView: UITableView!
    
    var actions = [String]()
    var cellbackground = [UIImage]()
    var colorArray: [(color1: UIColor, color2: UIColor)] = []
    var currentColorArrayIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cV.isHidden = true

        colorArray.append((color1: #colorLiteral(red: 0.6456442475, green: 0.1766524613, blue: 0.4605118632, alpha: 1), color2: #colorLiteral(red: 0.5258412361, green: 0.2297422588, blue: 0.5713472962, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5177843571, green: 0.2381471395, blue: 0.5753670931, alpha: 1), color2: #colorLiteral(red: 0.3595629334, green: 0.3395398259, blue: 0.671734333, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.3012412786, green: 0.3840449452, blue: 0.699493885, alpha: 1), color2: #colorLiteral(red: 0.1832991242, green: 0.4607815742, blue: 0.7348176837, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.1851225495, green: 0.4005402327, blue: 0.5792260766, alpha: 1), color2: #colorLiteral(red: 0.2878653407, green: 0.3467011452, blue: 0.4670861363, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.2880233526, green: 0.3428654671, blue: 0.4590970278, alpha: 1), color2: #colorLiteral(red: 0.4460355639, green: 0.3004589379, blue: 0.3407799602, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5221763253, green: 0.2722851038, blue: 0.3072229922, alpha: 1), color2: #colorLiteral(red: 0.657741487, green: 0.2311070561, blue: 0.2542709112, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.6935884356, green: 0.2097109258, blue: 0.2661354244, alpha: 1), color2: #colorLiteral(red: 0.7095819712, green: 0.1697179079, blue: 0.3290259242, alpha: 1)))
        
        transitionToColors()
        
        cellbackground = [#imageLiteral(resourceName: "Schedule"), #imageLiteral(resourceName: "Coffee Passport"), #imageLiteral(resourceName: "Partner Hub") , #imageLiteral(resourceName: "About"), #imageLiteral(resourceName: "i") ]
        actions = ["Schedule", "Coffee Passport", "Partner Hub", "Settings", "About"]
        // Do any additional setup after loading the view.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        return 5
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
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "settings")
            self.present(vc!, animated: false, completion: nil)
        } else if indexPath.row == 4 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "about")
            self.present(vc!, animated: false, completion: nil)
            if cV.isHidden == true {
                cV.isHidden = false
                self.cV.isHidden = true
                }

        }

    }


}
