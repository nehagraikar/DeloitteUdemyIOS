//
//  HomeWishlistView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

struct HomeWishlistView: View {
    
    @Binding var courses:[CourseModel]
    @Binding var cart:[CourseModel]
    @Binding var wishlist:[CourseModel]
    var title: String


    var body: some View {
        VStack(alignment: .center, spacing: 0) {

            Text("\(title)")
                    .font(Font.system(size: 20, weight: .bold, design: .rounded))
            Text("\(courses.count) Item\(courses.count == 1 ? "" : "s")")
                .font(Font.system(size: 13, weight: .semibold, design: .rounded))
                .foregroundColor(Color.gray)
                .padding(.top)
                
            
            CourseListView(courses: $courses, cart: $cart, wishlist: $wishlist)
                .padding(.bottom)
        }
    }
}



struct HomeWishlistView_Previews: PreviewProvider {
    

    @State static var course:CourseModel = CourseModel(id: UUID(), title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "jhncjdncje",imageName: "swiftUI")
    @State static var items:[CourseModel] = [course, course, course,course,course,course,course,course]
    @State static var cart:[CourseModel] = [course,course]
    
    @State static var wishlist:[CourseModel] = [course]
    
    static var previews: some View {
        HomeWishlistView(courses: $items, cart: $cart, wishlist: $wishlist, title: "Courses")
    }
}
