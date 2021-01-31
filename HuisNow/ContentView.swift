//
//  ContentView.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 16/01/2021.
//

import SwiftUI

struct ContentView: View {
  @State var properties = [Property(name: "Property One", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 150000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .new), Property(name: "Property Two", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 300000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .markedInterested), Property(name: "Property Three", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 300000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .viewingBooked)]
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
        
        VStack {
          
          Text("MapView")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300)
        .padding(.trailing, 10)
        .background(Color("CardText"))
        .cornerRadius(6.0)
        
        PropertyListView(properties: $properties)
        Text("Upcoming viewings")
          .font(.title2)
          .foregroundColor(Color("Grey"))
          .fontWeight(.bold)
          .padding(.top, 20)
        Spacer()
      }
      .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 10)
    }.edgesIgnoringSafeArea(.all)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView().environment(\.colorScheme, .dark)
  }
}
