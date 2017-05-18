//
//  Schedule ScrapeViewController.swift
//  Partner
//
//  Created by Joseph Speakman on 5/17/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
// https://joeis.xyz/wp-content/uploads/2017/04/SHIFTTEMPLATE.html

import UIKit
import Kanna

class Schedule_ScrapeViewController: UIViewController {
        @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // webView suff
        let url = URL(string: "https://joeis.xyz/wp-content/uploads/2017/04/SHIFTTEMPLATE.html")
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)

    }
    func webViewDidStartLoad(_ : UIWebView) {
        print("LOAD START")
        
    }
    func webViewDidFinishLoad(_ : UIWebView) {
        
        //   print(webView.request!.mainDocumentURL!)
        let currentURL: String = (webView.request!.url!.relativeString)
        //THIS WORKS!
        if currentURL == "https://joeis.xyz/wp-content/uploads/2017/04/SHIFTTEMPLATE.html" {
            
            
            let url = NSURL(string: "https://joeis.xyz/wp-content/uploads/2017/04/SHIFTTEMPLATE.html")
            let html  =  webView.stringByEvaluatingJavaScript(from: "document.documentElement.outerHTML")
            
            if url != nil {
                let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
                    print(data as Any)
                    
                    if error == nil {
                        //monday0 shift time
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[2]/div[2]/div/div[2]") {
                                UserDefaults.standard.removeObject(forKey: "monday0time")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "monday0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "monday0time")
                                }
                                
                                let monday0Object = UserDefaults.standard.object(forKey: "monday0time")
                                
                                if let mondaytime = monday0Object as? String {
                                    print(mondaytime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //monday0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "monday0store")
                                print(link.text ?? "UNKNOWN DATA")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "monday0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "monday0store")
                                }
                                let monday0storeObject = UserDefaults.standard.object(forKey: "monday0store")
                                
                                
                                if let mondaystore = monday0storeObject as? String {
                                    print(mondaystore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //monday0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[1]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "monday0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "monday0date")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "monday0date")
                                }
                                let monday0dateObject = UserDefaults.standard.object(forKey: "monday0date")
                                
                                if let mondaydate = monday0dateObject as? String {
                                    print(mondaydate)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //--------------------------------------------------------------------------------------------------------------\\
                        //FIXED ?
                        //tuesday0 shift time
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[2]/div[2]/div/div[2]") {
                                UserDefaults.standard.removeObject(forKey: "tues0time")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.removeObject(forKey: "tues0time")
                                    UserDefaults.standard.set("NotScheduled", forKey: "tues0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "tues0time")
                                }
                                let tues0Object = UserDefaults.standard.object(forKey: "tues0time")
                                
                                if let tuestime = tues0Object as? String {
                                    print(tuestime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //tuesday0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "tues0store")
                                print(link.text ?? "UNKNOWN DATA")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "tues0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "tues0store")
                                }
                                let tues0storeObject = UserDefaults.standard.object(forKey: "tues0store")
                                
                                if let tuesstore = tues0storeObject as? String {
                                    print(tuesstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //tuesday0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[2]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "tues0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "tues0date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "tues0date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "wed0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "wed0time")
                                }
                                let wed0Object = UserDefaults.standard.object(forKey: "wed0time")
                                
                                if let wedtime = wed0Object as? String {
                                    print(wedtime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //wed0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[3]/div[2]/div[2]/div/div[1]") {
                                print(link.text ?? "UNKNOWN DATA")
                                UserDefaults.standard.removeObject(forKey: "wed0store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "wed0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "wed0store")
                                }
                                let wed0storeObject = UserDefaults.standard.object(forKey: "wed0store")
                                
                                if let wedsstore = wed0storeObject as? String {
                                    print(wedsstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //wed0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[3]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "wed0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "wed0date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "wed0date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "thur0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "thur0time")
                                }
                                let thur0Object = UserDefaults.standard.object(forKey: "thur0time")
                                
                                if let thurtime = thur0Object as? String {
                                    print(thurtime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //thur0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[4]/div[2]/div[2]/div/div[1]/a") {
                                print(link.text ?? "UNKNOWN DATA")
                                UserDefaults.standard.removeObject(forKey: "thur0store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "thur0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "thur0store")
                                }
                                let thur0storeObject = UserDefaults.standard.object(forKey: "thur0store")
                                
                                if let thurstore = thur0storeObject as? String {
                                    print(thurstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                        //thur0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[4]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "thur0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "thur0date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "thur0date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "fri0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "fri0time")
                                }
                                let fri0Object = UserDefaults.standard.object(forKey: "fri0time")
                                
                                if let fritime = fri0Object as? String {
                                    print(fritime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //fri0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[5]/div[2]/div[2]/div/div[1]") {
                                print(link.text ?? "UNKNOWN DATA")
                                UserDefaults.standard.removeObject(forKey: "fri0store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "fri0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "fri0store")
                                }
                                let fri0storeObject = UserDefaults.standard.object(forKey: "fri0store")
                                
                                if let fristore = fri0storeObject as? String {
                                    print(fristore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //fri0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[5]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "fri0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "fri0date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "fri0date")
                                }
                                let friday0dateObject = UserDefaults.standard.object(forKey: "fri0date")
                                
                                if let fridate = friday0dateObject as? String {
                                    print(fridate)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                        //--------------------------------------------------------------------------------------------------------------\\
                        //sat0time
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[2]/div[2]/div/div[2]") {
                                UserDefaults.standard.removeObject(forKey: "sat0time")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sat0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sat0time")
                                }
                                let sat0Object = UserDefaults.standard.object(forKey: "sat0time")
                                
                                if let sattime = sat0Object as? String {
                                    print(sattime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sat0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[2]/div[2]/div/div[1]") {
                                print(link.text ?? "UNKNOWN DATA")
                                UserDefaults.standard.removeObject(forKey: "sat0store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sat0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "sat0store")
                                }
                                let sat0storeObject = UserDefaults.standard.object(forKey: "sat0store")
                                
                                if let satstore = sat0storeObject as? String {
                                    print(satstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sat0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[6]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "sat0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sat0date")
                                }else {
                                    UserDefaults.standard.set(link.text , forKey: "sat0date")
                                }
                                
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sun0time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sun0time")
                                }
                                
                                let sun0Object = UserDefaults.standard.object(forKey: "sun0time")
                                
                                if let suntime = sun0Object as? String {
                                    print(suntime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sun0 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[7]/div[2]/div[2]/div/div[1]") {
                                print(link.text ?? "UNKNOWN DATA")
                                UserDefaults.standard.removeObject(forKey: "sun0store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sun0store")
                                }else {
                                    UserDefaults.standard.set(link.text ?? "UNKNOWN DATA", forKey: "sun0store")
                                }
                                let sun0storeObject = UserDefaults.standard.object(forKey: "sun0store")
                                
                                if let sunstore = sun0storeObject as? String {
                                    print(sunstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sun0 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week0\"]/div[7]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "sun0date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sun0date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sun0date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "monday1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "monday1time")
                                }
                                let monday1Object = UserDefaults.standard.object(forKey: "monday1time")
                                
                                if let mondaytime = monday1Object as? String {
                                    print(mondaytime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //monday1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[1]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "monday1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "monday1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "monday1store")
                                }
                                let monday1storeObject = UserDefaults.standard.object(forKey: "monday1store")
                                
                                if let mondaystore = monday1storeObject as? String {
                                    print(mondaystore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //monday1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[1]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "monday1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "monday1date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "monday1date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "tues1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "tues1time")
                                }
                                let tues1Object = UserDefaults.standard.object(forKey: "tues1time")
                                
                                if let tuestime = tues1Object as? String {
                                    print(tuestime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //tuesday1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[2]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "tues1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "tues1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "tues1store")
                                }
                                let tues1storeObject = UserDefaults.standard.object(forKey: "tues1store")
                                
                                if let tuesstore = tues1storeObject as? String {
                                    print(tuesstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //tuesday1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[2]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "tues1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "tues1date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "tues1date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "wed1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "wed1time")
                                }
                                let wed1Object = UserDefaults.standard.object(forKey: "wed1time")
                                
                                if let wedtime = wed1Object as? String {
                                    print(wedtime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //wed1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[3]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "wed1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "wed1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "wed1store")
                                }
                                let wed1storeObject = UserDefaults.standard.object(forKey: "wed1store")
                                
                                if let wedsstore = wed1storeObject as? String {
                                    print(wedsstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //wed1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[3]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "wed1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "wed1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "wed1store")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "thur1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "thur1time")
                                }
                                let thur1Object = UserDefaults.standard.object(forKey: "thur1time")
                                
                                if let thurtime = thur1Object as? String {
                                    print(thurtime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //thur1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[4]/div[2]/div[2]/div/div[1]/a") {
                                UserDefaults.standard.removeObject(forKey: "thur1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "thur1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "thur1store")
                                }
                                let thur1storeObject = UserDefaults.standard.object(forKey: "thur1store")
                                
                                if let thurstore = thur1storeObject as? String {
                                    print(thurstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                        //thur1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[4]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "thur1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "thur1date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "thur1sdate")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "fri1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "fri1time")
                                }
                                let fri1Object = UserDefaults.standard.object(forKey: "fri1time")
                                
                                if let fritime = fri1Object as? String {
                                    print(fritime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //fri1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[5]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "fri1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "fri1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "fri1store")
                                }
                                let fri1storeObject = UserDefaults.standard.object(forKey: "fri1store")
                                
                                if let fristore = fri1storeObject as? String {
                                    print(fristore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //fri1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[5]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "fri1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "fri1date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "fri1date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sat1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sat1time")
                                }
                                let sat1Object = UserDefaults.standard.object(forKey: "sat1time")
                                
                                if let sattime = sat1Object as? String {
                                    print(sattime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sat1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[6]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "sat1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sat1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sat1store")
                                }
                                let sat1storeObject = UserDefaults.standard.object(forKey: "sat1store")
                                
                                if let satstore = sat1storeObject as? String {
                                    print(satstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sat1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[6]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "sat1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sat1date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sat1date")
                                }
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
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sun1time")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sun1time")
                                }
                                let sun1Object = UserDefaults.standard.object(forKey: "sun1time")
                                
                                if let suntime = sun1Object as? String {
                                    print(suntime)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sun1 store
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[7]/div[2]/div[2]/div/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "sun1store")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sun1store")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sun1store")
                                }
                                let sun1storeObject = UserDefaults.standard.object(forKey: "sun1store")
                                
                                if let sunstore = sun1storeObject as? String {
                                    print(sunstore)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        //sun1 date
                        if let doc = HTML(html: html!, encoding: .utf8) {
                            for link in doc.xpath("//*[@id=\"Week1\"]/div[7]/div[2]/div[1]") {
                                UserDefaults.standard.removeObject(forKey: "sun1date")
                                if (link.text?.isEmpty)! {
                                    UserDefaults.standard.set("NotScheduled", forKey: "sun1date")
                                }else {
                                    UserDefaults.standard.set(link.text, forKey: "sun1date")
                                }
                                let sun1dateObject = UserDefaults.standard.object(forKey: "sun1date")
                                
                                if let sundate = sun1dateObject as? String {
                                    print(sundate)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                })
                task.resume()
            }
            
        }else {
            print("NOT SCHEDULE")
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
