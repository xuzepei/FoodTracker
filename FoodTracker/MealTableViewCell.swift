//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by xuzepei on 15/12/10.
//  Copyright © 2015年 xuzepei. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK: - Properties
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
