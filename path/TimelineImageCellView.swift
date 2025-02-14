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
    
    var reactionBox: ReactionBoxView?
    var backgroundOverlay: UIView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func reactionButtonTapped(_ sender: UIButton) {
        ReactionBoxManager.shared.toggleReactionBox(from: sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
