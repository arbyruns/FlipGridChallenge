//
//  VerifyFunctions.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import Foundation

class VerifyFunctions: ObservableObject {

    func shouldEnableButton(_ name: String, _ email: String) -> Bool {
        var enableButton = false

        if name.isEmpty && email.isEmpty {
            enableButton = false
        } else {
            enableButton = true
        }
        return enableButton
    }

    func validEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)

    }

}
