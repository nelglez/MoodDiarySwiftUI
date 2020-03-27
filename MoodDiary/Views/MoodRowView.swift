//
//  MoodRowView.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 3/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct MoodRowView: View {
    var mood: Mood
    
    var body: some View {
  
        HStack {
            
            Text(mood.dateString)
            
            Text(mood.comment ?? "No comment made.").font(.title).bold()
           
        }.foregroundColor(mood.emotion.moodColor)
       
    }
}

struct MoodRowView_Previews: PreviewProvider {
    static var previews: some View {
        MoodRowView(mood: Mood(emotion: Emotion(state: .happy, color: .happyColor), comment: "Test", date: Date()))
    }
}
