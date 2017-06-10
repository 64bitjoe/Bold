//
//  HomeScreenControllerViewController.swift
//  
//
//  Created by Joseph Speakman on 6/4/17.
//
//

import UIKit

class HomeScreenControllerViewController: UIViewController , UITableViewDelegate, UITableViewDataSource /* cellDelegate */{
@IBOutlet weak var tableView: UITableView!
    
    var actions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        cell.indexPath = indexPath
        return cell
    }
    
    @IBAction func submit(_ sender: UIButton) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        // We've got the index path for the cell that contains the button, now do something with it.
        print("button is in row \(indexPath.row)")
        if indexPath.row == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "View")
            self.present(vc!, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "coffeePassportVC")
            self.present(vc!, animated: true, completion: nil)

        }else if indexPath.row == 2 {

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PartnerHubVC")
            self.present(vc!, animated: true, completion: nil)
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


    func schedule(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "View")
        self.present(vc!, animated: true, completion: nil)
    }
}
