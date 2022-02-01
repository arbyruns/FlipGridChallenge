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
                    .bold()
                Text(subText)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}


struct ButtonView: View {

    let text: String

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.red)
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


struct HelperViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView(text: "nil", subText: "nilnil")
            FirstNameView(firstName: .constant("Bluth"))
            ButtonView(text: "OK")
        }
        .padding()
    }
}
