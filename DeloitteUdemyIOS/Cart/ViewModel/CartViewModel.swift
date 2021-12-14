//
//  CartViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 13/12/21.
//

import Foundation
class CartViewModel{
    
    func getCartTotal(courses: [CourseModel]) -> Double{
        courses.reduce(0) { (res, course) -> Double in
            res + course.priceAfter
        }
    }
    
    func getCartSaved(courses: [CourseModel]) -> Double{
        courses.reduce(0) { (res, course) -> Double in
            res + course.priceBefore - course.priceAfter
        }
    }
}
