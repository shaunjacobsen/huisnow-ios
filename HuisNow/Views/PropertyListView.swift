//
//  Property.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 16/01/2021.
//

import SwiftUI



struct PropertyListView: View {
  @Binding var properties: [Property]
  var body: some View {
    ZStack {
      Color("Background")
      ForEach(properties.indices) { i in
        PropertyListRow(property: properties[i])
      }
    }
    
    
  }
}

struct PropertyListRow: View {
  let property: Property
  
  var body: some View {
    ZStack {
      Color(.white)
      HStack {
        property.images[0]
          .centerCropped()
          .frame(width: 150)
        
        Group {
          VStack(alignment: .leading) {
            HStack {
              Text(property.name)
                .font(.title3)
                .kerning(-1)
              Spacer()
              property.statusSymbol()
            }.padding(.trailing, 10)
            
            
            // address
            VStack {
              HStack {
                Text(property.address)
                  .font(.caption)
                Spacer()
              }
              
              
              HStack {
                Text(property.postcode)
                  .font(.caption)
                Text(property.municipality)
                  .font(.caption)
                Spacer()
              }
            }
            Spacer()
            // price
            Text(property.formattedPrice())
              .font(.title3)
              .fontWeight(.medium)
          }
          .padding(.top, 10)
          .padding(.bottom, 10)
        }
      }
      
    }
    
    .cornerRadius(6.0)
    .shadow(color: Color(.black).opacity(0.2), radius: 5, x: 0, y: 0)
    .frame(maxWidth: .infinity, maxHeight: 150)
    .badge()
    .padding()
  }
}



struct Property_Previews: PreviewProvider {
  static private var properties = Binding.constant([Property(name: "Property One", type: .apartment, address: "Soendastraat 24", postcode: "1094 BH", price: 150000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .new)])
  
  static var previews: some View {
    PropertyListView(properties: properties)
  }
}
