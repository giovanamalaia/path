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
        let orderedTimes = generateOrderedTimes(count: tweetTexts.count)

        return tweetTexts.enumerated().map { index, text in
            Tweet(
                text: text,
                time: orderedTimes[index],
                location: locations.randomElement() ?? "Unknown"
            )
        }
    }

    private static func generateOrderedTimes(count: Int) -> [String] {
        var times: [String] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a" // Exemplo: 8:15 AM

        var currentTime = Calendar.current.date(
            bySettingHour: Int.random(in: 6...10),
            minute: Int.random(in: 0..<60),
            second: 0,
            of: Date()
        ) ?? Date()

        for _ in 0..<count {
            times.append(dateFormatter.string(from: currentTime))
            currentTime = Calendar.current.date(byAdding: .minute, value: Int.random(in: 10...60), to: currentTime) ?? currentTime
        }

        return times
    }
}


