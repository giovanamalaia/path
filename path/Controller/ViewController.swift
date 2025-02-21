import Foundation
import UIKit

struct TimelinePost {
    let type: String
    let song: Song?
    let imageName: String?
    let profilePictureName: String
    let tweet: Tweet? // Agora é um objeto Tweet
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var timelinePosts: [TimelinePost] = []

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
        
        generateTimelinePosts()
    }
    
    private func generateTimelinePosts() {
        for _ in 1...10 {
            let cellType = randomCellType()
            let randomProfilePicture = ProfilePictureData.profilePictures.randomElement() ?? "pf1"

            switch cellType {
            case "TimelineSongCellView":
                let song = SongData.songsList.randomElement()
                timelinePosts.append(TimelinePost(type: cellType, song: song, imageName: nil, profilePictureName: randomProfilePicture, tweet: nil))

            case "TimelineImageCellView":
                let randomImage = ImageData.imageList.randomElement() ?? "placeholder"
                timelinePosts.append(TimelinePost(type: cellType, song: nil, imageName: randomImage, profilePictureName: randomProfilePicture, tweet: nil))

            case "TimelineCellView":
                let randomTweet = TweetData.tweetList.randomElement()
                timelinePosts.append(TimelinePost(type: cellType, song: nil, imageName: nil, profilePictureName: randomProfilePicture, tweet: randomTweet))

            default:
                break
            }
        }
    }

    func randomCellType() -> String {
        let cellTypes = ["TimelineSongCellView", "TimelineCellView", "TimelineImageCellView"]
        return cellTypes.randomElement() ?? "TimelineCellView"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelinePosts.count + 1 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineHeaderCellView", for: indexPath) as? TimelineHeaderCellView else {
                return UITableViewCell()
            }
            cell.profilePicture.image = UIImage(named: "user")
            cell.bannerPicture.image = UIImage(named: "banner")
            return cell
        }

        let post = timelinePosts[indexPath.row - 1]

        switch post.type {
        case "TimelineSongCellView":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineSongCellView", for: indexPath) as? TimelineSongCellView else {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineImageCellView", for: indexPath) as? TimelineImageCellView else {
                return UITableViewCell()
            }

            cell.profilePicture.image = UIImage(named: post.profilePictureName)
            cell.sharedPicture.image = UIImage(named: post.imageName ?? "placeholder")

            return cell

        case "TimelineCellView":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCellView", for: indexPath) as? TimelineCellView else {
                return UITableViewCell()
            }

            cell.profilePicture.image = UIImage(named: post.profilePictureName)
            if let tweet = post.tweet {
                cell.statusLabel.text = tweet.text
                cell.extraInformationLabel.text = "\(tweet.time), \(tweet.location)"
            } else {
                cell.statusLabel.text = "No tweet available."
                cell.extraInformationLabel.text = ""
            }

            return cell

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Célula \(indexPath.row) selecionada")
    }
}

