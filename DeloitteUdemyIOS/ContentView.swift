//
//  ContentView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var courses = [CourseModel]()
    @State var cart:[CourseModel] = []
    @State var wishlist:[CourseModel] = []
    
    var body: some View {
        
        TabBarGroupView(images: [Image(systemName: "house.fill"),
                        Image(systemName: "cart.fill"),
                        Image(systemName: "heart.fill"),
                        Image(systemName: "person.fill")], tabIndex: 0, contentTabs: [
            AnyView(HomeWishlistView(courses: $courses, cart: $cart, wishlist: $wishlist, title: "Courses")),
            AnyView(CartView(courses: $cart)),
            AnyView(HomeWishlistView(courses: $wishlist, cart: $cart, wishlist: $wishlist, title: "Wishlist")),
            AnyView(Text("Profile"))
        ]) .onAppear(){
            apiCall().getCourses{
                (courses) in
                self.courses = courses
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
