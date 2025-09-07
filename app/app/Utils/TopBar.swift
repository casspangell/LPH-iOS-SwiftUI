//
//  TopBar.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

struct TopBar: View {
  var body: some View {
    let topInset = TopBar.safeAreaTopInset()
    VStack(spacing: 0) {
      // Top row (purple) - 50% of safe area height
      Rectangle()
        .fill(Color.lphPurple)
        .frame(height: topInset / 2)

      // Bottom row (yellow/orange split) - 50% of safe area height
      GeometryReader { proxy in
        HStack(spacing: 0) {
          Rectangle()
            .fill(Color.lphYellow)
            .frame(width: proxy.size.width * 0.25, height: topInset / 2)
          Rectangle()
            .fill(Color.lphOrange)
            .frame(width: proxy.size.width * 0.75, height: topInset / 2)
        }
      }
      .frame(height: topInset / 2)
    }
    .frame(maxWidth: .infinity, alignment: .top)
    .accessibilityHidden(true)
  }
}

private extension TopBar {
  static func safeAreaTopInset() -> CGFloat {
    guard
      let windowScene = UIApplication.shared.connectedScenes
        .compactMap({ $0 as? UIWindowScene })
        .first,
      let window = windowScene.windows.first(where: { $0.isKeyWindow })
    else {
      return 0
    }
    return window.safeAreaInsets.top
  }
}

#if DEBUG
struct TopBar_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      // Compact preview
      VStack(spacing: 0) {
        TopBar()
        Text("Content below top bar")
          .padding()
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .previewDisplayName("Size That Fits")
      .previewLayout(.sizeThatFits)

      // Device previews
      VStack(spacing: 0) {
        TopBar()
        ScrollView {
          VStack(alignment: .leading, spacing: 16) {
            Text("Demo Content")
              .font(.headline)
            ForEach(0..<10, id: \.self) { idx in
              Text("Row \\ (idx)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
          }
          .padding()
        }
      }
      .previewDisplayName("iPhone 15 Pro - Light")
      .previewDevice("iPhone 15 Pro")
      .preferredColorScheme(.light)

      VStack(spacing: 0) {
        TopBar()
        Color(.systemBackground)
      }
      .previewDisplayName("iPhone 15 Pro - Dark")
      .previewDevice("iPhone 15 Pro")
      .preferredColorScheme(.dark)
    }
  }
}
#endif
