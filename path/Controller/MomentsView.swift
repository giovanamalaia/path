//
//  MomentsView.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation
import UIKit

class MomentsView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableViewMoments: UITableView!
    var momentsPosts: [TimelinePost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMoments.delegate = self
        tableViewMoments.dataSource = self
        
        let songXib = UINib(nibName: "TimelineSongCellView", bundle: nil)
        tableViewMoments.register(songXib, forCellReuseIdentifier: "TimelineSongCellView")
        
        let imageXib = UINib(nibName: "TimelineImageCellView", bundle: nil)
        tableViewMoments.register(imageXib, forCellReuseIdentifier: "TimelineImageCellView")
        
        let defaultXib = UINib(nibName: "TimelineCellView", bundle: nil)
        tableViewMoments.register(defaultXib, forCellReuseIdentifier: "TimelineCellView")
        
        generateMomentsPosts()
    
    }
    
    private func generateMomentsPosts() {
        for _ in 1...7 {
            let cellType = randomCellType()

            if cellType == "TimelineSongCellView" {
                let song = SongData.songsList.randomElement()
                momentsPosts.append(TimelinePost(type: cellType, song: song, imageName: nil))

            } else if cellType == "TimelineImageCellView" {
                let randomImage = ImageData.imageList.randomElement() ?? "placeholder"
                momentsPosts.append(TimelinePost(type: cellType, song: nil, imageName: randomImage))

            } else {
                momentsPosts.append(TimelinePost(type: cellType, song: nil, imageName: nil))
            }
        }
    }
    
    func randomCellType() -> String {
        let cellTypes = ["TimelineSongCellView", "TimelineCellView", "TimelineImageCellView"]
        return cellTypes.randomElement() ?? "TimelineCellView"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return momentsPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = momentsPosts[indexPath.row]
        
        switch post.type {
        case "TimelineSongCellView":
            guard let cell = tableViewMoments.dequeueReusableCell(withIdentifier: "TimelineSongCellView", for: indexPath) as? TimelineSongCellView else {
                return UITableViewCell()
            }
            
            if let song = post.song {
                cell.profilePicture.image = UIImage(systemName: "circle.fill")
                cell.albumCoverPicture.image = UIImage(named: song.coverImage)
                
                cell.statusLabel.text = "Listening to \(song.name) by \(song.artist)"
                cell.extraInformationLabel.text = "\(song.album), \(song.year)"
            }
            
            return cell
            
        case "TimelineImageCellView":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineImageCellView", for: indexPath) as? TimelineImageCellView else {
                return UITableViewCell()
            }

            cell.profilePicture.image = UIImage(systemName: "circle.fill")
            if let imageName = post.imageName {
                cell.sharedPicture.image = UIImage(named: imageName)
            } else {
                cell.sharedPicture.image = UIImage(named: "placeholder")
            }

            return cell
            
        case "TimelineCellView":
            guard let cell = tableViewMoments.dequeueReusableCell(withIdentifier: "TimelineCellView", for: indexPath) as? TimelineCellView else {
                return UITableViewCell()
            }
            cell.profilePicture.image = UIImage(systemName: "circle.fill")
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
