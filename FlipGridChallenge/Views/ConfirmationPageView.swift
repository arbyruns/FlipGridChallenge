//
//  ConfirmationPageView.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//
/*
 Sign in button clears all fields and dismiss the confirmation sheet.
 */

import SwiftUI

struct ConfirmationPageView: View {
    @ObservedObject var userProperty = UserProperties()
    @Binding var showConfirmation: Bool

    var body: some View {
        VStack {
            HeaderView(text: "Hello, \(userProperty.firstName)!", subText: "Your super-awesome portfolio has been successfully submitted!  The details below will be public within your community!")
                .padding()
            confirmationRowView(image: "globe", name: userProperty.website)
            confirmationRowView(image: "person.fill", name: userProperty.firstName)
            confirmationRowView(image: "envelope.fill", name: userProperty.emailAddress)
            Spacer()
            Button(action: {
                userProperty.firstName = ""
                userProperty.emailAddress = ""
                userProperty.userPassword = ""
                userProperty.website = ""
                showConfirmation = false
                   })
            {
                ButtonView(text: "Sign In", enabled: true)
                    .cornerRadius(13)
            }
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
        .background(Color("background"))
    }
}

struct ConfirmationPageView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationPageView(showConfirmation: .constant(false))
        ConfirmationPageView(showConfirmation: .constant(false))
            .colorScheme(.dark)
    }
}

struct confirmationRowView: View {
    let image: String
    let name: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title2)
            Text(name)
                .font(.title2)
        }
        .padding()
    }
}
