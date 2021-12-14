//
//  ContentView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("courses") var courses = [CourseModel]()
    @AppStorage("cart") var cart: [CourseModel] = []
    @AppStorage("wishlist") var wishlist: [CourseModel] = []
    
    @State private var selection = 0
    
    var body: some View {
        
//        TabBarGroupView(images: [Image(systemName: "house.fill"),
//                        Image(systemName: "cart.fill"),
//                        Image(systemName: "heart.fill"),
//                        Image(systemName: "person.fill")], tabIndex: 0)
        TabView(selection: $selection){
            CourseListView(courses: $courses, title: "Courses")
                        .tabItem {
                            VStack {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }
                        }
                        .tag(0)
            CartView()
                        .tabItem {
                            VStack {
                                Image(systemName: "cart.fill")
                                Text("Cart")
                            }
                        }
                        .tag(1)
            CourseListView(courses: $wishlist, title: "Wishlist")
                        .tabItem {
                            VStack {
                                Image(systemName: "heart.fill")
                                Text("Wishlist")
                            }
                        }
                        .tag(2)
            ProfileView()
                        .tabItem {
                            VStack {
                                Image(systemName: "person.fill")
                                Text("Profile")
                            }
                        }
                        .tag(3)
                }
        .accentColor(Color(hue: 0.081, saturation: 0.991, brightness: 0.888))
        .onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
        .onAppear(){
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

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
