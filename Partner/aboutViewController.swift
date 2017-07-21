//
//  aboutViewController.swift
//  Partner
//
//  Created by Joseph Speakman on 6/9/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func home(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: false, completion: nil)
    }
    @IBAction func senderreset(_ sender: Any) {
        resetDefaults()
    }

    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        defaults.synchronize()
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
