//
//  ContentView.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userProperty: UserProperties
    @StateObject var verifyFunctions = VerifyFunctions()

    @State var isSecured = true
    @State var showConfirmation = false

    var body: some View {
        VStack {
            HeaderView(text: "Profile Creation", subText: "Use the form to submit your portfolio. \nAn email and password are required.")
            Spacer()
            ZStack {
                Color("background")
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .shadow(color: .black.opacity(0.3), radius: 13, x: 0, y: 0)
                    .frame(height: 450)
                    .overlay(
                        VStack {
                            FirstNameView(firstName: $userProperty.firstName)
                            EmailView(emailAddress: $userProperty.emailAddress)
                            PasswordView(isSecured: $isSecured, userPassword: $userProperty.userPassword)
                            WebsiteView(website: $userProperty.website)
                        }
                            .padding()
                    )
            }
            Spacer()
            Button(action: {
                showConfirmation = true
                   })
            {
                ButtonView(text: "Submit")
                    .cornerRadius(13)
            }
            .disabled(!verifyFunctions.shouldEnableButton(userProperty.firstName, userProperty.emailAddress))
        }
        .padding()
        .sheet(isPresented: $showConfirmation) {
            ConfirmationPageView(userProperty: userProperty)
        }
        .background(Color("background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userProperty: UserProperties())
        ContentView(userProperty: UserProperties())
            .colorScheme(.dark)
    }
}
