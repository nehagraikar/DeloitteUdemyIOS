//
//  CourseList.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

struct CourseListView: View {
    
    @Binding var courses:[CourseModel]
    @Binding var cart:[CourseModel]
    @Binding var wishlist:[CourseModel]


    var body: some View {

            return NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(courses) { item in
                    NavigationLink(destination:
                        CourseDetailView(course: item, cart: self.$cart, wishlist: self.$wishlist))
                    {
                        CourseRowView(item: item)
                            .padding(.horizontal, 20)
                            
                    }
                    
                    }
                
                }
            
            }
            .padding(.bottom, 50)

        
    }
}



struct CourseListView_Previews: PreviewProvider {
    

    @State static var course:CourseModel = CourseModel(id: UUID(), title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "jhncjdncje",imageName: "swiftUI")
    @State static var items:[CourseModel] = [course, course, course]
    @State static var cart:[CourseModel] = [course,course]
    
    @State static var wishlist:[CourseModel] = [course]
    
    static var previews: some View {
        CourseListView(courses: $items, cart: $cart, wishlist: $wishlist)
    }
}
