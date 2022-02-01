//
//  HelperViews.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import SwiftUI

struct HeaderView: View {
    let text: String
    let subText: String
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(text)
                    .font(.largeTitle)
                    .kerning(2)
                    .bold()
                Text(subText)
                    .foregroundColor(.secondary)
                    .padding(.top, 1)
            }
            Spacer()
        }
    }
}


struct ButtonView: View {

    let text: String
    let enabled: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(enabled ? .red : .secondary)
            .frame(height: 55, alignment: .center)
            .overlay(
                VStack {
                    Text(text)
                        .foregroundColor(.white)
                }
            )
    }
}

struct FirstNameView: View {
    @Binding var firstName: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("First Name")
                    .fontWeight(.semibold)
                RoundedRectangle(cornerRadius: 13)
                    .stroke(.secondary, style: StrokeStyle(lineWidth: 1))
                    .frame(height: 55)
                    .overlay(
                        TextField("First Name", text: $firstName)
                            .padding()
                            .disableAutocorrection(true)
                    )
            }
        }
        .padding(.vertical, 6)
    }
}

struct WebsiteView: View {
    @Binding var website: String

    var body: some View {
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
    }
}

struct PasswordView: View {

    @Binding var isSecured: Bool
    @Binding var userPassword: String

    var body: some View {
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
                    withAnimation {
                        isSecured.toggle()
                    }
                })
                {
                    Image(systemName: isSecured ? "eye.slash" : "eye")
                        .padding(.trailing)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.vertical, 6)
        }
    }
}

struct EmailView: View {
    @StateObject var verifyFunctions = VerifyFunctions()

    @Binding var emailAddress: String

    var body: some View {
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
                            .keyboardType(.emailAddress)
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
    }
}


struct HelperViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView(text: "Profile Creation", subText: "Your super-awesome portfolio has been successfully submitted!  The details below will be public within your community!")
            FirstNameView(firstName: .constant("Bluth"))
            ButtonView(text: "OK", enabled: true)
        }
        .padding()
    }
}
