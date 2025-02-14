//
//  SongCell.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 12/02/25.
//

import UIKit

class SongCellView: UITableViewCell {

    
    @IBOutlet weak var albumCoverPicture: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
