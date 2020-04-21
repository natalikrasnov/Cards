//
//  CardTableViewCell.swift
//  cards
//
//  Created by hyperactive on 03/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet var cardView: Card!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
