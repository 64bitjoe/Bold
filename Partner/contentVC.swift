//
//  contentVC.swift
//  Pods
//
//  Created by Joseph Speakman on 6/7/17.
//
//

import UIKit
import KDLoadingView

class contentVC: UIViewController {
    @IBOutlet weak var background: UIViewX!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingView: KDLoadingView!
    
    var colorArray: [(color1: UIColor, color2: UIColor)] = []
    var currentColorArrayIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorArray.append((color1: #colorLiteral(red: 0.6456442475, green: 0.1766524613, blue: 0.4605118632, alpha: 1), color2: #colorLiteral(red: 0.5258412361, green: 0.2297422588, blue: 0.5713472962, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5177843571, green: 0.2381471395, blue: 0.5753670931, alpha: 1), color2: #colorLiteral(red: 0.3595629334, green: 0.3395398259, blue: 0.671734333, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.3012412786, green: 0.3840449452, blue: 0.699493885, alpha: 1), color2: #colorLiteral(red: 0.1832991242, green: 0.4607815742, blue: 0.7348176837, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.1851225495, green: 0.4005402327, blue: 0.5792260766, alpha: 1), color2: #colorLiteral(red: 0.2878653407, green: 0.3467011452, blue: 0.4670861363, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.2880233526, green: 0.3428654671, blue: 0.4590970278, alpha: 1), color2: #colorLiteral(red: 0.4460355639, green: 0.3004589379, blue: 0.3407799602, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5221763253, green: 0.2722851038, blue: 0.3072229922, alpha: 1), color2: #colorLiteral(red: 0.657741487, green: 0.2311070561, blue: 0.2542709112, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.6935884356, green: 0.2097109258, blue: 0.2661354244, alpha: 1), color2: #colorLiteral(red: 0.7095819712, green: 0.1697179079, blue: 0.3290259242, alpha: 1)))
        
        transitionToColors()
        

        let url = URL(string: "https://partner.starbucks.com/")
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)

        // Do any additional setup after loading the view.
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
    func webViewDidStartLoad(_ : UIWebView) {
        loadingView.startAnimating()
        
    }
    func webViewDidFinishLoad(_ : UIWebView) {
        loadingView.stopAnimating()
    }

    
    @IBAction func goHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: false, completion: nil)

    }

}
