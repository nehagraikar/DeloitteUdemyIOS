//
//  UserModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 13/12/21.
//

import Foundation

import SwiftUI

struct UserModel : Codable {

    var id:Int
    var username:String
    var password: String
    var name:String
    var bandName:String
    var role: String
    var skills:String
    var level: String
    var bio:String
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
 
    
}
