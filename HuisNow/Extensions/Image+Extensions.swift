//
//  Image+Extensions.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 17/01/2021.
//

import Foundation
import SwiftUI

extension Image {
  func centerCropped() -> some View {
    GeometryReader { geo in
      self
        .resizable()
        .scaledToFill()
        .frame(width: geo.size.width, height: geo.size.height)
        .clipped()
    }
  }
}
