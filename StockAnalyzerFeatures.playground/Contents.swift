import UIKit

struct Feature: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title, description, status, isFinished
    }
    enum Status: String, Codable {
        case planned = "Planned"
        case inProgress = "In Progress"
        case implemented = "Implemented"
    }

    let id: String
    let title: String
    var description: String?
    let status: Status
    var isFinished: Bool = false
}

let features: [Feature] = [
    .init(id: "1", title: "Watchlist Performance Widgets", status: .planned),
    .init(id: "2", title: "iPad App", status: .planned),
    .init(id: "3", title: "Mac App", status: .planned),
    .init(id: "4", title: "Notification for New Earnings Report", status: .implemented, isFinished: true),
    .init(id: "5", title: "Price Notifications", status: .planned),
    .init(id: "6", title: "Show Related Stocks / Competition", status: .planned),
    .init(id: "7", title: "Allow creating multiple lists besides the main watchlist", status: .planned),
    .init(id: "8", title: "Allow comparing stocks side by side with their scores", status: .planned),
    .init(id: "9", title: "Debt/EBITDA Ratio", status: .planned),
    .init(id: "10", title: "Add Return on Investment Capital Ratio (ROIC)", status: .planned),
    .init(id: "11", title: "Allow selecting currency", status: .planned),
    .init(id: "12", title: "Watch App", status: .planned),
    .init(id: "13", title: "Stock Price Graph", status: .implemented, isFinished: true),
    .init(id: "14", title: "Customize Criteria Order", status: .planned),
    .init(id: "15", title: "Mark criteria as favorite and show on top of detail page", status: .planned),
    .init(id: "16", title: "Price Notifications", status: .planned),
    .init(id: "17", title: "Value Notifications for specific criteria like PE Ratio", status: .planned),
    .init(id: "18", title: "Stock ESG Score", status: .planned),
    .init(id: "19", title: "Stock ESG Risk Ratings", status: .planned),
    .init(id: "20", title: "Price Targets from Analysts", status: .planned),
    .init(id: "21", title: "Stock Screener", status: .planned),
    .init(id: "22", title: "Stock News", status: .planned),
    .init(id: "23", title: "Stock Sentiment based on Social Media like Reddit, Yahoo, Twitter, and StockTwits", status: .planned),
    .init(id: "24", title: "Stock Grades like Outperform, Buy, Sell", status: .planned),
    .init(id: "25", title: "Explore stocks via Earnings Surprises", status: .planned)
]

assert(Set(features.map(\.id)).count == features.count, "Duplicate IDs exist!")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

if let json = try? encoder.encode(features) {
    print(String(data: json, encoding: .utf8)!)
}
