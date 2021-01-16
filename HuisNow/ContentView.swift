//
//  ContentView.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 16/01/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color("Background")
      VStack(alignment: .leading) {
        HStack(spacing: 0) {
          Text("Huis")
            .foregroundColor(Color("Grey"))
            .font(.largeTitle)
            .fontWeight(.black)
          Text("Now")
            .foregroundColor(Color("Rose"))
            .font(.largeTitle)
            .fontWeight(.black)
        }.padding(.top, 50)
        .padding(.bottom, 20)
        Text("Newest properties")
          .font(.title2)
          .foregroundColor(Color("Grey"))
          .fontWeight(.bold)
        Text("Upcoming viewings")
          .font(.title2)
          .foregroundColor(Color("Grey"))
          .fontWeight(.bold)
          .padding(.top, 20)
        Spacer()
      }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }.edgesIgnoringSafeArea(.all)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView().environment(\.colorScheme, .dark)
  }
}
