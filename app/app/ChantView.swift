//
//  ChantView.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI

struct ChantView: View {
  var body: some View {
    VStack {
      Text("Chant View")
        .font(.title)
        .foregroundColor(.white)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.lphPurple)
    .preferredColorScheme(.light)
  }
}

#if DEBUG
struct ChantView_Previews: PreviewProvider {
  static var previews: some View {
    ChantView()
      .preferredColorScheme(.light)
  }
}
#endif