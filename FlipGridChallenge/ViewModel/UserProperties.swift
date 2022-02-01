//
//  UserProperties.swift
//  FlipGridChallenge
//
//  Created by robevans on 1/31/22.
//

import Foundation
import SwiftUI

class UserProperties: ObservableObject {
    @Published var firstName = ""
    @Published var emailAddress = ""
    @Published var userPassword = ""
    @Published var website = ""
}
