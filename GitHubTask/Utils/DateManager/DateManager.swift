//
//  DateManager.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation

class DateManager{
    static func randomCreatedDate() -> Date {
        let monthsAgo = Int.random(in: 1...12)
        let createdDate = Calendar.current.date(byAdding: .month, value: -monthsAgo, to: Date()) ?? Date()
        return createdDate
    }
}

extension Date {
    func formattedDisplay(neededDateMonthes:Int) -> String {
        let now = Date()
        let sixMonthsAgo = Calendar.current.date(byAdding: .month, value: -neededDateMonthes, to: now)!

        if self > sixMonthsAgo {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM d, yyyy"
            return formatter.string(from: self)
        } else {
            let components = Calendar.current.dateComponents([.year, .month], from: self, to: now)
            if let years = components.year, years > 0 {
                return "\(years) year\(years > 1 ? "s" : "") ago"
            } else if let months = components.month, months > 0 {
                return "\(months) month\(months > 1 ? "s" : "") ago"
            } else {
                return "A while ago"
            }
        }
    }
}
