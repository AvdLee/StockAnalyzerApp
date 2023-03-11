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
    .init(id: "4", title: "Notification for New Earnings Report", status: .planned),
    .init(id: "5", title: "Price Notifications", status: .planned),
    .init(id: "6", title: "Show Related Stocks / Competition", status: .planned),
    .init(id: "7", title: "Allow creating multiple lists besides the main watchlist", status: .planned),
    .init(id: "8", title: "Allow comparing stocks side by side with their scores", status: .planned),
    .init(id: "9", title: "Debt/EBITDA Ratio", status: .planned),
    .init(id: "10", title: "Add Return on Investment Capital Ratio (ROIC)", status: .planned),
    .init(id: "11", title: "Allow selecting currency", status: .planned),
    .init(id: "12", title: "Watch App", status: .planned),
    .init(id: "13", title: "Stock Price Graph", status: .implemented)
]

assert(Set(features.map(\.id)).count == features.count, "Duplicate IDs exist!")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

if let json = try? encoder.encode(features) {
    print(String(data: json, encoding: .utf8)!)
}
