//
//  GridStack.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 4/8/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct GridStack<Content: View>: View {

    let rows: Int
    let cols: Int
    let content: (Int, Int) -> Content

    var body: some View {

        VStack {
            ForEach(0..<self.rows) { row in
                HStack {
                    ForEach(0..<self.cols) { col in
                        Spacer()
                        self.content(row, col)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                }

            }
        }
    }


    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.cols = columns
        self.content = content
    }

}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct GridStack_Previews: PreviewProvider {

    static var previews: some View {
        GridStack(rows: 5, columns: 7) { row, col in
            Text("1")
        }
    }
}
