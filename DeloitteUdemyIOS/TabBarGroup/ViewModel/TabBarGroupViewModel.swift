//
//  TabBarGroupViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

class TabBarGroupViewModel {

    @AppStorage("courses ") var courses = [CourseModel]()
    @AppStorage("wishlist") var wishlist: [CourseModel] = []

    
    func getRespectiveViewForSelectedSegment(selectedSegment: Int) -> AnyView {
        switch selectedSegment {
        case 0:
            return AnyView(CourseListView(courses: $courses, title: "Home"))
        case 1:
            return AnyView(CartView())
        case 2:
            return AnyView(CourseListView(courses: $wishlist, title: "Wishlist"))
        case 3:
             return AnyView(Text("Profile.....!"))
        default:
            return AnyView(Text("Wrong selection"))
        }
    }
}
