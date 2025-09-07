//
//  RemindersView.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

struct RemindersView: View {
  var body: some View {
    VStack {
      Text("Reminders View")
        .font(.title)
        .foregroundColor(.white)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.lphOrange)
    .preferredColorScheme(.light)
  }
}

#if DEBUG
struct RemindersView_Previews: PreviewProvider {
  static var previews: some View {
    RemindersView()
      .preferredColorScheme(.light)
  }
}
#endif