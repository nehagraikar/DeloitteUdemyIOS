//
//  CourseTests.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 15/12/21.
//

import XCTest
@testable import DeloitteUdemyIOS
import SwiftUI

class CourseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_allPropertiesAreSetCorrectlyForAValidDictionary() {
        
        let course = CourseModel(id: 1, title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "",imageName: "swiftUI")
        
        XCTAssertEqual(course.title, "SwiftUI")
        XCTAssertEqual(course.id, 1)
    }
    
    func test_addToCartFunctionality() {
        
        let course = CourseModel(id: 1, title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "",imageName: "swiftUI")
        let courseDetailViewModel = CourseDetailViewModel()
        @AppStorage("cart") var cart: [CourseModel] = []
        
        
        courseDetailViewModel.addToCartButtonFunction(course: course)
        
        XCTAssertNotNil(cart)
        
    }
    
    func test_addToWishlistFunctionality() {
        
        let course = CourseModel(id: 1, title: "SwiftUI", priceBefore: 130.00,priceAfter: 100.00, description: "",imageName: "swiftUI")
        let courseDetailViewModel = CourseDetailViewModel()
        @AppStorage("wishlist") var wishlist: [CourseModel] = []
        
        
        courseDetailViewModel.addToWishlistButtonFunction(course: course)
        
        XCTAssertNotNil(wishlist)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
