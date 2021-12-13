//
//  CourseDetailModelView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

class CourseDetailViewModel{
    @AppStorage("cart") var cart: [CourseModel] = []
    @AppStorage("wishlist") var wishlist: [CourseModel] = []
    
    func addToWishlistButtonFunction(course:CourseModel)-> Void{
        
        if self.wishlist.contains(where: { (fav) -> Bool in
            fav.id == course.id
        }) {
            self.wishlist.removeAll { (fav) -> Bool in
                fav.id == course.id
            }
        } else {
            self.wishlist.append(course)
        }
        
        
    }
    
    func addToCartButtonFunction(course:CourseModel)-> Void{
        if self.cart.contains(where: { (item) -> Bool in
            item.id == course.id
        }) {
            self.cart.removeAll { (item) -> Bool in
                item.id == course.id
            }
        } else {
            self.cart.append(course)
        }
    }
}
