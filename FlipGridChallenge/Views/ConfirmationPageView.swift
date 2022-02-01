//
//  ConfirmationPageView.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import SwiftUI

struct ConfirmationPageView: View {
    @ObservedObject var userProperty = UserProperties()

    var body: some View {
        VStack {
            HeaderView(text: "Hello, \(userProperty.firstName)!", subText: "Your super-awesome portfolio has been successfully submitted!  The details below will be public within your community!")
                .padding()
            confirmationRowView(image: "globe", name: userProperty.website)
            confirmationRowView(image: "person.fill", name: userProperty.firstName)
            confirmationRowView(image: "envelope.fill", name: userProperty.emailAddress)
            Spacer()
            ButtonView(text: "Sign In", enabled: true)
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
        .background(Color("background"))
    }
}

struct ConfirmationPageView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationPageView()
        ConfirmationPageView()
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
