//
//  PersonCellView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 12/02/25.
//

import UIKit

class PersonCellView: UITableViewCell {
    
    @IBOutlet weak var contactName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
