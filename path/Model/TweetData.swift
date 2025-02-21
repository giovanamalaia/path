//
//  TweetData.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation

struct Tweet {
    let text: String
    let time: String
    let location: String
}

struct TweetData {
    static let tweetList: [Tweet] = generateTweets()

    private static func generateTweets() -> [Tweet] {
        let tweetTexts = [
            "Feeling like Friday",
            "I need coffee",
            "Let’s stay home",
            "Lost my mind",
            "Plans got canceled",
            "Living the dream",
            "Forgot my password",
            "Need more sleep",
            "Life goes on",
            "Send more snacks",
            "Weather looks weird",
            "Dreams come true",
            "Time flies fast",
            "I’m still tired",
            "Where’s my phone",
            "Eat. Sleep. Repeat.",
            "Weekend loading..."
        ]

        let locations = ["Rio de Janeiro", "São Paulo", "At Home", "Online", "New York", "Coffee Shop", "Beach", "Library"]
        let orderedTimes = generateRandomTimes(count: tweetTexts.count)

        return tweetTexts.enumerated().map { index, text in
            Tweet(
                text: text,
                time: orderedTimes[index],
                location: locations.randomElement() ?? "Unknown"
            )
        }
    }

    private static func generateRandomTimes(count: Int) -> [String] {
        var times: [String] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"

        for _ in 0..<count {
            let randomHour = Int.random(in: 0..<12)
            let randomMinute = Int.random(in: 0..<60)
            
            if let randomDate = Calendar.current.date(bySettingHour: randomHour, minute: randomMinute, second: 0, of: Date()) {
                times.append(dateFormatter.string(from: randomDate))
            }
        }

        return times
    }


}


