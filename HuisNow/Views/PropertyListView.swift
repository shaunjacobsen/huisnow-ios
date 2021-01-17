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
    ForEach(properties.indices) { i in
      PropertyListRow(property: properties[i])
    }
    
    
    
  }
}

struct PropertyListRow: View {
  let property: Property
  
  var body: some View {
    ZStack {
      HStack {
        if (property.status == .new) {
          property.images[0]
            .centerCropped()
            .frame(width: 150)
            .cornerRadius(6.0)
            .badge()
        } else {
          ZStack {
            property.images[0]
              .centerCropped()
              .frame(width: 150)
              .cornerRadius(6.0)
              .overlay(
                ZStack {
                  if (property.status == .markedInterested) {
                    Color("Jaune").opacity(0.5)
                  } else if property.status == .viewingBooked {
                    Color("Vert").opacity(0.5)
                  }
                  property.statusSymbol()
                    .font(.title)
                    .foregroundColor(Color(.white))
                }
              )
          }
          
        }
        
        
        Group {
          VStack(alignment: .leading) {
            HStack {
              Text(property.name)
                .font(.title3)
                .kerning(-1)
              Spacer()
              
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
    .frame(maxWidth: .infinity, maxHeight: 100)
    .padding(.bottom, 10)
  }
}



struct Property_Previews: PreviewProvider {
  static private var properties = Binding.constant([Property(name: "Property One", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 150000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .new), Property(name: "Property Two", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 300000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .markedInterested)])
  
  static var previews: some View {
    PropertyListView(properties: properties).padding()
  }
}
