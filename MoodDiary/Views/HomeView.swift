//
//  HomeView.swift
//  MoodDiary
//
//  Created by Nelson Gonzalez on 3/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var moodModelController = MoodModelController()
    @State var show = false
    @State var txt = ""
    @State var docID = ""
    @State var remove = false
    
//    init() {
//
//        UINavigationBar.appearance().backgroundColor = .systemRed
//
//         UINavigationBar.appearance().largeTitleTextAttributes = [
//            .foregroundColor: UIColor.white]
//
//    }
//
    var body: some View {
        NavigationView {
        ZStack(alignment: .bottomTrailing) {
            
            VStack(spacing: 0){
                
//                HStack(alignment: .center) {
//
//
//                    Text("My Mood").font(.title).foregroundColor(.white)
//
//                    Spacer()
//                    NavigationLink(destination: CalendarView(start: Date(), monthsToShow: 1, daysSelectable: true, moodController: moodModelController)) {
//                        Text("Calendar").foregroundColor(.white)
//                    }
//
//
//                }.padding()
//                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
//                    .background(Color.red)
                List {
                    ForEach(self.moodModelController.moods, id: \.id) { mood in
                        
                        MoodRowView(mood: mood)
                     
                    }.onDelete { (index) in
                        
                        self.moodModelController.deleteMood(at: index)
                    }
                }.onAppear {
                    //Removes extra cells that are not being used.
                    UITableView.appearance().tableFooterView = UIView()
                    //MARK: Disable selection.
                
                    UITableView.appearance().allowsSelection = true
                    UITableViewCell.appearance().selectionStyle = .none
                     UITableView.appearance().showsVerticalScrollIndicator = false
                    
                    
                }
                Spacer()
                
            }//
            Spacer()
            Button(action: {
                
                self.txt = ""
                self.docID = ""
                self.show.toggle()
                
            }) {
                
                Image(systemName: "plus").resizable().frame(width: 18, height: 18).foregroundColor(.white)
                
            }.padding()
                .background(Color.red)
                .clipShape(Circle())
                .padding()
            
        }
        .sheet(isPresented: self.$show) {
        
            AddMoodView(moodModelController: self.moodModelController)
            
        }.animation(.default).navigationBarTitle("Mood Diary").navigationBarItems(trailing: NavigationLink(destination: CalendarView(start: Date(), monthsToShow: 1, daysSelectable: true, moodController: moodModelController), label: {
            Image(systemName: "calendar")
        }))
            
        }.accentColor(.black)
    }
    
}

class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
