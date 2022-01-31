//
//  TextFieldView.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import SwiftUI

struct TextFieldView: View {
    let textField: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("First Name")
                    .fontWeight(.semibold)
                RoundedRectangle(cornerRadius: 13)
                    .stroke(.secondary, style: StrokeStyle(lineWidth: 1))
                    .frame(height: 65)
            }
        }
        .padding()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textField: "")
    }
}
