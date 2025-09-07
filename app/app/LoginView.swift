import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 0) {
            TopBar()
                .ignoresSafeArea(edges: .all)
            Branding.lphMainImage()
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            NavigationStack {
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .ignoresSafeArea()
    }
}

#if DEBUG
#Preview("Light") {
    LoginView()
        .modelContainer(for: Item.self, inMemory: true)
        .preferredColorScheme(.light)
}
#endif
