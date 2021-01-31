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
    ScrollView(.horizontal) {
      HStack(spacing: 10) {
        ForEach(properties.indices) { i in
          PropertyListCard(property: properties[i])
        }
      }
    }.frame(height: 300)
    
  }
}

struct PropertyListCard: View {
  let property: Property
  
  var body: some View {
    ZStack {
      property.images[0]
        .centerCropped()
        .overlay(
          PropertyListCardOverlay(property: property)
        )
    }
    .frame(minWidth: 300, maxWidth: 300, minHeight: 300, maxHeight: 300)
    .cornerRadius(6.0)
  }
}

struct PropertyListCardOverlay: View {
  let property: Property
  
  var body: some View {
    VStack {
      HStack(alignment: .top) {
        PropertyListCardBadge(property: property)
        
        Spacer()
        Button(action: {}) {
          Image(systemName: "heart")
            .foregroundColor(Color("Rose"))
            .padding(10)
        }
        .background(Color("CardTextBackground"))
        .cornerRadius(6.0)
        .padding(.bottom, 5)
      }
      .padding(10)
      
      Spacer()
      
      VStack {
        HStack {
          Spacer()
          Button(action: {}) {
            Image(systemName: "mappin.and.ellipse")
              .foregroundColor(Color("City"))
              .padding(10)
          }
          .background(Color("CardTextBackground"))
          .cornerRadius(6.0)
          .padding(.bottom, 5)
        }
        PropertyListCardOverlayAddressInfo(property: property)
      }
      .padding(10)
    }
  }
}

struct PropertyListCardBadge: View {
  let property: Property
  
  var body: some View {
    switch property.status {
    case .new:
      return AnyView(BadgeText(text: "New", color: Color("Rose")))
    case .viewingBooked:
      return AnyView(BadgeText(text: "Friday", icon: "calendar.badge.clock", color: Color("Vert")))
    default:
      return AnyView(ZStack{})
    }
  }
}

struct PropertyListCardOverlayAddressInfo: View {
  let property: Property
  
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        HStack {
          Text(property.name)
            .font(.title3)
            .kerning(-1)
            .foregroundColor(Color("CardText"))
          Spacer()
          Text(property.formattedPrice())
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(Color("CardText"))
        }
        
        // address
        VStack {
          HStack {
            Text(property.address)
              .font(.caption)
              .foregroundColor(Color("CardText"))
            Spacer()
          }
          
          HStack {
            Text(property.postcode)
              .font(.caption).foregroundColor(Color("CardText"))
            Text(property.municipality)
              .font(.caption)
              .foregroundColor(Color("CardText"))
            Spacer()
          }
        }
      }
      .padding(10)
    }
    .background(Color("CardTextBackground"))
    .cornerRadius(6.0)
  }
}

struct BadgeText: View {
  let text: String
  let icon: String?
  let bgColour: Color
  
  init(text: String, icon: String? = nil, color: Color) {
    self.text = text
    self.bgColour = color
    self.icon = icon
  }
  
  
  var body: some View {
    HStack {
      if let icon = icon {
        Image(systemName: icon)
          .foregroundColor(.white)
        
      }
      Text(text)
        .fontWeight(.heavy)
        .textCase(.uppercase)
        .font(.caption)
        .foregroundColor(.white)
      
      
    }
    .padding(.top, 10)
    .padding(.bottom, 10)
    .padding(.leading, 5)
    .padding(.trailing, 5)
    .frame(height: 28)
    .background(bgColour)
    .cornerRadius(6)
  }
}

struct Property_Previews: PreviewProvider {
  static private var properties = Binding.constant([Property(name: "Property One", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 150000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .new), Property(name: "Property Two", type: .apartment, address: "Javastraat 1", postcode: "1095 XX", price: 300000, agent: "Makelaar", images: [Image("SampleProperty")], municipality: "Amsterdam", constructionYear: 1930, source: "Pararius", sourceIdentifier: "some identifier", createdAt: Date(), updatedAt: Date(), status: .viewingBooked)])
  
  static var previews: some View {
    PropertyListView(properties: properties).padding()
    Group {
      PropertyListView(properties: properties)
        .padding()
        .preferredColorScheme(.dark)
      
    }
  }
}
