//
//  CourseDetailView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

struct CourseDetailView: View {
    
    var course:CourseModel
    @Binding var cart:[CourseModel]
    @Binding var wishlist:[CourseModel]
    
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 8) {
                course.image
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(100)
            
                
                HStack{
                    Spacer()
                    VStack(alignment: .center, spacing: 4) {
                        Text(course.title)
                            .font(Font.system(size: 24, weight: .bold, design: .rounded))
                        Text("Rs.\(String(format: "%.2f", course.priceBefore))")
                            .font(Font.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(Color.gray)
                            .strikethrough()
                        Text("Rs.\(String(format: "%.2f", course.priceAfter))")
                            .font(Font.system(size: 19, weight: .semibold, design: .rounded))
                    }
                    Divider()
                    Text(course.description)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                    Spacer()

                }
                
                Divider()
                    .padding()
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    Button(action: {
                        if self.wishlist.contains(where: { (fav) -> Bool in
                            fav.id == self.course.id
                        }) {
                            self.wishlist.removeAll { (fav) -> Bool in
                                fav.id == self.course.id
                            }
                        } else {
                            self.wishlist.append(self.course)
                        }
                        
                        
                        
                    }) {
                        if self.wishlist.contains(where: { (fav) -> Bool in
                            fav.id == course.id
                        }) {
                            Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        } else {
                            Image(systemName: "heart")
                            .foregroundColor(Color.black)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        
                    }
                    
                    Spacer()
                    Button(action: {
                        if self.cart.contains(where: { (item) -> Bool in
                            item.id == self.course.id
                        }) {
                            self.cart.removeAll { (item) -> Bool in
                                item.id == self.course.id
                            }
                        } else {
                            self.cart.append(self.course)
                        }
                    }) {
                        if self.cart.contains(where: { (item) -> Bool in
                            item.id == self.course.id
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Text("IN YOUR CART")
                                Image(systemName: "checkmark")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADD TO CART")
                                Image(systemName: "cart.fill")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.orange)
                            .cornerRadius(10)
                        }
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                
                
               

            }
            .padding(16)
            .padding(.bottom, 70)
        }

    }
}

struct ProductDetail_Previews: PreviewProvider {
    
    @State static var course :CourseModel = CourseModel(id: UUID(), title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "jvnjdrv jdfnjv",imageName: "swiftUI")
    
    @State static var cart:[CourseModel] = [CourseModel(id: UUID(), title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "",imageName: "swiftUI")]
    
    @State static var wishlist:[CourseModel] = []
    
    static var previews: some View {
        CourseDetailView(course: course, cart: $cart, wishlist: $wishlist)
    }
}
