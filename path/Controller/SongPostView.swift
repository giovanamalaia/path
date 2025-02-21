//
//  SongPostView.swift
//  path
//
//  Created by Gabriela Azulay Lewin on 13/02/25.
//

import Foundation
import UIKit

class SongPostView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableViewSongs: UITableView!
    @IBOutlet weak var searchBarSong: UISearchBar!
    
    var filteredSongsList: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSongs.delegate = self
        tableViewSongs.dataSource = self
        searchBarSong.delegate = self
        
        let songXib = UINib(nibName: "SongCellView", bundle: nil)
        tableViewSongs.register(songXib, forCellReuseIdentifier: "SongCellView")
        
        filteredSongsList = SongData.songsList
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCellView", for: indexPath) as? SongCellView else {
            return UITableViewCell()
        }
        
        let song = filteredSongsList[indexPath.row]
        cell.songNameLabel.text = song.name
        cell.artistNameLabel.text = song.artist
        cell.albumCoverPicture.image = UIImage(named: song.coverImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let writePostVC = storyboard.instantiateViewController(withIdentifier: "WritePostView") as? WritePostView {
            writePostVC.selectedSong = filteredSongsList[indexPath.row]
            navigationController?.pushViewController(writePostVC, animated: true)
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredSongsList = SongData.songsList
        } else {
            filteredSongsList = SongData.songsList.filter { song in
                song.name.lowercased().contains(searchText.lowercased()) ||
                song.artist.lowercased().contains(searchText.lowercased())
            }
        }
        
        tableViewSongs.reloadData()
    }
}
