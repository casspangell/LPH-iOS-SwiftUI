//
//  Branding.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

/// Centralized helpers for localized brand assets.
struct Branding {
  /// Returns the localized LPH main image based on the user's primary language.
  /// Fallback is always English.
  static func lphMainImage() -> Image {
    let code = primaryLanguageCode()
    let assetName = languageToLphAssetName[code] ?? languageToLphAssetName["en"]!
    return Image(assetName)
  }

  /// Maps ISO 639-1 language codes to LPH asset names.
  private static let languageToLphAssetName: [String: String] = [
    "en": "lph_english",
    "es": "lph_spanish",
    "fr": "lph_french",
    "nl": "lph_dutch",
    "de": "lph_german",
  ]

  /// Best-effort extraction of the user's primary ISO 639-1 language code (e.g., "en", "es").
  private static func primaryLanguageCode() -> String {
    guard let preferred = Locale.preferredLanguages.first, !preferred.isEmpty else {
      return "en"
    }
    if let code = preferred.split(separator: "-").first, !code.isEmpty {
      return String(code)
    }
    return "en"
  }
}

