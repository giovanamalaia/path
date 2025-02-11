//
//  TimelineImageCellView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 11/02/25.
//

import UIKit

class TimelineImageCellView: UITableViewCell {

    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var sharedPicture: UIImageView!
    
    @IBOutlet weak var reactionButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
