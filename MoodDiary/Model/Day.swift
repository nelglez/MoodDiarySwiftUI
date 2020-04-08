//
//  Day.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 4/8/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
class Day: ObservableObject {

    @Published var isSelected = false

    var selectableDays: Bool
    var dayDate: Date
    var dayName: String {
        dayDate.dateToString(format: "d")
    }
    var isToday = false
    var disabled = false
    let colors = Colors()
    var textColor: Color {
        if isSelected {
            return colors.selectedColor
        } else if isToday {
            return colors.todayColor
        } else if disabled {
            return colors.disabledColor
        }
        return colors.textColor
    }
    var backgroundColor: Color {
        if isSelected {
            return colors.selectedBackgroundColor
        } else {
            return colors.backgroundColor
        }
    }
    
    //Added
    var monthString: String {

    let dateFormatter1 = DateFormatter()
    dateFormatter1.dateFormat = "LLL"
    
    let month = dateFormatter1.string(from: dayDate)
    
    return month
    
    }
    
    var dayAsInt: Int {
        let day = Calendar.current.component(.day, from: dayDate)
        return day
    }
    
    var year: String {
        return Calendar.current.component(.year, from: dayDate).description
    }

    init(date: Date, today: Bool = false, disable: Bool = false, selectable: Bool = true) {
        dayDate = date
        isToday = today
        disabled = disable
        selectableDays = selectable
    }

}
