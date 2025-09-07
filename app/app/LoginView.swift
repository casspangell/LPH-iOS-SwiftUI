import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedPage: Int = 0
    @State private var loginEmail: String = ""
    @State private var signUpEmail: String = ""
    @State private var loginPassword: String = ""
    @State private var signUpPassword: String = ""
    @State private var signUpConfirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            TopBar()
                .ignoresSafeArea(edges: .all)
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
                        // TODO: Implement email-only login action (e.g., magic link)
                    }) {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.lphBlue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
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
                        // TODO: Implement email-only sign up action
                    }) {
                        Text("Create Account")
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.lphOrange)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
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
