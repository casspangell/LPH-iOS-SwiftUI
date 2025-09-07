//
//  Colors.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

extension Color {
  static let lphPurple = Color(hex: 0x544e74)
  static let lphOrange = Color(hex: 0xe8ad45)
  static let lphYellow = Color(hex: 0xefd455)
  static let lphBlue = Color(hex: 0x0049ac)
}

private extension Color {
  init(hex: UInt, alpha: Double = 1.0) {
    self.init(
      .sRGB,
      red: Double((hex & 0xFF0000) >> 16) / 255.0,
      green: Double((hex & 0x00FF00) >> 8) / 255.0,
      blue: Double(hex & 0x0000FF) / 255.0,
      opacity: alpha
    )
  }
}
