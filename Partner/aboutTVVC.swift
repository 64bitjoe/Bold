//
//  aboutTVVC.swift
//  Bold
//
//  Created by Joseph Speakman on 8/4/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
//

import UIKit


class aboutTVVC: UITableViewController {
    @IBOutlet weak var meLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        //https://www.snapchat.com/add/joeistek
    }

    @IBAction func tumblrButton(_ sender: Any) {
        //http://64bitjoe.tumblr.com/
    }
    @IBAction func snapButton(_ sender: Any) {
        //https://www.snapchat.com/add/joeistek
    }
    
    @IBAction func redditButton(_ sender: Any) {
        //https://www.reddit.com/user/64bitjoe_/
    }
    @IBAction func githubButton(_ sender: Any) {
       // https://github.com/Joeistek
    }
    @IBAction func instagramButton(_ sender: Any) {
        //https://www.instagram.com/64bitjoe/
    }
}
