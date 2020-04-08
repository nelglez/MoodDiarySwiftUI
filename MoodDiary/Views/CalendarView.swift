//
//  CalendarView.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 4/8/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public struct CalendarView: View {
    @ObservedObject var moodModelController: MoodModelController
    let startDate: Date
    let monthsToDisplay: Int
    var selectableDays = true
    

    init(start: Date, monthsToShow: Int, daysSelectable: Bool = true, moodController: MoodModelController) {
    self.startDate = start
    self.monthsToDisplay = monthsToShow
    self.selectableDays = daysSelectable
    self.moodModelController = moodController
    }

    public var body: some View {
        
        VStack {
            
            WeekdaysView()
            ScrollView {
                MonthView(moodModelController: moodModelController, month: Month(startDate: startDate, selectableDays: selectableDays))
                if monthsToDisplay > 1 {
                    ForEach(1..<self.monthsToDisplay) {
                        MonthView(moodModelController: self.moodModelController, month: Month(startDate: self.nextMonth(currentMonth: self.startDate, add: $0), selectableDays: self.selectableDays))
                    }
                }
            }
            Spacer()
        }.padding().navigationBarTitle("Mood Calendar", displayMode: .inline)
    }

    func nextMonth(currentMonth: Date, add: Int) -> Date {
        var components = DateComponents()
        components.month = add
        let next = Calendar.current.date(byAdding: components, to: currentMonth)!
        return next
    }


}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(start: Date(), monthsToShow: 2, moodController: MoodModelController())
    }
}
