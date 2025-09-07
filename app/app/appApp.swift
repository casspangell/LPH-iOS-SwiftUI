//
//  appApp.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import SwiftUI
import SwiftData

@main
struct appApp: App {
    @State private var showSplash: Bool = true
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

    var body: some Scene {
        WindowGroup {
            VStack(spacing: 0) {
                TopBar()
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
                    } else {
                        LoginView()
                    }
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
