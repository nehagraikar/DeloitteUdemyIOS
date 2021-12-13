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
    var title : String
    @State var searchText : String = ""
    
    var searchResults: [CourseModel] {
            if searchText.isEmpty {
                return courses
            } else {
                return courses.filter { $0.title.contains(searchText) }
            }
        }

    var body: some View {

            return NavigationView {
                VStack{
            Text("")
            ScrollView(.vertical, showsIndicators: true) {
                SearchBar(text: $searchText)
                if courses.count == 0 {

                    VStack(alignment: .center, spacing: 4) {
                        Spacer()
                        Image(systemName: "bag.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.gray)
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.bottom, 20)

                        Text("No Products To Display")
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                }
                List(courses.filter({
                    searchText.isEmpty ? true : $0.title.contains(searchText)
                })){
                    item in
                    Text(item.title)
                }
                
                ForEach(searchResults, id: \.self) { item in
                    NavigationLink(destination:
                        CourseDetailView(course: item))
                    {
                        CourseRowView(item: item)
                            .padding(.horizontal, 20)

                        }

                    }
                }
            
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                        Text("\(title)")
                        .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                }
            }
                }

       
    }
}



struct CourseListView_Previews: PreviewProvider {
    

    @State static var course:CourseModel = CourseModel(id: 1, title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "jhncjdncje",imageName: "swiftUI")
    @State static var items:[CourseModel] = [course, course, course]

    
    static var previews: some View {
        CourseListView(courses: $items, title: "Course")
    }
}

