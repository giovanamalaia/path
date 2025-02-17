//
//  PlaceCellView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 12/02/25.
//

import UIKit

class PlaceCellView: UITableViewCell {

    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var placeAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
