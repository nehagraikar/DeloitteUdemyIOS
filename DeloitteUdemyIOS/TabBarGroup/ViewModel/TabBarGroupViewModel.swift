//
//  TabBarGroupViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

class TabBarGroupViewModel {
    var data: TabBarGroupModel
//    @State var courses : [CourseModel]
//    @State var cart:[CourseModel] = []
//    @State var wishlist:[CourseModel] = []
//    
    
    public init() {
        self.data = TabBarGroupModel(segmentsList: [
            Image(systemName: "house.fill"),
            Image(systemName: "cart.fill"),
            Image(systemName: "heart.fill"),
            Image(systemName: "person.fill")
        ])
    }

//    func getRespectiveViewForSelectedSegment(selectedSegment: Int) -> AnyView {
//        switch selectedSegment {
//        case 0:
//            return AnyView(HomeWishlistView(courses: $courses  , cart: $cart, wishlist: $wishlist, title: "Courses"))
//        case 1:
//            return AnyView(CartView(courses: $cart))
//        case 2:
//            return AnyView(HomeWishlistView(courses: $wishlist  , cart: $cart, wishlist: $wishlist, title: "Wishlist"))
//        case 3:
//             return AnyView(Text("Profile.....!"))
//        default:
//            return AnyView(Text("Wrong selection"))
//        }
//    }
}
