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
    @AppStorage("cart") var cart: [CourseModel] = []
    @AppStorage("wishlist") var wishlist: [CourseModel] = []
    

    
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
                .padding(.top)
                
                Divider()
                    .padding()
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    Button(action:{ CourseDetailViewModel().addToWishlistButtonFunction(course:self.course)}) {
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
                        CourseDetailViewModel().addToCartButtonFunction(course:self.course)
                    }) {
                        if self.cart.contains(where: { (item) -> Bool in
                            item.id == self.course.id
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADDED TO CART")
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
        .navigationBarBackButtonHidden(true)

    }
}

struct ProductDetail_Previews: PreviewProvider {
    
    @State static var course :CourseModel = CourseModel(id: 1, title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "SwiftUI",imageName: "swiftUI")

    static var previews: some View {
        CourseDetailView(course: course)
    }
}
