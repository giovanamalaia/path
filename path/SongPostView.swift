//
//  SongPostView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 13/02/25.
//

import Foundation
import UIKit

class SongPostView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableViewSongs: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSongs.delegate = self
        tableViewSongs.dataSource = self
        
        let songXib = UINib(nibName: "SongCellView", bundle: nil)
        tableViewSongs.register(songXib, forCellReuseIdentifier: "SongCellView")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCellView", for: indexPath) as? SongCellView else {
            return UITableViewCell()
        }
        
        if indexPath.row % 2 == 0 {
            cell.songNameLabel.text = "Expresso"
            cell.artistNameLabel.text = "Sabrina Carpenter"
            cell.albumCoverPicture.image = UIImage(named: "coverExpresso")
        } else {
            cell.songNameLabel.text = "BIRDS OF A FEATHER"
            cell.artistNameLabel.text = "Billie Eilish"
            cell.albumCoverPicture.image = UIImage(named: "coverBillie")
        }
        
        return cell
    }
}
