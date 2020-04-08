//
//  DayCellView.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 4/8/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct DayCellView: View {
@ObservedObject var moodModelController: MoodModelController
    @ObservedObject var day: Day

    var body: some View {
        VStack {
        Text(day.dayName).frame(width: 32, height: 32)
            .foregroundColor(day.textColor)
           // .background(day.backgroundColor)
          //  .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
//            .onTapGesture {
//                if self.day.disabled == false && self.day.selectableDays {
//                    self.day.isSelected.toggle()
//                }
//        }
        
            moodText()
        
        }.background(day.backgroundColor).clipShape(RoundedRectangle(cornerRadius: 10)).onTapGesture {
                if self.day.disabled == false && self.day.selectableDays {
                    self.day.isSelected.toggle()
                }
        }
    }
    
    func moodText() -> some View {
        var imageName = "none"
        for m in moodModelController.moods {
           // if m.date.dateToString(format: "d") == day.dayName {
            if m.monthString == day.monthString && m.dayAsInt == day.dayAsInt && m.year == day.year {
              switch m.emotion.state {
                case .happy:
                    imageName = "happy"
                case .meh:
                    imageName = "meh"
                case .sad:
                    imageName = "sad"
                }
                return Image(imageName).resizable().frame(width: 20, height: 20).opacity(1)
            }
        }
        
        return Image(imageName).resizable().frame(width: 20, height: 20).opacity(0)
    }
}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        DayCellView(moodModelController: MoodModelController(), day: Day(date: Date()))
    }
}
