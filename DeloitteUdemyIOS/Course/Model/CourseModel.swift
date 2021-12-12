//
//  CourseModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

struct CourseModel :Hashable, Codable, Identifiable{

    var id:Int
    var title:String
    var priceBefore:Double
    var priceAfter:Double
    var description:String
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
}
