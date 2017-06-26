//
//  passportVC.swift
//  Partner
//
//  Created by Joseph Speakman on 6/7/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
//

import UIKit
import KDLoadingView

class passportVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingView: KDLoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = URL(string: "https://passport.starbucks.com/")
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(_ : UIWebView) {
        loadingView.startAnimating()
        
    }
    func webViewDidFinishLoad(_ : UIWebView) {
        loadingView.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */
    @IBAction func goHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: false, completion: nil)
        
    }


}
