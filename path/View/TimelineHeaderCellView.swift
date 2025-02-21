//
//  TimelineHeaderCellView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 11/02/25.
//

import UIKit

class TimelineHeaderCellView: UITableViewCell {
    
    @IBOutlet weak var bannerPicture: UIImageView!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var reactionButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var extraInformationLabel: UILabel!
    
    @IBOutlet weak var timelineMarker: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureHeaderInfo()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func configureHeaderInfo() {
        statusLabel.text = "Rio de Janeiro"
        extraInformationLabel.text = "\(getTimeOfDay()), \(generateRandomTemperature())ºC"
    }
    
    private func getTimeOfDay() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12:
            return "Morning"
        case 12..<18:
            return "Afternoon"
        case 18..<22:
            return "Evening"
        default:
            return "Night"
        }
    }
    
    private func generateRandomTemperature() -> Int {
        return Int.random(in: 25...35)
    }
    
}
