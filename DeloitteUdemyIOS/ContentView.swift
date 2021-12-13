//
//  ContentView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("courses ") var courses = [CourseModel]()
    @AppStorage("cart") var cart: [CourseModel] = []
    @AppStorage("wishlist") var wishlist: [CourseModel] = []

    
    var body: some View {
        
        TabBarGroupView(images: [Image(systemName: "house.fill"),
                        Image(systemName: "cart.fill"),
                        Image(systemName: "heart.fill"),
                        Image(systemName: "person.fill")], tabIndex: 0) .onAppear(){
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
