//
//  MultiLineTextField.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 3/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import SwiftUI

struct MultiLineTextField: UIViewRepresentable {
    
    @Binding var txt: String?
    @Binding var counterLabel: String
    
    func makeCoordinator() -> MultiLineTextField.Coordinator {
        
        return MultiLineTextField.Coordinator(parent1: self)
    }
    func makeUIView(context: Context) -> UITextView {
        
        let text = UITextView()
        text.isEditable = true
        text.isUserInteractionEnabled = true
        if self.txt != "" {
            
            text.text = self.txt
            text.textColor = .black
        } else {
            
            text.text = "Type Something"
            text.textColor = .gray
        }
        
       // text.textColor = .gray
        text.backgroundColor = UIColor(red: 239/255, green: 243/255, blue: 244/255, alpha: 1)
        text.font = .systemFont(ofSize: 20)
        text.returnKeyType = .done
        text.delegate = context.coordinator
        text.inputAccessoryView = UIView()//Removes the "done" button from the top of the keyboard.
        text.leftSpace()
        return text
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        
        var parent: MultiLineTextField
        
        init(parent1: MultiLineTextField) {
            
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {


            if self.parent.txt == "" {
                            
            textView.text = ""
            textView.textColor = .black
            }
        }

        //Called when ever we start typing in the text view.
        func textViewDidChange(_ textView: UITextView) {

            self.parent.txt = textView.text
            
            //Calculation of characters
               let allowed = 101
               let typed = textView.text.count
               let remaining = allowed - typed
               
            self.parent.counterLabel = "\(remaining)/101"
        }
        
        /* Updated for Swift 4 */
        //Runs FIRST when ever text view is about to be changed. Returns true, means allow change, false means do not allow.
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if(text == "\n") {
                textView.resignFirstResponder()
                return false
            }
            
            //Do not allow white lines (breaks)
             guard text.rangeOfCharacter(from: .newlines) == nil else {
                 return false
             }
             //Stop entry while reached 101 chars
            return textView.text.count + (text.count - range.length) <= 101
            
            
          //  return true
        }
    }
}

extension UITextView {
    func leftSpace() {
        self.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
