//
//  appApp.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct appApp: App {
    @State private var showSplash: Bool = true
    @StateObject private var authService = AuthService()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }

    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .top) {
                Group {
                    if showSplash {
                        SplashView()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        showSplash = false
                                    }
                                }
                            }
                    } else if authService.isAuthenticated {
                        RootTabsView()
                    } else {
                        LoginView()
                            .environmentObject(authService)
                    }
                }

                TopBar()
            }
            .preferredColorScheme(.light)
        }
        .modelContainer(sharedModelContainer)
    }
}
