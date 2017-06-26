




//
//  HomeTableViewCell.swift
//  Partner
//
//  Created by Joseph Speakman on 6/4/17.
//  Copyright © 2017 Joe Speakman. All rights reserved.
//

import UIKit

//protocol cellDelegate : class {
//    func didPressButton(cell: MyCell)
//}
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellback: UIImageView!
    var indexPath:IndexPath!
    @IBOutlet weak var action: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
