import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var authService: AuthService
    @State private var selectedPage: Int = 0
    @State private var loginEmail: String = ""
    @State private var signUpEmail: String = ""
    @State private var loginPassword: String = ""
    @State private var signUpPassword: String = ""
    @State private var signUpConfirmPassword: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String? = nil
    @State private var showErrorAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Branding.lphMainImage()
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                Image("ic_cover_page")
                    .resizable()
                    .scaledToFit()
                TabView(selection: $selectedPage) {
                    // Login Page
                    VStack(alignment: .leading, spacing: 12) {
                        TextField("Email", text: $loginEmail)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .padding(12)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        SecureField("Password", text: $loginPassword)
                            .textContentType(.password)
                            .padding(12)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Button(action: {
                            Task {
                                await handleLogin()
                            }
                        }) {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(Color.lphBlue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .disabled(isLoading)
                        Button(action: { withAnimation(.easeInOut) { selectedPage = 1 } }) {
                            Text("Create an account")
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.top, 12)
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .tag(0)

                    // Sign Up Page
                    VStack(alignment: .leading, spacing: 12) {
                        TextField("Email", text: $signUpEmail)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .padding(12)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        SecureField("Password", text: $signUpPassword)
                            .textContentType(.newPassword)
                            .padding(12)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        SecureField("Confirm Password", text: $signUpConfirmPassword)
                            .textContentType(.newPassword)
                            .padding(12)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Button(action: {
                            Task {
                                await handleSignUp()
                            }
                        }) {
                            Text("Create Account")
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(Color.lphOrange)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .disabled(isLoading)
                        Button(action: { withAnimation(.easeInOut) { selectedPage = 0 } }) {
                            Text("Have an account? Log in")
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.top, 12)
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                .animation(.easeInOut, value: selectedPage)
            }

            if isLoading {
                ZStack {
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(Color.lphBlue)
                        .scaleEffect(1.2)
                }
                .transition(.opacity)
                .allowsHitTesting(true)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .ignoresSafeArea()
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage ?? "Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

private extension LoginView {
    @MainActor
    func handleLogin() async {
        guard !loginEmail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter your email"; showErrorAlert = true; return
        }
        guard !loginPassword.isEmpty else {
            errorMessage = "Please enter your password"; showErrorAlert = true; return
        }
        isLoading = true
        defer { isLoading = false }
        do {
            try await authService.signIn(email: loginEmail, password: loginPassword)
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }

    @MainActor
    func handleSignUp() async {
        guard !signUpEmail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter your email"; showErrorAlert = true; return
        }
        guard !signUpPassword.isEmpty else {
            errorMessage = "Please enter a password"; showErrorAlert = true; return
        }
        guard signUpPassword == signUpConfirmPassword else {
            errorMessage = "Passwords do not match"; showErrorAlert = true; return
        }
        isLoading = true
        defer { isLoading = false }
        do {
            try await authService.signUp(email: signUpEmail, password: signUpPassword)
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }
}

#if DEBUG
#Preview("Light") {
    LoginView()
        .modelContainer(for: Item.self, inMemory: true)
        .environmentObject(AuthService())
        .preferredColorScheme(.light)
}
#endif
