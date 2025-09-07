//
//  AboutView.swift
//  app
//
//  Created by AI on 9/7/25.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    VStack {
      Text("About")
        .font(.largeTitle)
        .padding(.bottom, 12)
      Text("This is the About screen.")
        .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(.systemGroupedBackground))
  }
}

#if DEBUG
struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
      .preferredColorScheme(.light)
  }
}
#endif

//
//  AboutView.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

