//
//  View+Extensions.swift
//  HuisNow
//
//  Created by Shaun Jacobsen on 17/01/2021.
//

import Foundation
import SwiftUI

extension View {
  func badge(count: Int? = nil, alignment: Alignment = .topTrailing) -> some View {
    ZStack(alignment: alignment) {
      self
      ZStack {
        if let countUnwrapped = count {
          Text("\(countUnwrapped)")
            .font(.footnote)
            .frame(width: 20, height: 20)
            .background(Circle().fill(Color.red))
            .animation(nil)
            .transition(.scale)
        } else {
          Text("")
            .font(.footnote)
            .frame(width: 20, height: 20)
            .background(Circle().fill(Color.red))
            .animation(nil)
            .transition(.scale)
        }
      }
      .offset(x: 10, y: -10)
    }
  }
}
