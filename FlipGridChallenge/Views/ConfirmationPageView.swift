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
            Text(userProperty.website)
            Text(userProperty.firstName)
            Text(userProperty.emailAddress)
            Spacer()
            ButtonView(text: "Sign In")
                .padding()
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
