//
//  ContentView.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//
/*

1. I opt'd to use field name above the textfield for UX purposes. Once a user begins to fill in a field it's easier to tell what field is which, because once a field is filled with text th textField title is no longer visible.
2. For UI aesthetics I gave the textFields some depth
3. Added a background for UI purposes.
4. I gave the user the ability to toggle seeing the password to confirm they've input the correct password.  This could because of a invalid login or if the user has a long password.
5. I added email verification to ensure a valid email is present.  This allows the user to know right away they've inputted a valid email address.  Although, there still could be an issue on the backend (BE).
 */

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
                ButtonView(text: "Submit", enabled: verifyFunctions.shouldEnableButton(userProperty.emailAddress, userProperty.userPassword))
                    .cornerRadius(13)
            }
            .disabled(!verifyFunctions.shouldEnableButton(userProperty.emailAddress, userProperty.userPassword))
        }
        .padding()
        .sheet(isPresented: $showConfirmation) {
            ConfirmationPageView(userProperty: userProperty, showConfirmation: $showConfirmation)
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
