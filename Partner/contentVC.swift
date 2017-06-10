//
//  contentVC.swift
//  Pods
//
//  Created by Joseph Speakman on 6/7/17.
//
//

import UIKit

class contentVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://partner.starbucks.com/")
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)

    }

}
