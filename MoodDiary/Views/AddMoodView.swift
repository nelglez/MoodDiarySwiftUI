//
//  AddMoodView.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 3/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct AddMoodView: View {
    @ObservedObject var moodModelController: MoodModelController
    @Environment(\.presentationMode) var presentationMode
    
    @State var text: String? = nil
    @State private var emotionState: EmotionState = .happy
    @State private var moodColor: MoodColor = .happyColor
    @State private var happyIsSelected = false
    @State private var mehIsSelected = false
    @State private var sadIsSelected = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Add a Mood Entry").font(.largeTitle)
            HStack {
                Button(action: {
                    self.emotionState = .happy
                    self.moodColor = .happyColor
                    self.happyIsSelected = true
                    self.mehIsSelected = false
                    self.sadIsSelected = false
                }) {
                    Image("happy").resizable().frame(width: 50, height: 50).foregroundColor(.green).background(happyIsSelected ? Color.yellow : Color.clear).clipShape(Circle())
                }
                
                Button(action: {
                    self.emotionState = .meh
                    self.moodColor = .mehColor
                    self.mehIsSelected = true
                    self.happyIsSelected = false
                    self.sadIsSelected = false
                }) {
                    Image("meh").resizable().frame(width: 50, height: 50).foregroundColor(.gray).background(mehIsSelected ? Color.yellow : Color.clear).clipShape(Circle())
                }
                
                Button(action: {
                    self.emotionState = .sad
                    self.moodColor = .sadColor
                    self.sadIsSelected = true
                    self.happyIsSelected = false
                    self.mehIsSelected = false
                }) {
                    Image("sad").resizable().frame(width: 50, height: 50).foregroundColor(.red).background(sadIsSelected ? Color.yellow : Color.clear).clipShape(Circle())
                }
            }
            
            MultiLineTextField(txt: $text).frame(height: 150).cornerRadius(20)
            
            Button(action: {
                    self.moodModelController.createMood(emotion: Emotion(state: self.emotionState, color: self.moodColor), comment: self.text, date: Date())
                    
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Add Mood Entry").bold().frame(width: UIScreen.main.bounds.width - 30, height: 50).background(Color.blue).foregroundColor(.white).cornerRadius(10)
            }
            
        }.padding()
    }

}

struct AddMoodView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddMoodView(moodModelController: MoodModelController(), text: "text")
    }
}
