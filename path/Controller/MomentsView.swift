//
//  MomentsView.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation
import UIKit

class MomentsView: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewSongPost(_:)), name: NSNotification.Name("NewSongPost"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewPlacePost(_:)), name: NSNotification.Name("NewPlacePost"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewPersonPost(_:)), name: NSNotification.Name("NewPersonPost"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewImagePost(_:)), name: NSNotification.Name("NewImagePost"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewTextPost(_:)), name: NSNotification.Name("NewTextPost"), object: nil)


        
        generateMomentsPosts()
    }
    
    private func generateMomentsPosts() {
        if momentsPosts.isEmpty {
            for _ in 1...7 {
                let cellType = randomCellType()

                if cellType == "TimelineSongCellView" {
                    let song = SongData.songsList.randomElement()
                    momentsPosts.append(TimelinePost(type: cellType, song: song, place: nil, person: nil, imageName: nil, profilePictureName: "user", tweet: nil))

                } else if cellType == "TimelineImageCellView" {
                    let randomImage = ImageData.imageList.randomElement() ?? "placeholder"
                    momentsPosts.append(TimelinePost(type: cellType, song: nil, place: nil, person: nil, imageName: randomImage, profilePictureName: "user", tweet: nil))

                } else if cellType == "TimelineCellView" {
                    if let randomTweet = TweetData.tweetList.randomElement() {
                        momentsPosts.append(TimelinePost(type: cellType, song: nil, place: nil, person: nil, imageName: nil, profilePictureName: "user", tweet: randomTweet))
                    }
                }
            }
        }
    }

    
    @objc func handleNewSongPost(_ notification: Notification) {
        if let song = notification.userInfo?["song"] as? Song {
            let newPost = TimelinePost(type: "TimelineSongCellView", song: song, place: nil, person: nil, imageName: nil, profilePictureName: "user", tweet: nil)
            momentsPosts.insert(newPost, at: 0)
            tableViewMoments.reloadData()
        }
    }
    
    @objc func handleNewTextPost(_ notification: Notification) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let currentTime = dateFormatter.string(from: Date())
        
        if let text = notification.userInfo?["text"] as? String {
            let newPost = TimelinePost(
                type: "TimelineCellView",
                song: nil,
                place: nil,
                person: nil,
                imageName: nil,
                profilePictureName: "user",
                tweet: Tweet(text: text, time: currentTime, location: "Rio de Janeiro")
            )
            
            momentsPosts.insert(newPost, at: 0)
            tableViewMoments.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
    }

    
    @objc func handleNewImagePost(_ notification: Notification) {
        if let imageName = notification.userInfo?["imageName"] as? String {
            let newPost = TimelinePost(
                type: "TimelineImageCellView",
                song: nil,
                place: nil,
                person: nil,
                imageName: imageName,
                profilePictureName: "user",
                tweet: nil
            )
            
            momentsPosts.insert(newPost, at: 0)
            tableViewMoments.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
    }


    @objc func handleNewPlacePost(_ notification: Notification) {
        if let place = notification.userInfo?["place"] as? Place {
            let newPost = TimelinePost(type: "TimelineCellView", song: nil, place: place, person: nil, imageName: nil, profilePictureName: "user", tweet: nil)
            momentsPosts.insert(newPost, at: 0)
            tableViewMoments.reloadData()
        }
    }

    @objc func handleNewPersonPost(_ notification: Notification) {
        if let person = notification.userInfo?["person"] as? Person {
            let newPost = TimelinePost(type: "TimelineCellView", song: nil, place: nil, person: person, imageName: nil, profilePictureName: "user", tweet: nil)
            momentsPosts.insert(newPost, at: 0)
            tableViewMoments.reloadData()
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
                cell.profilePicture.image = UIImage(named: post.profilePictureName)
                cell.albumCoverPicture.image = UIImage(named: song.coverImage)
                cell.statusLabel.text = "Listening to \(song.name) by \(song.artist)"
                cell.extraInformationLabel.text = "\(song.album), \(song.year)"
            }
            
            return cell
            
        case "TimelineImageCellView":
            guard let cell = tableViewMoments.dequeueReusableCell(withIdentifier: "TimelineImageCellView", for: indexPath) as? TimelineImageCellView else {
                return UITableViewCell()
            }

            cell.profilePicture.image = UIImage(named: post.profilePictureName)
            cell.sharedPicture.image = UIImage(named: post.imageName ?? "placeholder")
            
            return cell
            
        case "TimelineCellView":
            guard let cell = tableViewMoments.dequeueReusableCell(withIdentifier: "TimelineCellView", for: indexPath) as? TimelineCellView else {
                return UITableViewCell()
            }

            cell.profilePicture.image = UIImage(named: post.profilePictureName)

            if let person = post.person {
                cell.statusLabel.text = "Is with \(person.name)"
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                let currentTime = dateFormatter.string(from: Date())
                cell.extraInformationLabel.text = "\(currentTime), Rio de Janeiro"

            } else if let place = post.place {
                cell.statusLabel.text = "At \(place.name)"
                cell.extraInformationLabel.text = place.address

            } else if let tweet = post.tweet {
                cell.statusLabel.text = tweet.text
                cell.extraInformationLabel.text = "\(tweet.time), \(tweet.location)"

            } else {
                cell.statusLabel.text = "No information available."
                cell.extraInformationLabel.text = ""
            }

            return cell

            
        default:
            return UITableViewCell()
        }
    }
}
