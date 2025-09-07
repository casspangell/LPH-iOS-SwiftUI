import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        VStack(spacing: 0) {
            TopBar()
                .ignoresSafeArea(edges: .all)
            NavigationStack {
            }
            
        }
    }
}

#if DEBUG
#Preview("Light") {
    LoginView()
        .modelContainer(for: Item.self, inMemory: true)
        .preferredColorScheme(.light)
}
#endif
