//
//  RootTabsView.swift
//  app
//
//  Created by AI on 9/7/25.
//

import SwiftUI

struct RootTabsView: View {
  @State private var selectedTab: Int = 0

  var body: some View {
    VStack(spacing: 0) {
      Group {
        switch selectedTab {
        case 0:
          MainView()
        case 1:
          AboutView()
        case 2:
          AccountView()
        default:
          MainView()
        }
      }

      Divider()

      HStack(spacing: 0) {
        TabButton(systemImageName: "play.fill", title: "Chant", isSelected: selectedTab == 0) { selectedTab = 0 }
        TabButton(systemImageName: "info.circle", title: "About", isSelected: selectedTab == 1) { selectedTab = 1 }
        TabButton(systemImageName: "person", title: "Account", isSelected: selectedTab == 2) { selectedTab = 2 }
      }
      .frame(height: 50)
      .background(Color(.systemBackground))
    }
  }
}

private struct TabButton: View {
  let systemImageName: String
  let title: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Image(systemName: systemImageName)
        .font(.system(size: 18, weight: .semibold))
        .foregroundColor(isSelected ? .lphOrange : .lphPurple)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
    }
    .accessibilityLabel(Text(title))
    .background(isSelected ? Color.gray.opacity(0.15) : Color.clear)
  }
}

#if DEBUG
struct RootTabsView_Previews: PreviewProvider {
  static var previews: some View {
    RootTabsView()
      .preferredColorScheme(.light)
  }
}
#endif


