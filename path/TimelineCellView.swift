//
//  TimelineCellView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 11/02/25.
//

import UIKit

class TimelineCellView: UITableViewCell {

    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var extraInformationLabel: UILabel!
    
    @IBOutlet weak var reactionButton: UIButton!
    
    @IBOutlet weak var timelineMarker: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
