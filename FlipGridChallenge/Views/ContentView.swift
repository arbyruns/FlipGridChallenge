//
//  ContentView.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var verifyFunctions = VerifyFunctions()

    @State var firstName = ""
    @State var emailAddress = ""
    @State var userPassword = ""
    @State var website = ""
    @State var isSecured = true

    var body: some View {
        VStack {
            HeaderView(text: "Profile Creation", subText: "Use the form to submit your portfolio. \nAn email and password are required.")
            FirstNameView(firstName: $firstName)
            ZStack {
                VStack(alignment: .leading) {
                    Text("Email Address")
                        .fontWeight(.semibold)
                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(.secondary, style: StrokeStyle(lineWidth: 1))
                            .frame(height: 55)
                        HStack {
                            TextField("Email Address", text: $emailAddress)
                                .padding()
                                .disableAutocorrection(true)
                            if verifyFunctions.validEmail(emailAddress) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 6)
            VStack(alignment: .leading) {
                Text("Password")
                    .fontWeight(.semibold)
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(.secondary, style: StrokeStyle(lineWidth: 1))
                        .frame(height: 55)

                    if isSecured {
                        SecureField("Password", text: $userPassword)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                    } else {
                        TextField("Password", text: $userPassword)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                    }
                    Button(action: {
                        isSecured.toggle()
                    })
                    {
                        Image(systemName: isSecured ? "eye.slash" : "eye")
                            .padding(.trailing)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical, 6)
            }
            ZStack {
                VStack(alignment: .leading) {
                    Text("Website")
                        .fontWeight(.semibold)
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(.secondary, style: StrokeStyle(lineWidth: 1))
                        .frame(height: 55)
                        .overlay(
                            TextField("Website", text: $website)
                                .padding()
                        )
                }
            }
            Spacer()
            Button(action: {

                   })
            {
                ButtonView(text: "Submit")
                    .cornerRadius(13)
            }
            .disabled(!verifyFunctions.shouldEnableButton(firstName, emailAddress))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
