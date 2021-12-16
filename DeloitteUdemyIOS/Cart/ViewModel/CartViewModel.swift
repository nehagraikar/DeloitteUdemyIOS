//
//  CartViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 13/12/21.
//

import Foundation
import SwiftUI

class CartViewModel{
    @AppStorage("cart") var courses: [CourseModel] = []
    
    func getCartTotal() -> Double{
        courses.reduce(0) { (res, course) -> Double in
            res + course.priceAfter
        }
    }
    
    func getCartSaved() -> Double{
        courses.reduce(0) { (res, course) -> Double in
            res + course.priceBefore - course.priceAfter
        }
    }
}
