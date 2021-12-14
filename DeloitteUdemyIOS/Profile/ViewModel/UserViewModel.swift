//
//  UserViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 13/12/21.
//

import Foundation
import SwiftUI


class UserViewModel : ObservableObject {
    @Published
    var userData: UserModel
    
    public init() {
        self.userData = UserModel(id: 1, username: "neharaikar", password: "123", name: "Neha Raikar", bandName: "B7", role: "SDE - 1", skills: "Java, iOS", level: "Intermediate", bio: "Enthusiastic learner", imageName: "neha")
    }
}
