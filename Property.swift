//
//  Property.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 16/01/2021.
//

import Foundation
import SwiftUI

enum PropertyType {
  case apartment
  case townhouse
}

enum PropertyStatus {
  case new
  case markedInterested
  case viewingBooked
}

struct Property {
  let name: String
  let type: PropertyType?
  let address: String
  let postcode: String
  let price: Int
  let agent: String
  let images: [Image]
  let municipality: String
  let constructionYear: Int
  let source: String
  let sourceIdentifier: String
  let createdAt: Date
  let updatedAt: Date
  let status: PropertyStatus
}

extension Property {
  func formattedPrice() -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    formatter.currencyCode = "EUR"
    var formattedPrice: String = ""
    if let price = formatter.string(from: self.price as NSNumber) {
      formattedPrice = price
    }
    
    return formattedPrice
  }
  
  func statusSymbol() -> Image? {
    switch self.status {
    case .markedInterested:
      return Image(systemName: "star.fill")
    case .viewingBooked:
      return Image(systemName: "calendar.circle")
    case .new:
      return nil
    }
  }
}
