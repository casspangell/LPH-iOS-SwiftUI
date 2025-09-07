//
//  MilestonesView.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

struct MilestonesView: View {
  var body: some View {
    VStack {
      Text("Milestones View")
        .font(.title)
        .foregroundColor(.white)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.lphBlue)
    .preferredColorScheme(.light)
  }
}

#if DEBUG
struct MilestonesView_Previews: PreviewProvider {
  static var previews: some View {
    MilestonesView()
      .preferredColorScheme(.light)
  }
}
#endif