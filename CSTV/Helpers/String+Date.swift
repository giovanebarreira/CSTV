//
//  String+Date.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import Foundation

extension String {
    var dayMonthHour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let asDate = dateFormatter.date(from: self) else { return "" }

        dateFormatter.dateFormat = "dd.MM HH:mm"
        return dateFormatter.string(from: asDate)
    }

    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let asDate = dateFormatter.date(from: self) else { return "" }

        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: asDate)
    }

    var weekDayHour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let asDate = dateFormatter.date(from: self) else { return "" }

        dateFormatter.dateFormat = "EEE HH:mm"
        let newFormat = dateFormatter.string(from: asDate).capitalized
        return newFormat.replacingOccurrences(of: ".", with: ",")
    }

    var isToday: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let asDate = dateFormatter.date(from: self) else { return false }
        return Calendar.current.isDateInToday(asDate)
    }

    var isTomorrow: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let asDate = dateFormatter.date(from: self) else { return false }
        return Calendar.current.isDateInTomorrow(asDate)
    }

    var isNow: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let asDate = dateFormatter.date(from: self) else { return false }
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: asDate)
        let currentHour = calendar.component(.hour, from: Date())
        return hour == currentHour
    }
}
