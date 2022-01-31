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
        if email.contains("@") {
            return true
        } else {
            return false
        }

    }

}
