//
//  MonthView.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 4/8/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct MonthView: View {

@ObservedObject var moodModelController: MoodModelController
    var month: Month

    var body: some View {
        VStack {
            Text("\(month.monthNameYear)")
            GridStack(rows: month.monthRows, columns: month.monthDays.count) { row, col in
                if self.month.monthDays[col+1]![row].dayDate == Date(timeIntervalSince1970: 0) {
                    Text("").frame(width: 32, height: 32)
                } else {
                    DayCellView(moodModelController: self.moodModelController, day: self.month.monthDays[col+1]![row])
                }

            }
        }
        .padding(.bottom, 20)

    }
}
@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(moodModelController: MoodModelController(), month: Month(startDate: Date(), selectableDays: true))
    }
}
