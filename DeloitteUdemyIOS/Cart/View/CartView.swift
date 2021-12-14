//
//  CartViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 12/12/21.
//

import Foundation
import SwiftUI

struct CartView: View {
    

    @AppStorage("cart") var courses: [CourseModel] = []
    @State private var isEditing:Bool = false
    
    
    var body: some View {
        let cartTotal = CartViewModel().getCartTotal(courses: courses)
        let cartSaved = CartViewModel().getCartSaved(courses: courses)

        VStack(alignment: .center, spacing: 0) {
            
            ZStack {

                // Header - "Your Cart"
                VStack{
                Text("Your Cart")
                    .font(Font.system(size: 20, weight: .bold, design: .rounded))
                    
                Text("\(courses.count) Item\(courses.count == 1 ? "" : "s")")
                    .font(Font.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.gray)
                    
                
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isEditing = !self.isEditing
                        }
                        
                    }) {
                        if self.isEditing {
                            Text("Done")
                            .font(Font.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 20)
                        } else {
                            Image(systemName: "ellipsis")
                            .padding(.trailing, 20)
                        }
                        
                    }
                }
                
                
            }
            .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: true) {
                // Items in Cart
                
                ForEach(courses, id: \.id) { item in
                    HStack {
                        CourseRowView(item: item)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        
                        if self.isEditing {
                            Button(action: {
                                self.courses.removeAll { (prod) -> Bool in
                                    prod.id == item.id
                                }
                            }) {
                                Image(systemName: "trash.fill")
                                .padding(.trailing, 20)
                            }.foregroundColor(Color.red)
                        }
                    }
                }

                // Shipping and Total Row
                HStack(alignment: .center, spacing: 12) {

                    
                    // Total cost and saved amount
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Total:")
                            .foregroundColor(Color.gray)
                            .font(Font.system(size: 14, weight: .semibold, design: .default))
                        Text("Rs.\(String(format: "%.2f", cartTotal))")
                            .font(Font.system(size: 20, weight: .heavy, design: .rounded))
                        Text("You have saved Rs.\(String(format: "%.2f", cartSaved))")
                            .font(Font.system(size: 15, design: .rounded))
                            .fontWeight(.regular)
                            .foregroundColor(Color.red)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                // Checkout Button
                GeometryReader { geometry in
                    Button(action: {
                        
                    }) {
                        if self.courses.count == 0 {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Cart Empty")
                                Image(systemName: "xmark")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Checkout")
                                Image(systemName: "arrow.right")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(hue: 0.359, saturation: 1.0, brightness: 0.677))
                            .cornerRadius(20)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding([.top, .leading], 30.0)
                .padding(.bottom, 100) // Add Space at bottom of Scroll View
            }
            
            
        }
        .padding(.bottom, 30.0)
        
    }
}

struct CartView_Previews: PreviewProvider {
    

    static var course: CourseModel = CourseModel(id: 1, title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "",imageName: "swiftUI")
    @State static var c:[CourseModel] = [course,course,course]
    
    static var previews: some View {
        CartView(courses: c)
    }
}
