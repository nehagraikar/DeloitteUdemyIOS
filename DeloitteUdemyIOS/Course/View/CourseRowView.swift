//
//  CourseRowView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

struct CourseRowView: View {
    
    var item: CourseModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            item.image
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 12) {
                Text("\(item.title)")
                    .font(Font.system(size: 17, weight: .regular, design: .rounded))
                    .fontWeight(.bold)
                HStack{
                    Text("Rs.\(String.init(format: "%.2f", item.price_before))").strikethrough()
                        .foregroundColor(Color.gray)
                    Text("Rs.\(String.init(format: "%.2f", item.price_after))")
                }
                
                    .font(Font.system(size: 17, weight: .semibold, design: .rounded))
            }
            
            Spacer()
               
            
        }
    }
}

struct PCourseRowView_Previews: PreviewProvider {
    
    @State static var item:CourseModel = CourseModel(id: UUID(), title: "SwiftUI", price_before: 130.00,price_after: 100.00, description: "",imageName: "swiftUI")
    
    static var previews: some View {
        CourseRowView(item: item)
    }
}
