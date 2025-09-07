//
//  MainView.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

struct MainView: View {
  @State private var selectedView: Int = 0
  
  var body: some View {
    VStack(spacing: 0) {
        // LPH Image
    Branding.lphMainImage()
      .resizable()
      .scaledToFit()
      .padding(.horizontal)
        
      HStack(spacing: 0) {
        NavigationButton(
          title: "Chant Now",
          isSelected: selectedView == 0,
          action: { selectedView = 0 }
        )
        
        NavigationButton(
          title: "Reminders",
          isSelected: selectedView == 1,
          action: { selectedView = 1 }
        )
        
        NavigationButton(
          title: "Milestones",
          isSelected: selectedView == 2,
          action: { selectedView = 2 }
        )
      }
      
      // Content view
      Group {
        switch selectedView {
        case 0:
          ChantView()
        case 1:
          RemindersView()
        case 2:
          MilestonesView()
        default:
          ChantView()
        }
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .preferredColorScheme(.light)
  }
}

struct NavigationButton: View {
  let title: String
  let isSelected: Bool
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.lphPurple)
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(isSelected ? Color.white : Color.gray.opacity(0.2))
    }
  }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .preferredColorScheme(.light)
  }
}
#endif
