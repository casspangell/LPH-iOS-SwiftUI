//
//  AccountView.swift
//  app
//
//  Created by AI on 9/7/25.
//

import SwiftUI

struct AccountView: View {
  var body: some View {
    VStack(spacing: 12) {
      Text("Account")
        .font(.largeTitle)
      Text("This screen is currently empty.")
        .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(.systemGroupedBackground))
  }
}

#if DEBUG
struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
      .preferredColorScheme(.light)
  }
}
#endif


