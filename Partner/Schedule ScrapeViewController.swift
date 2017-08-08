//
//  Schedule ScrapeViewController.swift
//  Partner
//
//  Created by Joseph Speakman on 5/17/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
// https://joeis.xyz/wp-content/uploads/2017/04/SHIFTTEMPLATE.html
// https://mysite.starbucks.com/MySchedule/Schedule.aspx

import UIKit
import Kanna
import KDLoadingView

class Schedule_ScrapeViewController: UIViewController {
    @IBOutlet weak var waitBackground: UIViewX!
    @IBOutlet weak var background: UIViewX!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingViewCont: UIView!
    @IBOutlet weak var loadingView: KDLoadingView!
    @IBOutlet weak var labelforWait: UILabel!
    
    var colorArray: [(color1: UIColor, color2: UIColor)] = []
    var currentColorArrayIndex = -1
    let mysite = String("https://mysite.starbucks.com/MySchedule/Schedule.aspx")
    override func viewDidLoad() {
        
        colorArray.append((color1: #colorLiteral(red: 0.6456442475, green: 0.1766524613, blue: 0.4605118632, alpha: 1), color2: #colorLiteral(red: 0.5258412361, green: 0.2297422588, blue: 0.5713472962, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5177843571, green: 0.2381471395, blue: 0.5753670931, alpha: 1), color2: #colorLiteral(red: 0.3595629334, green: 0.3395398259, blue: 0.671734333, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.3012412786, green: 0.3840449452, blue: 0.699493885, alpha: 1), color2: #colorLiteral(red: 0.1832991242, green: 0.4607815742, blue: 0.7348176837, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.1851225495, green: 0.4005402327, blue: 0.5792260766, alpha: 1), color2: #colorLiteral(red: 0.2878653407, green: 0.3467011452, blue: 0.4670861363, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.2880233526, green: 0.3428654671, blue: 0.4590970278, alpha: 1), color2: #colorLiteral(red: 0.4460355639, green: 0.3004589379, blue: 0.3407799602, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.5221763253, green: 0.2722851038, blue: 0.3072229922, alpha: 1), color2: #colorLiteral(red: 0.657741487, green: 0.2311070561, blue: 0.2542709112, alpha: 1)))
        colorArray.append((color1: #colorLiteral(red: 0.6935884356, green: 0.2097109258, blue: 0.2661354244, alpha: 1), color2: #colorLiteral(red: 0.7095819712, green: 0.1697179079, blue: 0.3290259242, alpha: 1)))
        
        
        self.loadingViewCont.isHidden = true
        self.loadingView.isHidden = true
        super.viewDidLoad()
        // webView suff
        let url = URL(string: mysite!)
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        timeFormatter.timeStyle = .long
        
        
        let  dateLabel = dateFormatter.string(from: NSDate() as Date)
        let timeLabel = timeFormatter.string(from: NSDate() as Date)
        UserDefaults.standard.set(dateLabel, forKey: "datelabel")
        UserDefaults.standard.set(timeLabel, forKey: "timelabel")
        
    }
    func transitionToColors() {
        currentColorArrayIndex = currentColorArrayIndex == (colorArray.count - 1) ? 0 : currentColorArrayIndex + 1
        
        UIView.transition(with: background, duration: 1.5, options: [.transitionCrossDissolve], animations: {
            self.background.firstColor = self.colorArray[self.currentColorArrayIndex].color1
            self.background.secondColor = self.colorArray[self.currentColorArrayIndex].color2
            self.waitBackground.firstColor = self.colorArray[self.currentColorArrayIndex].color1
            self.waitBackground.secondColor = self.colorArray[self.currentColorArrayIndex].color2
        }) { (success) in
            self.transitionToColors()
        }
    }
    
    func webViewDidStartLoad(_ : UIWebView) {
        print("LOAD START")
        
    }
    func webViewDidFinishLoad(_ : UIWebView) {
        
        //   print(webView.request!.mainDocumentURL!)
        let currentURL: String = (webView.request!.url!.relativeString)
        //THIS WORKS!
        if currentURL == mysite {
            
            labelforWait.text = "Hey! We are looking for your schedule."
            transitionToColors()
            self.loadingViewCont.isHidden = false
            self.loadingView.isHidden = false
            self.loadingView.startAnimating()
            let url = NSURL(string: mysite!)
            let html  =  webView.stringByEvaluatingJavaScript(from: "document.documentElement.outerHTML")
            let delayInSeconds = 5.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                
                
                if url != nil {
                    let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
                        if error == nil {
                            
                            let defaults = UserDefaults.standard
                            
                            defaults.removeObject(forKey: "monday0time")
                            defaults.removeObject(forKey: "monday0store")
                            defaults.removeObject(forKey: "monday0date")
                            defaults.removeObject(forKey: "tue0time")
                            defaults.removeObject(forKey: "tue0store")
                            defaults.removeObject(forKey: "tue0date")
                            defaults.removeObject(forKey: "wed0time")
                            defaults.removeObject(forKey: "wed0store")
                            defaults.removeObject(forKey: "wed0date")
                            defaults.removeObject(forKey: "thur0time")
                            defaults.removeObject(forKey: "thur0store")
                            defaults.removeObject(forKey: "thur0date")
                            defaults.removeObject(forKey: "fri0time")
                            defaults.removeObject(forKey: "fri0store")
                            defaults.removeObject(forKey: "fri0date")
                            defaults.removeObject(forKey: "sat0time")
                            defaults.removeObject(forKey: "sat0store")
                            defaults.removeObject(forKey: "sat0date")
                            defaults.removeObject(forKey: "sun0time")
                            defaults.removeObject(forKey: "sun0date")
                            defaults.removeObject(forKey: "sun0store")
                            
                            // WK1
                            defaults.removeObject(forKey: "monday1time")
                            defaults.removeObject(forKey: "monday1store")
                            defaults.removeObject(forKey: "monday1date")
                            defaults.removeObject(forKey: "tue1time")
                            defaults.removeObject(forKey: "tue1store")
                            defaults.removeObject(forKey: "tue1date")
                            defaults.removeObject(forKey: "wed1time")
                            defaults.removeObject(forKey: "wed1store")
                            defaults.removeObject(forKey: "wed1date")
                            defaults.removeObject(forKey: "thur1time")
                            defaults.removeObject(forKey: "thur1store")
                            defaults.removeObject(forKey: "thur1date")
                            defaults.removeObject(forKey: "fri1time")
                            defaults.removeObject(forKey: "fri1store")
                            defaults.removeObject(forKey: "fri1date")
                            defaults.removeObject(forKey: "sat1time")
                            defaults.removeObject(forKey: "sat1store")
                            defaults.removeObject(forKey: "sat1date")
                            defaults.removeObject(forKey: "sun1time")
                            defaults.removeObject(forKey: "sun1date")
                            defaults.removeObject(forKey: "sun1store")
                            
                            //monday0 shift time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[2]/div[2]/div/div[2]") {
                                    
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "monday0time")
                                    
                                }
                                
                            }
                            
                            //monday0 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "monday0time")
                                    UserDefaults.standard.set(link.text, forKey: "monday0store")
                                }
                                
                            }
                            
                            
                            //monday0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[2]/div[2]/div/div[1]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text , forKey: "monday0store")
                                    
                                    
                                }
                                
                            }
                            //monday0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[1]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "monday0date")
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //tuesday0 shift time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.set(link.text, forKey: "tues0time")
                                    
                                }
                                
                            }
                            //tuesday0 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[2]/div[2]/div[2]") {
                                    UserDefaults.standard.set(link.text, forKey: "tuesday0time")
                                    UserDefaults.standard.set(link.text, forKey: "tuesday0store")
                                }
                                
                            }
                            //tuesday0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.set(link.text , forKey: "tues0store")
                                    
                                }
                                
                            }
                            //tuesday0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[1]") {
                                    UserDefaults.standard.set(link.text, forKey: "tues0date")
                                    let tues0dateObject = UserDefaults.standard.object(forKey: "tues0date")
                                    
                                    if let tuesdate = tues0dateObject as? String {
                                        print(tuesdate)
                                        
                                        
                                    }
                                    
                                }
                                
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //wed0time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[3]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "wed0time")
                                    UserDefaults.standard.set(link.text, forKey: "wed0time")
                                    let wed0Object = UserDefaults.standard.object(forKey: "wed0time")
                                    
                                    if let wedtime = wed0Object as? String {
                                        print(wedtime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //wed0 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[3]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "wed0time")
                                    UserDefaults.standard.set(link.text, forKey: "wed0store")
                                }
                                
                            }
                            
                            //wed0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[3]/div[2]/div[2]/div/div[1]") {
                                    print(link.text ?? "UNKNOWN DATA")
                                    UserDefaults.standard.removeObject(forKey: "wed0store")
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "wed0store")
                                    let wed0storeObject = UserDefaults.standard.object(forKey: "wed0store")
                                    
                                    if let wedsstore = wed0storeObject as? String {
                                        print(wedsstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //wed0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[3]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "wed0date")
                                    UserDefaults.standard.set(link.text, forKey: "wed0date")
                                    let wed0dateObject = UserDefaults.standard.object(forKey: "wed0date")
                                    
                                    if let weddate = wed0dateObject as? String {
                                        print(weddate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //thur0time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[4]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "thur0time")
                                    UserDefaults.standard.set(link.text, forKey: "thur0time")
                                    
                                    let thur0Object = UserDefaults.standard.object(forKey: "thur0time")
                                    
                                    if let thurtime = thur0Object as? String {
                                        print(thurtime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //thur0 Not Scheduled
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[4]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "thur0time")
                                    UserDefaults.standard.set(link.text, forKey: "thur0store")
                                }
                                
                            }
                            //thur0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[4]/div[2]/div[2]/div/div[1]/a") {
                                    print(link.text ?? "UNKNOWN DATA")
                                    UserDefaults.standard.removeObject(forKey: "thur0store")
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "thur0store")
                                    let thur0storeObject = UserDefaults.standard.object(forKey: "thur0store")
                                    
                                    if let thurstore = thur0storeObject as? String {
                                        print(thurstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            //thur0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[4]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "thur0date")
                                    UserDefaults.standard.set(link.text, forKey: "thur0date")
                                    
                                    let thurs0dateObject = UserDefaults.standard.object(forKey: "thur0date")
                                    
                                    if let thursdate = thurs0dateObject as? String {
                                        print(thursdate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //fri0time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[5]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "fri0time")
                                    UserDefaults.standard.set(link.text, forKey: "fri0time")
                                    let fri0Object = UserDefaults.standard.object(forKey: "fri0time")
                                    
                                    if let fritime = fri0Object as? String {
                                        print(fritime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //fri0 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[5]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "fri0time")
                                    UserDefaults.standard.set(link.text, forKey: "fri0store")
                                }
                                
                            }
                            
                            //fri0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[5]/div[2]/div[2]/div/div[1]") {
                                    print(link.text ?? "UNKNOWN DATA")
                                    UserDefaults.standard.removeObject(forKey: "fri0store")
                                    UserDefaults.standard.set(link.text, forKey: "fri0store")
                                    
                                    let fri0storeObject = UserDefaults.standard.object(forKey: "fri0store")
                                    
                                    if let fristore = fri0storeObject as? String {
                                        print(fristore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //fri0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[5]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "fri0date")
                                    UserDefaults.standard.set(link.text, forKey: "fri0date")
                                    
                                    let friday0dateObject = UserDefaults.standard.object(forKey: "fri0date")
                                    
                                    if let fridate = friday0dateObject as? String {
                                        print(fridate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            //--------------------------------------------------------------------------------------------------------------\\
                            //sat0time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                ////*[@id=\"Week0\"]/div[6]/div[2]/div[2]/div[2]
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "sat0time")
                                    UserDefaults.standard.set(link.text, forKey: "sat0time")
                                    let sat0Object = UserDefaults.standard.object(forKey: "sat0time")
                                    
                                    if let sattime = sat0Object as? String {
                                        print(sattime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sat0 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.removeObject(forKey: "sat0time")
                                    UserDefaults.standard.set(link.text, forKey: "sat0time")
                                }
                                
                            }
                            
                            //sat0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[2]/div[2]/div/div[1]") {
                                    print(link.text ?? "UNKNOWN DATA")
                                    UserDefaults.standard.removeObject(forKey: "sat0store")
                                    UserDefaults.standard.set(link.text , forKey: "sat0store")
                                    let sat0storeObject = UserDefaults.standard.object(forKey: "sat0store")
                                    
                                    if let satstore = sat0storeObject as? String {
                                        print(satstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sat0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sat0date")
                                    UserDefaults.standard.set(link.text, forKey: "sat0date")
                                    
                                    
                                    let sat0dateObject = UserDefaults.standard.object(forKey: "sat0date")
                                    
                                    if let satsdate = sat0dateObject as? String {
                                        print(satsdate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //sun0time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[7]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "sun0time")
                                    UserDefaults.standard.set(link.text, forKey: "sun0time")
                                    let sun0Object = UserDefaults.standard.object(forKey: "sun0time")
                                    
                                    if let suntime = sun0Object as? String {
                                        print(suntime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            //sun0 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[7]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "sun0time")
                                    UserDefaults.standard.set(link.text, forKey: "sun0store")
                                }
                                
                            }
                            //sun0 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[7]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sun0store")
                                    UserDefaults.standard.set(link.text , forKey: "sun0store")
                                    let sun0storeObject = UserDefaults.standard.object(forKey: "sun0store")
                                    
                                    if let sunstore = sun0storeObject as? String {
                                        print(sunstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sun0 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week0\"]/div[7]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sun0date")
                                    UserDefaults.standard.set(link.text, forKey: "sun0date")
                                    
                                    let sun0dateObject = UserDefaults.standard.object(forKey: "sun0date")
                                    
                                    if let sundate = sun0dateObject as? String {
                                        print(sundate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            //----------------------------------------------------------<WEEK 2>----------------------------------------------------------\\
                            //monday1 shift time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[1]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "monday1time")
                                    UserDefaults.standard.set(link.text, forKey: "monday1time")
                                    let monday1Object = UserDefaults.standard.object(forKey: "monday1time")
                                    
                                    if let mondaytime = monday1Object as? String {
                                        print(mondaytime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //monday1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[1]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "monday1time")
                                    UserDefaults.standard.set(link.text, forKey: "monday1store")
                                }
                                
                            }
                            //monday1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[1]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "monday1store")
                                    UserDefaults.standard.set(link.text, forKey: "monday1store")
                                    
                                    let monday1storeObject = UserDefaults.standard.object(forKey: "monday1store")
                                    
                                    if let mondaystore = monday1storeObject as? String {
                                        print(mondaystore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //monday1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[1]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "monday1date")
                                    UserDefaults.standard.set(link.text, forKey: "monday1date")
                                    
                                    let monday1dateObject = UserDefaults.standard.object(forKey: "monday1date")
                                    
                                    if let mondaydate = monday1dateObject as? String {
                                        print(mondaydate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //tuesday1 shift time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[2]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "tues1time")
                                    UserDefaults.standard.set(link.text, forKey: "tues1time")
                                    
                                    let tues1Object = UserDefaults.standard.object(forKey: "tues1time")
                                    
                                    if let tuestime = tues1Object as? String {
                                        print(tuestime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //tuesday1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[2]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "tues1time")
                                    UserDefaults.standard.set(link.text, forKey: "tues1store")
                                }
                                
                            }
                            //tuesday1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[2]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "tues1store")
                                    UserDefaults.standard.set(link.text, forKey: "tues1store")
                                    
                                    let tues1storeObject = UserDefaults.standard.object(forKey: "tues1store")
                                    
                                    if let tuesstore = tues1storeObject as? String {
                                        print(tuesstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //tuesday1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[2]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "tues1date")
                                    UserDefaults.standard.set(link.text, forKey: "tues1date")
                                    
                                    let tues1dateObject = UserDefaults.standard.object(forKey: "tues1date")
                                    
                                    if let tuesdate = tues1dateObject as? String {
                                        print(tuesdate)
                                        
                                        
                                    }
                                    
                                }
                                
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //wed1time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[3]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "wed1time")
                                    UserDefaults.standard.set(link.text, forKey: "wed1time")
                                    let wed1Object = UserDefaults.standard.object(forKey: "wed1time")
                                    
                                    if let wedtime = wed1Object as? String {
                                        print(wedtime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //wed1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[3]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "wed1time")
                                    UserDefaults.standard.set(link.text, forKey: "wed1store")
                                }
                                
                            }
                            //wed1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[3]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "wed1store")
                                    UserDefaults.standard.set(link.text, forKey: "wed1store")
                                    
                                    let wed1storeObject = UserDefaults.standard.object(forKey: "wed1store")
                                    
                                    if let wedsstore = wed1storeObject as? String {
                                        print(wedsstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //wed1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[3]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "wed1date")
                                    UserDefaults.standard.set(link.text, forKey: "wed1date")
                                    
                                    let wed1dateObject = UserDefaults.standard.object(forKey: "wed1date")
                                    
                                    if let weddate = wed1dateObject as? String {
                                        print(weddate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //thur1time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[4]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "thur1time")
                                    UserDefaults.standard.set(link.text, forKey: "thur1time")
                                    let thur1Object = UserDefaults.standard.object(forKey: "thur1time")
                                    
                                    if let thurtime = thur1Object as? String {
                                        print(thurtime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //thur1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[4]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "thur1time")
                                    UserDefaults.standard.set(link.text, forKey: "thur1store")
                                }
                                
                            }
                            //thur1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[4]/div[2]/div[2]/div/div[1]/a") {
                                    UserDefaults.standard.removeObject(forKey: "thur1store")
                                    UserDefaults.standard.set(link.text, forKey: "thur1store")
                                    let thur1storeObject = UserDefaults.standard.object(forKey: "thur1store")
                                    
                                    if let thurstore = thur1storeObject as? String {
                                        print(thurstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            //thur1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[4]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "thur1date")
                                    UserDefaults.standard.set(link.text, forKey: "thur1date")
                                    let thurs1dateObject = UserDefaults.standard.object(forKey: "thur1date")
                                    
                                    if let thursdate = thurs1dateObject as? String {
                                        print(thursdate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //fri1time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[5]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "fri1time")
                                    UserDefaults.standard.set(link.text, forKey: "fri1time")
                                    
                                    let fri1Object = UserDefaults.standard.object(forKey: "fri1time")
                                    
                                    if let fritime = fri1Object as? String {
                                        print(fritime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //fri1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[5]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "fri1time")
                                    UserDefaults.standard.set(link.text, forKey: "fri1store")
                                }
                                
                            }
                            //fri1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[5]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "fri1store")
                                    UserDefaults.standard.set(link.text, forKey: "fri1store")
                                    
                                    let fri1storeObject = UserDefaults.standard.object(forKey: "fri1store")
                                    
                                    if let fristore = fri1storeObject as? String {
                                        print(fristore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //fri1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[5]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "fri1date")
                                    UserDefaults.standard.set(link.text, forKey: "fri1date")
                                    
                                    let friday1dateObject = UserDefaults.standard.object(forKey: "fri1date")
                                    
                                    if let fridate = friday1dateObject as? String {
                                        print(fridate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            //--------------------------------------------------------------------------------------------------------------\\
                            //sat1time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[6]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "sat1time")
                                    UserDefaults.standard.set(link.text, forKey: "sat1time")
                                    let sat1Object = UserDefaults.standard.object(forKey: "sat1time")
                                    
                                    if let sattime = sat1Object as? String {
                                        print(sattime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sat1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[6]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "sat1time")
                                    UserDefaults.standard.set(link.text, forKey: "sat1store")
                                }
                                
                            }
                            //sat1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[6]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sat1store")
                                    UserDefaults.standard.set(link.text, forKey: "sat1store")
                                    let sat1storeObject = UserDefaults.standard.object(forKey: "sat1store")
                                    
                                    if let satstore = sat1storeObject as? String {
                                        print(satstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sat1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[6]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sat1date")
                                    UserDefaults.standard.set(link.text, forKey: "sat1date")
                                    let sat1dateObject = UserDefaults.standard.object(forKey: "sat1date")
                                    
                                    if let satsdate = sat1dateObject as? String {
                                        print(satsdate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //--------------------------------------------------------------------------------------------------------------\\
                            //sun1time
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[7]/div[2]/div[2]/div/div[2]") {
                                    UserDefaults.standard.removeObject(forKey: "sun1time")
                                    UserDefaults.standard.set(link.text, forKey: "sun1time")
                                    let sun1Object = UserDefaults.standard.object(forKey: "sun1time")
                                    
                                    if let suntime = sun1Object as? String {
                                        print(suntime)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sun1 not scheduled
                            
                            if let doc = HTML(html: html!, encoding: .utf8){
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[7]/div[2]/div[2]/div[2]") {
                                    print(link.text!)
                                    UserDefaults.standard.set(link.text, forKey: "sun1time")
                                    UserDefaults.standard.set(link.text, forKey: "sun1store")
                                }
                                
                            }
                            //sun1 store
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[7]/div[2]/div[2]/div/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sun1store")
                                    UserDefaults.standard.set(link.text, forKey: "sun1store")
                                    
                                    let sun1storeObject = UserDefaults.standard.object(forKey: "sun1store")
                                    
                                    if let sunstore = sun1storeObject as? String {
                                        print(sunstore)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            //sun1 date
                            if let doc = HTML(html: html!, encoding: .utf8) {
                                for link in doc.xpath("//*[@id=\"Week1\"]/div[7]/div[1]") {
                                    UserDefaults.standard.removeObject(forKey: "sun1date")
                                    UserDefaults.standard.set(link.text, forKey: "sun1date")
                                    
                                    let sun1dateObject = UserDefaults.standard.object(forKey: "sun1date")
                                    
                                    if let sundate = sun1dateObject as? String {
                                        print(sundate)
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        UserDefaults.standard.synchronize()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "View")
                        self.present(vc!, animated: false, completion: nil)
                        
                        
                    })
                    task.resume()
                }
            }
            
            
        }else {
            print("NOT SCHEDULE")
        }
        
        
    }
    

    
}
