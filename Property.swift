//
//  Property.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 16/01/2021.
//

import Foundation

enum PropertyType {
  case apartment
  case townhouse
}

struct Property {
  let name: String
  let type: PropertyType
  let address: String
  let postcode: String
  let price: Int
  let agent: String
  let images: [String]
  let constructionYear: Int
  let source: String
  let sourceIdentifier: String
  let createdAt: Date
  let updatedAt: Date
}
