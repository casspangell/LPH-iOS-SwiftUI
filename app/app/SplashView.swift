import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            if let icon = AppIcon.image() {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
            } else {
                Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "App")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    SplashView()
}
