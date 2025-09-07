//
//  AuthService.swift
//  app
//
//  Created by AI on 9/7/25.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class AuthService: ObservableObject {
  @Published var isAuthenticated: Bool = false
  @Published var currentUser: User?
  
  private var authStateListener: AuthStateDidChangeListenerHandle?
  
  init() {
    setupAuthStateListener()
  }
  
  deinit {
    if let listener = authStateListener {
      Auth.auth().removeStateDidChangeListener(listener)
    }
  }
  
  private func setupAuthStateListener() {
    authStateListener = Auth.auth().addStateDidChangeListener { [weak self] _, user in
      Task { @MainActor in
        self?.currentUser = user
        self?.isAuthenticated = user != nil
      }
    }
  }
  
  func signIn(email: String, password: String) async throws {
    _ = try await Auth.auth().signIn(withEmail: email, password: password)
  }

  func signUp(email: String, password: String) async throws {
    _ = try await Auth.auth().createUser(withEmail: email, password: password)
  }
  
  func signOut() throws {
    try Auth.auth().signOut()
  }
}


