//
//  ViewController.swift
//  path
//
//  Created by Giovana Malaia on 07/02/25.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let headerXib = UINib(nibName: "TimelineHeaderCellView", bundle: nil)
        tableView.register(headerXib, forCellReuseIdentifier: "TimelineHeaderCellView")
        
        let songXib = UINib(nibName: "TimelineSongCellView", bundle: nil)
        tableView.register(songXib, forCellReuseIdentifier: "TimelineSongCellView")
        
        let imageXib = UINib(nibName: "TimelineImageCellView", bundle: nil)
        tableView.register(imageXib, forCellReuseIdentifier: "TimelineImageCellView")
        
        let defaultXib = UINib(nibName: "TimelineCellView", bundle: nil)
        tableView.register(defaultXib, forCellReuseIdentifier: "TimelineCellView")
        
    }
    
    // escolher aleatoriamente um tipo de célula
    func randomCellType() -> String {
        let cellTypes = ["TimelineSongCellView", "TimelineCellView", "TimelineImageCellView"]
        return cellTypes.randomElement() ?? "TimelineCellView"
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // primeira cell sendo header
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineHeaderCellView", for: indexPath) as? TimelineHeaderCellView else {
                return UITableViewCell()
            }
            cell.profilePicture.image = UIImage(systemName: "circle.fill")
            cell.bannerPicture.image = UIImage(named: "banner")
            return cell
        }
        
        let cellType = randomCellType()
        
        switch cellType {
        case "TimelineSongCellView":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineSongCellView", for: indexPath) as? TimelineSongCellView else {
                return UITableViewCell()
            }
            
            if let song = SongData.songsList.randomElement() {
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
            cell.sharedPicture.image = UIImage(named: "placehoder")
            return cell
            
        case "TimelineCellView":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCellView", for: indexPath) as? TimelineCellView else {
                return UITableViewCell()
            }
            cell.profilePicture.image = UIImage(systemName: "circle.fill")
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Célula \(indexPath.row) selecionada")
    }
    
}


