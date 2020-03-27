//
//  Mood.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 3/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import SwiftUI

enum EmotionState: String, Codable {
    case happy
    case meh
    case sad
}

enum MoodColor: String, Codable {
    case mehColor = "mehColor"
    case sadColor = "sadColor"
    case happyColor = "happyColor"
}

struct Emotion: Codable {
    var state: EmotionState
    var color: MoodColor

    var moodColor: Color {
        switch color {
        case .mehColor:
            return .gray
        case .sadColor:
            return .red
        case .happyColor:
            return .green
        }
    }
}

struct Mood: Codable, Equatable, Identifiable {
    var id = UUID()
    let emotion: Emotion
    var comment: String?
    let date: Date
    
    init(emotion: Emotion, comment: String?, date: Date) {
        self.emotion = emotion
        self.comment = comment
        self.date = date
    }
    
    var dateString: String {
        dateFormatter.string(from: date)
    }
    
    static func == (lhs: Mood, rhs: Mood) -> Bool {
        if lhs.date == rhs.date {
            return true
        } else {
            return false
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()
